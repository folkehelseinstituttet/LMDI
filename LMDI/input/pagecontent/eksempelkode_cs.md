### C# Kodeeksempler

- [C# Kodeeksempler](#c-kodeeksempler)
  - [1. Lage komprimert, kryptert og signert bundle (`SignertKryptertBundle`)](#1-lage-komprimert-kryptert-og-signert-bundle-signertkryptertbundle)
    - [SignertKryptertBundleHandler](#signertkryptertbundlehandler)
    - [SignertKryptertBundle](#signertkryptertbundle)
  - [2. Autorisering med HelseID](#2-autorisering-med-helseid)
    - [AccessTokenService](#accesstokenservice)
    - [ClientAssertionBuilder](#clientassertionbuilder)
    - [ClientCredentialRequestBuilder](#clientcredentialrequestbuilder)
    - [DPoPProofBuilder](#dpopproofbuilder)
    - [HttpRequestMessageBuilder](#httprequestmessagebuilder)

---

#### 1. Lage komprimert, kryptert og signert bundle (`SignertKryptertBundle`)

Denne klassen håndterer kryptering, signering og komprimering av data ved bruk av X.509-sertifikater. Den tilbyr funksjonalitet for å:

- Komprimere meldingsinnhold med GZip
- Kryptere data med AES-GCM for sikker overføring
- Kryptere AES-nøkler med mottakers offentlige RSA-nøkkel
- Signere meldinger med avsenders private RSA-nøkkel
- Opprette en samlet bundle av meldingsdata med metadata, kryptert innhold og signatur

Klassen bruker sertifikater fra Windows Certificate Store og krever thumbprints for både avsender- og mottakersertifikater.

##### SignertKryptertBundleHandler

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

---

#### 2. Autorisering med HelseID

Eksemplene under viser hvordan man bruker klientlegitimasjon med DPoP (Proof-of-Possession) eller vanlig Bearer-token for å få tilgang via HelseID, samt generering av nødvendige JWT-er og DPoP-bevis.


##### AccessTokenService

```csharp
using Duende.IdentityModel.Client;

// AccessTokenService: Henter access token med eller uten DPoP
/// <summary>
/// Gets a DPoP-bound access token with the client-credentials flow,
/// automatically handling the nonce round-trip mandated by RFC 9449
/// and HelseId.
/// </summary>
public class AccessTokenService
{
    private readonly HttpClient _http;
    private readonly string _clientId;
    private readonly string _privateJwk;     
    private readonly string _issuer;         
    private readonly string _tokenEndpoint;  
    private string _scope;                   

    public AccessTokenService(
        HttpClient http,
        string clientId,
        string privateJwkJson,
        string issuer,
        string scope,
        string tokenEndpoint)
    {
        _http = http;
        _clientId = clientId;
        _privateJwk = privateJwkJson;
        _issuer = issuer;
        _tokenEndpoint = tokenEndpoint;
        _scope = scope;
    }

    public async Task<string> GetDpopAccessTokenAsync(CancellationToken ct = default)
    {
        var response = await RequestDpopAsync(nonce: null, ct);

        if (response.Error == "use_dpop_nonce" && !string.IsNullOrWhiteSpace(response.DPoPNonce))
        {
            response = await RequestDpopAsync(response.DPoPNonce, ct);
        }

        if (response.IsError)
        {
            throw new InvalidOperationException($"Dpop token request failed: {response.Error}");
        }

        return response.AccessToken!;
    }

    public async Task<string> GetBearerAccessTokenAsync(CancellationToken ct = default)
    {
        var response = await RequestBearerAsync(ct);

        if (response.IsError)
        {
            throw new InvalidOperationException($"Bearer token request failed: {response.Error}");
        }

        return response.AccessToken!;
    }


    private async Task<TokenResponse> RequestDpopAsync(string? nonce, CancellationToken ct)
    {
        var request = new ClientCredentialRequestBuilder()
                            .Create(_tokenEndpoint, _clientId)
                            .WithClientAssertion(_issuer, _privateJwk)
                            .WithDpopProof("POST", _tokenEndpoint, _privateJwk, nonce)
                            .WithScope(_scope)
                            .Build();


        return await _http.RequestClientCredentialsTokenAsync(request, ct);
    }

    private async Task<TokenResponse> RequestBearerAsync(CancellationToken ct)
    {
        var request = new ClientCredentialRequestBuilder()
                            .Create(_tokenEndpoint, _clientId)
                            .WithClientAssertion(_issuer, _privateJwk)
                            .WithScope(_scope)
                            .Build();


        return await _http.RequestClientCredentialsTokenAsync(request, ct);
    }
}

```


##### ClientAssertionBuilder


```csharp
using System.IdentityModel.Tokens.Jwt;         
using Microsoft.IdentityModel.Tokens;

public static class ClientAssertionBuilder
{
    public static string Create(string clientId, string audience, string privateJwkJson)
    {
        var jwk = new JsonWebKey(privateJwkJson);                  

        var creds = new SigningCredentials(jwk, SecurityAlgorithms.RsaSsaPssSha512);   

        var now = DateTimeOffset.UtcNow;

        var token = new JwtSecurityToken(
            issuer: clientId,                       
            audience: audience,                     
            notBefore: now.UtcDateTime,             
            expires: now.AddMinutes(1).UtcDateTime, 
            signingCredentials: creds);

        token.Payload["sub"] = clientId;
        token.Payload["jti"] = Guid.NewGuid().ToString();

        token.Header["typ"] = "client-authentication+jwt";

        return new JwtSecurityTokenHandler().WriteToken(token);
    }
}
```

##### ClientCredentialRequestBuilder

```csharp
using Duende.IdentityModel;
using Duende.IdentityModel.Client;

public class ClientCredentialRequestBuilder
{
    private ClientCredentialsTokenRequest _request = new();
    public ClientCredentialRequestBuilder Create(
        string tokenEndpoint,
        string clientId,
        string grantType = OidcConstants.GrantTypes.ClientCredentials,
        ClientCredentialStyle credentialStyle = ClientCredentialStyle.PostBody)
    {
        _request = new()
        {
            ClientId = clientId,
            Address = tokenEndpoint,
            GrantType = grantType,
            ClientCredentialStyle = credentialStyle
        };

        return this;
    }


    public ClientCredentialRequestBuilder WithDpopProof(string httpMethod, string uri, string privateJwk, string? nonce)
    {
        string proof = DPoPProofBuilder.Create(
                            httpMethod,
                            uri,
                            privateJwk,
                            nonce: nonce,
                            accessToken: null);

        _request.DPoPProofToken = proof;

        return this;
    }

    public ClientCredentialRequestBuilder WithClientAssertion(string issuer, string privateJwk, string type = OidcConstants.ClientAssertionTypes.JwtBearer)
    {
        string assertion = ClientAssertionBuilder.Create(
                                clientId: _request.ClientId!,
                                audience: issuer,
                                privateJwkJson: privateJwk);

        _request.ClientAssertion = new ClientAssertion
        {
            Type = type,
            Value = assertion
        };
        return this;
    }

    public ClientCredentialRequestBuilder WithScope(string scope)
    {
        _request.Scope = scope;

        return this;
    }

    public ClientCredentialsTokenRequest Build()
    {
        return _request;
    }
}
```

##### DPoPProofBuilder

```csharp
using Microsoft.IdentityModel.Tokens;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;

/// <summary>
/// Utility for generating a RFC‑9449 DPoP proof JWT ("dpop+jwt")
/// </summary>
public static class DPoPProofBuilder
{
    /// <summary>
    /// Builds a signed DPoP proof JWT.
    /// </summary>
    /// <param name="httpMethod">HTTP verb (GET, POST, …) – must be UPPER‑CASE as per spec.</param>
    /// <param name="httpUri">Absolute request URI (scheme + host + path + optional query).</param>
    /// <param name="privateKeyJson">RSA private JWK.</param>
    /// <param name="nonce">Optional <c>nonce</c> value provided by the authorization server.</param>
    /// <param name="ath">Optional <c>ath</c> claim (SHA‑256 hash of the access‑token).</param>
    /// <returns>Compact‑serialised DPoP proof token.</returns>
    public static string Create(
        string httpMethod,
        string httpUri,
        string privateKeyJson,
        string? nonce = null,
        string? accessToken = null)
    {
        if (string.IsNullOrWhiteSpace(httpMethod)) throw new ArgumentNullException(nameof(httpMethod));
        if (string.IsNullOrWhiteSpace(httpUri)) throw new ArgumentNullException(nameof(httpUri));
        if (string.IsNullOrWhiteSpace(privateKeyJson)) throw new ArgumentNullException(nameof(privateKeyJson));

        // 1. Parse JWK and import into RSA
        var jwk = new JsonWebKey(privateKeyJson);
        using var rsa = RSA.Create();
        rsa.ImportParameters(ToRsaParameters(jwk));

        // 2. Build JWT header
        var headerObj = new Dictionary<string, object>
        {
            ["alg"] = "PS512",
            ["typ"] = "dpop+jwt",
            ["jwk"] = new Dictionary<string, object>
            {
                ["kty"] = "RSA",
                ["n"] = jwk.N,
                ["e"] = jwk.E,
                ["alg"] = "PS512"
            }
        };
        var headerJson = JsonSerializer.Serialize(headerObj);
        var headerEncoded = Base64UrlEncoder.Encode(Encoding.UTF8.GetBytes(headerJson));

        // 3. Build JWT payload
        var payloadObj = new Dictionary<string, object>
        {
            ["htm"] = httpMethod.ToUpperInvariant(),
            ["htu"] = httpUri,
            ["iat"] = DateTimeOffset.UtcNow.ToUnixTimeSeconds(),
            ["jti"] = Guid.NewGuid().ToString()
        };

        if (!string.IsNullOrWhiteSpace(nonce))
        {
            payloadObj["nonce"] = nonce;
        }

        string? ath = ComputeAth(accessToken);
        if (ath != null)
        {
            payloadObj["ath"] = ath;
        }
            
        var payloadJson = JsonSerializer.Serialize(payloadObj);
        var payloadEncoded = Base64UrlEncoder.Encode(Encoding.UTF8.GetBytes(payloadJson));

        // 4. Sign
        var unsignedToken = $"{headerEncoded}.{payloadEncoded}";
        var signature = rsa.SignData(
            Encoding.UTF8.GetBytes(unsignedToken),
            HashAlgorithmName.SHA512,
            RSASignaturePadding.Pss);
        var signatureEncoded = Base64UrlEncoder.Encode(signature);

        return $"{unsignedToken}.{signatureEncoded}";
    }

    private static string? ComputeAth(string? accessToken)
    {
        if (string.IsNullOrWhiteSpace(accessToken)) return null;

        byte[] hash = SHA256.HashData(Encoding.UTF8.GetBytes(accessToken.Trim()));
        return Base64UrlEncoder.Encode(hash);       
    }

    private static RSAParameters ToRsaParameters(JsonWebKey jwk)
    {
        return new RSAParameters
        {
            Modulus = Base64UrlEncoder.DecodeBytes(jwk.N),
            Exponent = Base64UrlEncoder.DecodeBytes(jwk.E),
            D = Base64UrlEncoder.DecodeBytes(jwk.D),
            P = Base64UrlEncoder.DecodeBytes(jwk.P),
            Q = Base64UrlEncoder.DecodeBytes(jwk.Q),
            DP = Base64UrlEncoder.DecodeBytes(jwk.DP),
            DQ = Base64UrlEncoder.DecodeBytes(jwk.DQ),
            InverseQ = Base64UrlEncoder.DecodeBytes(jwk.QI)
        };
    }
}
```

##### HttpRequestMessageBuilder

```csharp
public class HttpRequestMessageBuilder
{
    private HttpRequestMessage? _httpRequest;
    public HttpRequestMessageBuilder Create(HttpMethod method, Uri uri)
    {
        _httpRequest = new HttpRequestMessage(method, uri);
        return this;
    }

    public HttpRequestMessageBuilder WithDpop(string privateJwk, string accessToken)
    {
        var dpopProof = DPoPProofBuilder.Create(
            httpMethod:  _httpRequest!.Method.ToString(),
            httpUri: _httpRequest!.RequestUri!.ToString(),
            privateKeyJson : privateJwk,
            nonce: null,
            accessToken: accessToken);

        _httpRequest!.Headers.TryAddWithoutValidation("Authorization", "DPoP " + accessToken);
        _httpRequest!.Headers.TryAddWithoutValidation("DPoP", dpopProof);
        return this;
    }

    public HttpRequestMessageBuilder WithBearer(string accessToken)
    {
        _httpRequest!.Headers.TryAddWithoutValidation("Authorization", "Bearer " + accessToken);
        return this;
    }

    public HttpRequestMessageBuilder WithContent(HttpContent content)
    {
        _httpRequest!.Content = content;
        return this;
    }

    public HttpRequestMessage Build()
    {
        return _httpRequest!;
    }
}
```