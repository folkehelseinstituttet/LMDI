### C# Kodeeksempler


#### 1. Lage komprimert, kryptert og signert bundle (`SignertKryptertBundle`) med SignertKryptertBundleHandler

Denne klassen håndterer kryptering, signering og komprimering av data ved bruk av X.509-sertifikater. Den tilbyr funksjonalitet for å:

- Komprimere meldingsinnhold med GZip
- Kryptere data med AES-GCM for sikker overføring
- Kryptere AES-nøkler med mottakers offentlige RSA-nøkkel
- Signere meldinger med avsenders private RSA-nøkkel
- Opprette en samlet bundle av meldingsdata med metadata, kryptert innhold og signatur

Klassen bruker sertifikater fra Windows Certificate Store og krever thumbprints for både avsender- og mottakersertifikater.


```csharp
using System.IO.Compression;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;

// Håndterer kryptering, signering og komprimering av meldingsinnhold med X.509-sertifikater
public class SignertKryptertBundleHandler(
    StoreName storeName,
    StoreLocation storeLocation,
    string receiverThumbprint,
    string senderThumbprint,
    string senderOrganizationIdentifier)
{
    // Oppretter en signert og kryptert meldingsbundle med komprimert innhold
    public SignertKryptertBundle CreateSignertKryptertBundle(
        string messageId,
        string content,
        DateTime rapporteringFra,
        DateTime rapporteringTil)
    {
        const string messageFormatVersion = "1.0";

        // Komprimerer innholdet
        byte[] compressedContent = CompressContent(content);

        // Genererer krypteringsnøkler
        (byte[] key, byte[] nonce, byte[] authenticationTag) = GenerateEncryptionKeys();

        // Krypterer det komprimerte innholdet
        byte[] encryptedContent = EncryptContent(compressedContent, key, nonce, authenticationTag);

        // Krypterer AES-nøkkelen med mottakers offentlige RSA-nøkkel
        byte[] encryptedKey = EncryptKey(key, receiverThumbprint);

        // Signerer meldingen med avsenders private RSA-nøkkel
        byte[] signature = SignMessage(encryptedContent, senderThumbprint);

        // Oppretter og returnerer den komplette bundlen
        return new SignertKryptertBundle
        {
            EncryptedContent = encryptedContent,
            RapporteringFra = rapporteringFra,
            RapporteringTil = rapporteringTil,
            EncryptionCertificateThumbprint = receiverThumbprint,
            EncryptedKey = encryptedKey,
            MessageFormatVersion = messageFormatVersion,
            Nonce = nonce,
            AuthenticationTag = authenticationTag,
            MessageId = messageId,
            GeneratedAt = DateTime.UtcNow,
            SenderOrganizationIdentifier = senderOrganizationIdentifier,
            SignatureCertificateThumbprint = senderThumbprint,
            Signature = signature
        };
    }

    // Komprimerer et string-innhold med GZip
    private byte[] CompressContent(string content)
    {
        try
        {
            using var outputStream = new MemoryStream();
            using (var gzipStream = new GZipStream(outputStream, CompressionLevel.Optimal))
            using (var writer = new StreamWriter(gzipStream))
            {
                writer.Write(content);
            }
            return outputStream.ToArray();
        }
        catch (Exception ex)
        {
            throw new Exception($"Komprimering av innhold ({content.Length} tegn) feilet: {ex.Message}", ex);
        }
    }

    // Genererer krypteringsnøkler for AES-GCM
    private (byte[] Key, byte[] Nonce, byte[] AuthenticationTag) GenerateEncryptionKeys()
    {
        var key = new byte[32]; // 256-bit nøkkel
        var nonce = new byte[12]; // 96-bit nonce
        var authenticationTag = new byte[16]; // 128-bit tag

        try
        {
            RandomNumberGenerator.Fill(key);
            RandomNumberGenerator.Fill(nonce);
            return (key, nonce, authenticationTag);
        }
        catch (Exception ex)
        {
            throw new Exception($"Feil ved generering av AES-nøkkel/nonce: {ex.Message}", ex);
        }
    }

    // Krypterer innhold med AES-GCM
    private byte[] EncryptContent(byte[] compressedContent, byte[] key, byte[] nonce, byte[] authenticationTag)
    {
        var encryptedContent = new byte[compressedContent.Length];

        try
        {
            using var aes = new AesGcm(key, authenticationTag.Length);
            aes.Encrypt(nonce, compressedContent, encryptedContent, authenticationTag);
            return encryptedContent;
        }
        catch (Exception ex)
        {
            throw new Exception($"Feil ved kryptering av innhold (lengde: {compressedContent.Length}) med AES-GCM: {ex.Message}", ex);
        }
    }

    // Krypterer AES-nøkkelen med mottakers RSA offentlige nøkkel
    private byte[] EncryptKey(byte[] key, string receiverThumbprint)
    {
        try
        {
            var receiverRsa = GetRsaPublicKey(receiverThumbprint);
            if (receiverRsa is null)
            {
                throw new InvalidOperationException($"Offentlig nøkkel ikke tilgjengelig i mottakerens sertifikat (thumbprint: {receiverThumbprint}).");
            }

            return receiverRsa.Encrypt(key, RSAEncryptionPadding.OaepSHA256);
        }
        catch (Exception ex)
        {
            throw new Exception($"Hente sertifikat og kryptere nøkkel feilet: {ex.Message}", ex);
        }
    }

    // Signerer meldingsinnholdet med avsenders private RSA-nøkkel
    private byte[] SignMessage(byte[] encryptedContent, string senderThumbprint)
    {
        try
        {
            var senderRsa = GetRsaPrivateKey(senderThumbprint);
            if (senderRsa is null)
            {
                throw new InvalidOperationException($"Privat nøkkel ikke tilgjengelig i sertifikatet med thumbprint {senderThumbprint}.");
            }

            var messageHash = SHA256.HashData(encryptedContent);
            return senderRsa.SignHash(
                messageHash,
                HashAlgorithmName.SHA256,
                RSASignaturePadding.Pkcs1);
        }
        catch (Exception ex)
        {
            throw new Exception($"Signering av melding feilet: {ex.Message}", ex);
        }
    }

    // Henter RSA offentlig nøkkel fra et sertifikat basert på thumbprint
    private RSA GetRsaPublicKey(string thumbprint)
    {
        var certificate = GetCertificateByThumbprint(thumbprint);
        if (certificate is null)
        {
            throw new Exception($"Sertifikat med thumbprint {thumbprint} ble ikke funnet.");
        }

        var rsa = certificate.GetRSAPublicKey();
        if (rsa is null)
        {
            throw new InvalidOperationException($"Offentlig nøkkel ikke tilgjengelig i sertifikatet med thumbprint {thumbprint}.");
        }

        return rsa;
    }

    // Henter RSA privat nøkkel fra et sertifikat basert på thumbprint
    private RSA GetRsaPrivateKey(string thumbprint)
    {
        var certificate = GetCertificateByThumbprint(thumbprint);
        if (certificate is null)
        {
            throw new Exception($"Sertifikat med thumbprint {thumbprint} ble ikke funnet.");
        }

        var rsa = certificate.GetRSAPrivateKey();
        if (rsa is null)
        {
            throw new InvalidOperationException($"Privat nøkkel ikke tilgjengelig i sertifikatet med thumbprint {thumbprint}.");
        }

        return rsa;
    }

    // Henter et X.509-sertifikat fra sertifikatlageret basert på thumbprint
    private X509Certificate2 GetCertificateByThumbprint(string thumbprint)
    {
        try
        {
            using var store = new X509Store(storeName, storeLocation);
            store.Open(OpenFlags.ReadOnly);

            var result = store.Certificates.Find(
                X509FindType.FindByThumbprint,
                thumbprint,
                validOnly: false);

            if (result is null || result.Count == 0)
            {
                throw new Exception(
                    $"Fant ikke sertifikat i store med thumbprint: {thumbprint}");
            }

            var certificate = result[0];
            return certificate
                   ?? throw new Exception(
                       $"Certificate med thumbprint {thumbprint} er null eller ugyldig.");
        }
        catch (Exception ex)
        {
            throw new Exception(
                $"Feil i 'GetCertificateByThumbprint' under operasjon 'Finne sertifikat i store': {ex.Message}",
                ex);
        }
    }
}
```

##### SignertKryptertBundle

```csharp
public sealed class SignertKryptertBundle
{
    // Metadata (ukryptert)
    public required string MessageId { get; init; }
    public required DateTime GeneratedAt { get; init; }
    public required string SenderOrganizationIdentifier { get; init; }
    public required string MessageFormatVersion { get; init; }

    // Sikkerhetsinformasjon
    public required string EncryptionCertificateThumbprint { get; init; }
    public required byte[] EncryptedKey { get; init; }
    public required byte[] Nonce { get; init; }
    public required byte[] AuthenticationTag { get; init; }

    // Payload
    public required DateTime RapporteringFra { get; init; }
    public required DateTime RapporteringTil { get; init; }
    public required byte[] EncryptedContent { get; init; }

    // Integritetssikring
    public required string SignatureCertificateThumbprint { get; init; }
    public required byte[] Signature { get; init; }
}
```
