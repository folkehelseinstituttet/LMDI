### C# Code Examples

- [C# Code Examples](#c-code-examples)
  - [1. Creating a compressed, encrypted and signed bundle (`SignedEncryptedBundle`)](#1-creating-a-compressed-encrypted-and-signed-bundle-signedencryptedbundle)
    - [SignertKryptertBundleHandler](#signertkryptertbundlehandler)
    - [SignertKryptertBundle](#signertkryptertbundle)

---

#### 1. Creating a compressed, encrypted and signed bundle (`SignedEncryptedBundle`)

This class handles encryption, signing and compression of data using X.509 certificates. It provides functionality to:

- Compress message content with GZip
- Encrypt data with AES-GCM for secure transfer
- Encrypt AES keys with the recipient's public RSA key
- Sign messages with the sender's private RSA key
- Create a combined bundle of message data with metadata, encrypted content and signature

The class uses certificates from the Windows Certificate Store and requires thumbprints for both sender and recipient certificates.

##### SignertKryptertBundleHandler

```csharp
using System.IO.Compression;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;

// Handles encryption, signing and compression of message content using X.509 certificates
public class SignertKryptertBundleHandler(
    StoreName storeName,
    StoreLocation storeLocation,
    string receiverThumbprint,
    string senderThumbprint,
    string senderOrganizationIdentifier)
{
    // Creates a signed and encrypted message bundle with compressed content
    public SignertKryptertBundle CreateSignertKryptertBundle(
        string messageId,
        string content,
        DateTime rapporteringFra,
        DateTime rapporteringTil)
    {
        const string messageFormatVersion = "1.0";

        // Compress the content
        byte[] compressedContent = CompressContent(content);

        // Generate encryption keys
        (byte[] key, byte[] nonce, byte[] authenticationTag) = GenerateEncryptionKeys();

        // Encrypt the compressed content
        byte[] encryptedContent = EncryptContent(compressedContent, key, nonce, authenticationTag);

        // Encrypt the AES key with the recipient's public RSA key
        byte[] encryptedKey = EncryptKey(key, receiverThumbprint);

        // Sign the message with the sender's private RSA key
        byte[] signature = SignMessage(encryptedContent, senderThumbprint);

        // Create and return the complete bundle
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

    // Compresses a string content with GZip
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
            throw new Exception($"Compression of content ({content.Length} characters) failed: {ex.Message}", ex);
        }
    }

    // Generates encryption keys for AES-GCM
    private (byte[] Key, byte[] Nonce, byte[] AuthenticationTag) GenerateEncryptionKeys()
    {
        var key = new byte[32]; // 256-bit key
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
            throw new Exception($"Error generating AES key/nonce: {ex.Message}", ex);
        }
    }

    // Encrypts content with AES-GCM
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
            throw new Exception($"Error encrypting content (length: {compressedContent.Length}) with AES-GCM: {ex.Message}", ex);
        }
    }

    // Encrypts the AES key with the recipient's RSA public key
    private byte[] EncryptKey(byte[] key, string receiverThumbprint)
    {
        try
        {
            var receiverRsa = GetRsaPublicKey(receiverThumbprint);
            if (receiverRsa is null)
            {
                throw new InvalidOperationException($"Public key not available in recipient's certificate (thumbprint: {receiverThumbprint}).");
            }

            return receiverRsa.Encrypt(key, RSAEncryptionPadding.OaepSHA256);
        }
        catch (Exception ex)
        {
            throw new Exception($"Retrieving certificate and encrypting key failed: {ex.Message}", ex);
        }
    }

    // Signs the message content with the sender's private RSA key
    private byte[] SignMessage(byte[] encryptedContent, string senderThumbprint)
    {
        try
        {
            var senderRsa = GetRsaPrivateKey(senderThumbprint);
            if (senderRsa is null)
            {
                throw new InvalidOperationException($"Private key not available in certificate with thumbprint {senderThumbprint}.");
            }

            var messageHash = SHA256.HashData(encryptedContent);
            return senderRsa.SignHash(
                messageHash,
                HashAlgorithmName.SHA256,
                RSASignaturePadding.Pkcs1);
        }
        catch (Exception ex)
        {
            throw new Exception($"Signing of message failed: {ex.Message}", ex);
        }
    }

    // Retrieves RSA public key from a certificate based on thumbprint
    private RSA GetRsaPublicKey(string thumbprint)
    {
        var certificate = GetCertificateByThumbprint(thumbprint);
        if (certificate is null)
        {
            throw new Exception($"Certificate with thumbprint {thumbprint} was not found.");
        }

        var rsa = certificate.GetRSAPublicKey();
        if (rsa is null)
        {
            throw new InvalidOperationException($"Public key not available in certificate with thumbprint {thumbprint}.");
        }

        return rsa;
    }

    // Retrieves RSA private key from a certificate based on thumbprint
    private RSA GetRsaPrivateKey(string thumbprint)
    {
        var certificate = GetCertificateByThumbprint(thumbprint);
        if (certificate is null)
        {
            throw new Exception($"Certificate with thumbprint {thumbprint} was not found.");
        }

        var rsa = certificate.GetRSAPrivateKey();
        if (rsa is null)
        {
            throw new InvalidOperationException($"Private key not available in certificate with thumbprint {thumbprint}.");
        }

        return rsa;
    }

    // Retrieves an X.509 certificate from the certificate store based on thumbprint
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
                    $"Certificate not found in store with thumbprint: {thumbprint}");
            }

            var certificate = result[0];
            return certificate
                   ?? throw new Exception(
                       $"Certificate with thumbprint {thumbprint} is null or invalid.");
        }
        catch (Exception ex)
        {
            throw new Exception(
                $"Error in 'GetCertificateByThumbprint' during operation 'Find certificate in store': {ex.Message}",
                ex);
        }
    }
}
```

##### SignertKryptertBundle

```csharp
public sealed class SignertKryptertBundle
{
    // Metadata (unencrypted)
    public required string MessageId { get; init; }
    public required DateTime GeneratedAt { get; init; }
    public required string SenderOrganizationIdentifier { get; init; }
    public required string MessageFormatVersion { get; init; }

    // Security information
    public required string EncryptionCertificateThumbprint { get; init; }
    public required byte[] EncryptedKey { get; init; }
    public required byte[] Nonce { get; init; }
    public required byte[] AuthenticationTag { get; init; }

    // Payload
    public required DateTime RapporteringFra { get; init; }
    public required DateTime RapporteringTil { get; init; }
    public required byte[] EncryptedContent { get; init; }

    // Integrity assurance
    public required string SignatureCertificateThumbprint { get; init; }
    public required byte[] Signature { get; init; }
}
```
