# Powershell eksempelkode - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Integrasjon**](integrasjon.md)
* **Powershell eksempelkode**

### Powershell Kodeeksempler

* [Powershell Kodeeksempler](#powershell-kodeeksempler) 
* [1. Lage komprimert, kryptert og signert bundle (`SignertKryptertBundle`)](#1-lage-komprimert-kryptert-og-signert-bundle-signertkryptertbundle) 
* [Slik bruker du scriptet:](#slik-bruker-du-scriptet)
 
* [2. Send`SignertKryptertBundle`til Legemiddelregisteret](#2-send-signertkryptertbundle-til-legemiddelregisteret) 
* [Slik bruker du scriptet:](#slik-bruker-du-scriptet-1)
* [Upload.ps1](#uploadps1)
* [ClientCredentials.ps1](#clientcredentialsps1)
* [GenerateClientAssertion.ps1](#generateclientassertionps1)
* [GenerateDPoPToken.ps1](#generatedpoptokenps1)
 
 

-------

#### 1. Lage komprimert, kryptert og signert bundle (SignertKryptertBundle)

Dette scriptet lager en `SignertKryptertBundle` ved hjelp av PowerShell 7+. Det utfører komprimering med GZip, kryptering med AES-GCM og signering med X.509-sertifikater.

##### Slik bruker du scriptet:

```
.\LagSignertKryptertBundle.ps1 `
    -DatafilPath "C:\Sti\Til\MeldingsInnhold.json" `
    -OutputFilePath "C:\Sti\Til\Output\SignertKryptertBundle.json" `
    -ReceiverThumbprint "ABCDEF1234567890ABCDEF1234567890ABCDEF12" `
    -SenderThumbprint "1234567890ABCDEF1234567890ABCDEF12345678" `
    -SenderOrganizationIdentifier "123456789" `
    -RapporteringFra "2024-01-01T00:00:00Z" `
    -RapporteringTil "2024-01-31T23:59:59Z"


```

Scriptet utfører følgende oppgaver:

* Leser innholdet fra en datafil
* Komprimerer innholdet med GZip
* Genererer en tilfeldig AES-nøkkel og nonce
* Krypterer det komprimerte innholdet med AES-GCM
* Krypterer AES-nøkkelen med mottakers offentlige RSA-nøkkel
* Signerer det krypterte innholdet med avsenders private RSA-nøkkel
* Bygger en SignertKryptertBundle i JSON-format
* Lagrer bundlen til en spesifisert fil

```
# Krever PowerShell 7+ 
param(
    [Parameter(Mandatory=$true)]
    [string]$DatafilPath, # sti til datafil med melding
    
    [Parameter(Mandatory=$true)]
    [string]$OutputFilePath, # sti til fil for lagring av SignertKryptertBundle
    
    [Parameter(Mandatory=$true)]
    [string]$ReceiverThumbprint, # LMR sitt sertifikat (offentlig nøkkel brukes til å kryptere meldingen)
    
    [Parameter(Mandatory=$true)]
    [string]$SenderThumbprint, # Bærum sitt sertifikat (brukes til å signere)
    
    [Parameter(Mandatory=$true)]
    [string]$SenderOrganizationIdentifier, # Organisasjonsidentifikator for avsender
    
    [Parameter(Mandatory=$true)]
    [DateTime]$RapporteringFra,
    
    [Parameter(Mandatory=$true)]
    [DateTime]$RapporteringTil
)

# 1. Les innholdet i datafilen
if (-not (Test-Path $DatafilPath)) {
    throw "Kunne ikke finne filen på $DatafilPath"
}
$fileContent = Get-Content $DatafilPath -Raw

# 2. Komprimer datafilen (GZip)
function Compress-StringToGZip {
    param([string]$content)
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($content)
    $outputStream = New-Object System.IO.MemoryStream
    # Bruk CompressionLevel Optimal = 0
    $gzip = New-Object System.IO.Compression.GZipStream($outputStream, [System.IO.Compression.CompressionLevel]::Optimal)
    $gzip.Write($bytes, 0, $bytes.Length)
    $gzip.Close()
    $compressed = $outputStream.ToArray()
    $outputStream.Dispose()
    return $compressed
}

$compressedContent = Compress-StringToGZip $fileContent

# 3. Generer tilfeldig AES-nøkkel (32 bytes) og nonce (12 bytes)
$key   = New-Object byte[] 32
$nonce = New-Object byte[] 12
[System.Security.Cryptography.RandomNumberGenerator]::Fill($key)
[System.Security.Cryptography.RandomNumberGenerator]::Fill($nonce)

# 4. Krypter med AES-GCM
$encryptedContent = New-Object byte[] $compressedContent.Length
$authTag          = New-Object byte[] 16  # 128-bit autentiseringsmerke
$aesGcm           = [System.Security.Cryptography.AesGcm]::new($key)
$aesGcm.Encrypt($nonce, $compressedContent, $encryptedContent, $authTag)
$aesGcm.Dispose()

# 5. Krypter AES-nøkkelen med mottakerens **offentlige** RSA-nøkkel
function Get-CertificateByThumbprint([string]$thumbprint) {
    # Juster lagring hvis nødvendig: LocalMachine vs CurrentUser, My vs Root, osv.
    $store = New-Object System.Security.Cryptography.X509Certificates.X509Store("My","CurrentUser")
    $store.Open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadOnly)
    $cert = $store.Certificates | Where-Object { $_.Thumbprint -eq $thumbprint.ToUpper() }
    $store.Close()
    return $cert
}

$receiverCert = Get-CertificateByThumbprint $ReceiverThumbprint
if (-not $receiverCert) {
    throw "Mottakersertifikat ble ikke funnet i LocalMachine\My med thumbprint $ReceiverThumbprint"
}

$receiverPublicKey = [System.Security.Cryptography.X509Certificates.RSACertificateExtensions]::GetRSAPublicKey($receiverCert)
if (-not $receiverPublicKey) {
    throw "Kunne ikke hente RSA offentlig nøkkel fra mottakersertifikat."
}

$encryptedKey = $receiverPublicKey.Encrypt($key, [System.Security.Cryptography.RSAEncryptionPadding]::OaepSHA256)

# 6. Signer det krypterte innholdet med avsenderens **private** RSA-nøkkel
$senderCert = Get-CertificateByThumbprint $SenderThumbprint
if (-not $senderCert) {
    throw "Avsendersertifikat ble ikke funnet i LocalMachine\My med thumbprint $SenderThumbprint"
}

$senderPrivateKey = [System.Security.Cryptography.X509Certificates.RSACertificateExtensions]::GetRSAPrivateKey($senderCert)
if (-not $senderPrivateKey) {
    throw "Kunne ikke hente RSA privat nøkkel fra avsendersertifikat."
}

$messageHash = [System.Security.Cryptography.SHA256]::HashData($encryptedContent)

$signature = $senderPrivateKey.SignHash(
    $messageHash,
    [System.Security.Cryptography.HashAlgorithmName]::SHA256,
    [System.Security.Cryptography.RSASignaturePadding]::Pkcs1
)

# 7. Bygg samme JSON-nyttelast som C# SignertKryptertBundle
$signertKryptertBundle = [PSCustomObject]@{
    EncryptedContent               = [System.Convert]::ToBase64String($encryptedContent)
    RapporteringFra                = $RapporteringFra
    RapporteringTil                = $RapporteringTil
    EncryptionCertificateThumbprint= $ReceiverThumbprint
    EncryptedKey                   = [System.Convert]::ToBase64String($encryptedKey)
    MessageFormatVersion           = "1.0"
    Nonce                          = [System.Convert]::ToBase64String($nonce)
    AuthenticationTag              = [System.Convert]::ToBase64String($authTag)
    MessageId                      = [System.Guid]::NewGuid().ToString()
    GeneratedAt                    = [DateTime]::UtcNow.ToString("o")
    SenderOrganizationIdentifier   = $SenderOrganizationIdentifier
    SignatureCertificateThumbprint = $SenderThumbprint
    Signature                      = [System.Convert]::ToBase64String($signature)
}

# 8. Lagre SignertKryptertBundle til fil
$signertKryptertBundle | ConvertTo-Json -Depth 10 | Set-Content -Path $OutputFilePath

Write-Host "SignertKryptertBundle er lagret til $OutputFilePath"

```

#### 2. Send SignertKryptertBundle til Legemiddelregisteret

Dette eksempelet viser hvordan du kan sende den krypterte bundlen til Legemiddelregisteret via API ved hjelp av PowerShell-scripter som håndterer autentisering og opplasting. Løsningen bruker DPoP (Demonstrating Proof-of-Possession) tokens for å autentisere mot HelseID og sikre kommunikasjonen med Legemiddelregisterets API.

Scriptsystemet består av følgende filer:

* `upload.ps1`: Hovedscript for å laste opp filen
* `ClientCredentials.ps1`: Håndterer autentisering mot HelseID ved bruk av DPoP
* `GenerateClientAssertion.ps1`: Lager JWT-token for klientautentisering
* `GenerateDPoPToken.ps1`: Genererer DPoP-tokens for sikker API-kommunikasjon
* `config.json`: Konfigurasjonsfil med endepunkter og klientinformasjon

##### Slik bruker du scriptet:

1. Først må du sette opp en`config.json`fil med nødvendig konfigurasjon:

```
{
  "FhirMottakEndpoint": "https://api.legemiddelregisteret.no/mottak/",
  "ClientCredentials": {
    "clientId": "ditt-klient-id",
    "issuer": "https://helseid-sts.test.nhn.no",
    "scope": "fhi:lmr.fhirmottak/api",
    "tokenEndpoint": "https://helseid-sts.test.nhn.no/connect/token",
    "privateKey": {
      "kty": "RSA",
      "kid": "din-kid-verdi",
      "n": "base64url-encoded-modulus",
      "e": "AQAB",
      "d": "base64url-encoded-d-value",
      "p": "base64url-encoded-p-value",
      "q": "base64url-encoded-q-value",
      "dp": "base64url-encoded-dp-value",
      "dq": "base64url-encoded-dq-value",
      "qi": "base64url-encoded-qi-value"
    }
  }
}

```

1. Bruk`upload.ps1`for å laste opp den genererte`SignertKryptertBundle`:

```
.\upload.ps1 -FilePath "C:\Sti\Til\Output\SignertKryptertBundle.json"

```

##### Upload.ps1

```
param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)
# Verifiser at filen eksisterer
if (-not (Test-Path $FilePath)) {
    Write-Host "Filen '$FilePath' ble ikke funnet." -ForegroundColor Red
    exit 1
}
$configPath = "$PSScriptRoot\config.json"
$configContent = Get-Content -Path $configPath -Raw
$config = $configContent | ConvertFrom-Json
$FhirMottakEndpoint = $config.FhirMottakEndpoint
try {
    # Les JSON-filen
    $jsonContent = Get-Content -Path $FilePath -Raw
    
    # Valider at innholdet er gyldig JSON
    $null = $jsonContent | ConvertFrom-Json
    
    # Generate headers with dpop-proof and dpop-token issued by HelseId
    $headers = . "$PSScriptRoot\ClientCredentials.ps1"
    
    try {
        $response = Invoke-RestMethod -Uri $FhirMottakEndpoint -Method Post -ContentType "application/json" -Body $jsonContent -Headers $headers 
        Write-Host "Sending av melding var vellykket!" -ForegroundColor Green
        
        # Returner responsen for videre behandling om nødvendig
        return $response
    }
    catch {
        Write-Host "Failed to POST: $($_.Exception.Message)" -ForegroundColor Red
        exit 1
    }
}
catch {
    Write-Host "Feil ved lesing eller validering av JSON-fil: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

```

##### ClientCredentials.ps1

```
. "$PSScriptRoot\GenerateClientAssertion.ps1"
. "$PSScriptRoot\GenerateDPoPToken.ps1"
$configPath = "$PSScriptRoot\config.json"
$configContent = Get-Content -Path $configPath -Raw
$config = $configContent | ConvertFrom-Json
$privateKeyObject = $config.ClientCredentials.privateKey
$privateKeyJson = $privateKeyObject | ConvertTo-Json -Compress
$clientId = $config.ClientCredentials.clientId
$issuer = $config.ClientCredentials.issuer
$scope = $config.ClientCredentials.scope
$tokenEndpoint = $config.ClientCredentials.tokenEndpoint
$FhirMottakEndpoint = $config.FhirMottakEndpoint
# Convert JSON to PowerShell object
$key = $privateKeyJson | ConvertFrom-Json
$clientAssertion = CreateClientAssertionFromPrivateKeyJson -clientId $clientId -audience $issuer -privateKey $key
# Generate dpop prood withtout nonce
$dpopProof = Generate-DPoPToken -HttpMethod "POST" -HttpUri $tokenEndpoint -PrivateKeyJson $privateKeyJson
$headers = @{
    DPoP = $dpopProof
}
$params = "client_id=$clientId&client_assertion=$clientAssertion&client_assertion_type=urn:ietf:params:oauth:client-assertion-type:jwt-bearer&grant_type=client_credentials&scope=$scope"
try {
    $response = Invoke-RestMethod -Method Post -Uri $tokenEndpoint -Body $params -Headers $headers -ContentType "application/x-www-form-urlencoded"
}
catch {
    # Capture the HTTP response from the exception
    $httpResponse = $_.Exception.Response
    if ($httpResponse -ne $null) {
        # Read the DPoP-Nonce header from the response
        $nonceValues = $httpResponse.Headers.GetValues("DPoP-Nonce")
        $nonce = $nonceValues -join ", "
        Write-Host "Received DPoP-Nonce: $nonce"
    }
    else {
        Write-Host "No web response available: $($_.Exception.Message)"
    }
}
# Include nonce received from HelseId in new dpop proof
$dpopProof = Generate-DPoPToken -HttpMethod "POST" -HttpUri $tokenEndpoint -PrivateKeyJson $privateKeyJson -Nonce $nonce
$headers = @{
    DPoP = $dpopProof
}
$response = Invoke-RestMethod -Method Post -Uri $tokenEndpoint -Body $params -Headers $headers -ContentType "application/x-www-form-urlencoded"
Write-Host "Received dpop access token: $response"
$accessToken = $response.access_token
# Calculate ath value based on the newly received dpop access token
$accessTokenBytes = [System.Text.Encoding]::UTF8.GetBytes($accessToken.Trim())
$sha256 = [System.Security.Cryptography.SHA256]::Create()
$hashBytes = $sha256.ComputeHash($accessTokenBytes)
$Ath = [Convert]::ToBase64String($hashBytes).TrimEnd('=').Replace('+', '-').Replace('/', '_')
# Generate new dpop proof with the ath included to use when making a request to the api
$dpopProof = Generate-DPoPToken -HttpMethod "POST" -HttpUri $FhirMottakEndpoint -PrivateKeyJson $privateKeyJson -Ath $Ath
$headers = @{
    Authorization = "DPoP $accessToken"
    DPoP = $dpopProof
}
Write-Output $headers

```

##### GenerateClientAssertion.ps1

```
# Create client assertion
function CreateClientAssertionFromPrivateKeyJson ($clientId, $audience, [object]$privateKey) {
    # Check if privateKey is initialized
    if ($null -eq $privateKey) {
        Write-Host "Error: privateKey is null"
        return null
    }
    
    # JWT Header
    $header = @{
        alg = "PS512"
        typ = "client-authentication+jwt"
        kid = $privateKey.kid
    } | ConvertTo-Json -Compress
    $headerEncoded = Base64UrlEncode([System.Text.Encoding]::UTF8.GetBytes($header))
    # JWT Payload
    $now = [System.DateTimeOffset]::UtcNow.ToUnixTimeSeconds()
    $payload = @{
        sub = $clientId
        iss = $clientId
        aud = $audience
        exp = $now + 60
        iat = $now
        nbf = $now
        jti = [guid]::NewGuid().ToString()
    } | ConvertTo-Json -Compress
    $payloadEncoded = Base64UrlEncode([System.Text.Encoding]::UTF8.GetBytes($payload))
    
    # Combine header and payload
    $unsignedToken = "$headerEncoded.$payloadEncoded"
    $rsa = [System.Security.Cryptography.RSACng]::new()
     $parameters = @{
        Modulus = Base64UrlDecode($privateKey.n)
        Exponent = Base64UrlDecode($privateKey.e)
        D = Base64UrlDecode($privateKey.d)
        P = Base64UrlDecode($privateKey.p)
        Q = Base64UrlDecode($privateKey.q)
        DP = Base64UrlDecode($privateKey.dp)
        DQ = Base64UrlDecode($privateKey.dq)
        InverseQ = Base64UrlDecode($privateKey.qi)
    }
    $rsa.ImportParameters($parameters)
    $signature = $rsa.SignData(
        [System.Text.Encoding]::UTF8.GetBytes($unsignedToken),
        [System.Security.Cryptography.HashAlgorithmName]::SHA512,
        [System.Security.Cryptography.RSASignaturePadding]::Pss
    )
    $signatureEncoded = Base64UrlEncode($signature)
    return "$headerEncoded.$payloadEncoded.$signatureEncoded"
}
# Base64 URL Encode function
function Base64UrlEncode($bytes) {
    return [Convert]::ToBase64String($bytes).TrimEnd('=').Replace('+', '-').Replace('/', '_')
}
# Base64 URL Decode function
function Base64UrlDecode($base64Url) {
    $base64 = $base64Url -replace '-', '+' -replace '_', '/'
    switch ($base64.Length % 4) {
        2 { $base64 += '==' }
        3 { $base64 += '='  }
    }
    return [Convert]::FromBase64String($base64)
}

```

##### GenerateDPoPToken.ps1

```
function Generate-DPoPToken {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$HttpMethod,
    
        [Parameter(Mandatory = $true)]
        [string]$HttpUri,
    
        [Parameter(Mandatory = $true)]
        [string]$PrivateKeyJson,
        [Parameter(Mandatory = $false)]
        [string]$Nonce,  # Optional parameter to be used after reciving one from the authorization server
        [Parameter(Mandatory = $false)]
        [string]$Ath   # Optional ath claim to be used when making requests to the resource server (should be the Base64Url-encoded SHA256 hash of the access token)
    )
    
    # Helper: Base64Url encoding function
    function Base64UrlEncode($bytes) {
        return [Convert]::ToBase64String($bytes).TrimEnd('=').Replace('+', '-').Replace('/', '_')
    }
    
    # Helper: Base64Url decoding function
    function Base64UrlDecode($base64Url) {
        $base64 = $base64Url -replace '-', '+' -replace '_', '/'
        switch ($base64.Length % 4) {
            2 { $base64 += '==' }
            3 { $base64 += '=' }
        }
        return [Convert]::FromBase64String($base64)
    }
    
    # Parse the provided private key JSON into an object.
    $privateKey = $PrivateKeyJson | ConvertFrom-Json
    
    # Build RSAParameters from the JWK
    $parameters = @{
        Modulus   = Base64UrlDecode($privateKey.n)
        Exponent  = Base64UrlDecode($privateKey.e)
        D         = Base64UrlDecode($privateKey.d)
        P         = Base64UrlDecode($privateKey.p)
        Q         = Base64UrlDecode($privateKey.q)
        DP        = Base64UrlDecode($privateKey.dp)
        DQ        = Base64UrlDecode($privateKey.dq)
        InverseQ  = Base64UrlDecode($privateKey.qi)
    }
    
    # Build the public key JWK for inclusion in the header.
    $publicKeyJwk = @{
        kty = "RSA"
        n   = Base64UrlEncode($parameters.Modulus)
        e   = Base64UrlEncode($parameters.Exponent)
        alg = "PS512"
    }
    
    # Create an RSA object and import the parameters.
    $rsa = [System.Security.Cryptography.RSACng]::new()
    $rsa.ImportParameters($parameters)
    
    # Get current Unix time for the iat claim.
    $iat = [System.DateTimeOffset]::UtcNow.ToUnixTimeSeconds()
    
    # Construct the JWT header with the required "jwk" claim.
    $header = @{
        alg = "PS512"         
        typ = "dpop+jwt"
        jwk = $publicKeyJwk
    } | ConvertTo-Json -Compress
    
    $headerEncoded = Base64UrlEncode([System.Text.Encoding]::UTF8.GetBytes($header))
    
    # Construct the JWT payload with required DPoP claims.
    $payload = @{
        htm = $HttpMethod    # HTTP method (e.g., "POST")
        htu = $HttpUri       # HTTP target URI
        iat = $iat           # Issued at time (Unix timestamp)
        jti = [guid]::NewGuid().ToString()   # Unique identifier to prevent replay
    } 
    
    # If a nonce is provided, include it in the payload.
    if ($Nonce) {
        $payload.nonce = $Nonce
    }
    # If an ath value is provided, include it.
    if ($Ath) {
        $payload.ath = $Ath
    }
    
    $payload = $payload | ConvertTo-Json -Compress
    $payloadEncoded = Base64UrlEncode([System.Text.Encoding]::UTF8.GetBytes($payload))
    
    # Combine header and payload to create the unsigned token.
    $unsignedToken = "$headerEncoded.$payloadEncoded"
    
    # Sign the unsigned token using the RSA private key.
    $dataToSign = [System.Text.Encoding]::UTF8.GetBytes($unsignedToken)
    $signature = $rsa.SignData(
        $dataToSign,
        [System.Security.Cryptography.HashAlgorithmName]::SHA512,
        [System.Security.Cryptography.RSASignaturePadding]::Pss
    )
    
    $signatureEncoded = Base64UrlEncode($signature)
    
    # Construct the final DPoP proof token.
    $dpopToken = "$unsignedToken.$signatureEncoded"
    
    return $dpopToken
}

```

