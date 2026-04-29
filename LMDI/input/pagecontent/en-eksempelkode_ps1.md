### PowerShell Code Examples

- [PowerShell Code Examples](#powershell-code-examples)
  - [1. Creating a compressed, encrypted and signed bundle (`SignedEncryptedBundle`)](#1-creating-a-compressed-encrypted-and-signed-bundle-signedencryptedbundle)
    - [How to use the script:](#how-to-use-the-script)
  - [2. Send `SignedEncryptedBundle` to the Norwegian Medication Registry](#2-send-signedencryptedbundle-to-the-norwegian-medication-registry)
    - [How to use the script:](#how-to-use-the-script-1)
    - [Upload.ps1](#uploadps1)
    - [ClientCredentials.ps1](#clientcredentialsps1)
    - [GenerateClientAssertion.ps1](#generateclientassertionps1)
    - [GenerateDPoPToken.ps1](#generatedpoptokenps1)

---



#### 1. Creating a compressed, encrypted and signed bundle (`SignedEncryptedBundle`)

This script creates a `SignedEncryptedBundle` using PowerShell 7+. It performs GZip compression, AES-GCM encryption and signing with X.509 certificates.

##### How to use the script:

```powershell
.\LagSignertKryptertBundle.ps1 `
    -DatafilPath "C:\Path\To\MessageContent.json" `
    -OutputFilePath "C:\Path\To\Output\SignedEncryptedBundle.json" `
    -ReceiverThumbprint "ABCDEF1234567890ABCDEF1234567890ABCDEF12" `
    -SenderThumbprint "1234567890ABCDEF1234567890ABCDEF12345678" `
    -SenderOrganizationIdentifier "123456789" `
    -RapporteringFra "2024-01-01T00:00:00Z" `
    -RapporteringTil "2024-01-31T23:59:59Z"

```

The script performs the following tasks:
- Reads the content from a data file
- Compresses the content with GZip
- Generates a random AES key and nonce
- Encrypts the compressed content with AES-GCM
- Encrypts the AES key with the recipient's public RSA key
- Signs the encrypted content with the sender's private RSA key
- Builds a SignedEncryptedBundle in JSON format
- Saves the bundle to a specified file




```powershell
# Requires PowerShell 7+
param(
    [Parameter(Mandatory=$true)]
    [string]$DatafilPath, # path to data file with message
    
    [Parameter(Mandatory=$true)]
    [string]$OutputFilePath, # path to file for saving SignedEncryptedBundle
    
    [Parameter(Mandatory=$true)]
    [string]$ReceiverThumbprint, # LMR's certificate (public key used to encrypt the message)
    
    [Parameter(Mandatory=$true)]
    [string]$SenderThumbprint, # sender's certificate (used for signing)
    
    [Parameter(Mandatory=$true)]
    [string]$SenderOrganizationIdentifier, # organization identifier for sender
    
    [Parameter(Mandatory=$true)]
    [DateTime]$RapporteringFra,
    
    [Parameter(Mandatory=$true)]
    [DateTime]$RapporteringTil
)

# 1. Read the content of the data file
if (-not (Test-Path $DatafilPath)) {
    throw "Could not find the file at $DatafilPath"
}
$fileContent = Get-Content $DatafilPath -Raw

# 2. Compress the data file (GZip)
function Compress-StringToGZip {
    param([string]$content)
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($content)
    $outputStream = New-Object System.IO.MemoryStream
    # Use CompressionLevel Optimal = 0
    $gzip = New-Object System.IO.Compression.GZipStream($outputStream, [System.IO.Compression.CompressionLevel]::Optimal)
    $gzip.Write($bytes, 0, $bytes.Length)
    $gzip.Close()
    $compressed = $outputStream.ToArray()
    $outputStream.Dispose()
    return $compressed
}

$compressedContent = Compress-StringToGZip $fileContent

# 3. Generate random AES key (32 bytes) and nonce (12 bytes)
$key   = New-Object byte[] 32
$nonce = New-Object byte[] 12
[System.Security.Cryptography.RandomNumberGenerator]::Fill($key)
[System.Security.Cryptography.RandomNumberGenerator]::Fill($nonce)

# 4. Encrypt with AES-GCM
$encryptedContent = New-Object byte[] $compressedContent.Length
$authTag          = New-Object byte[] 16  # 128-bit authentication tag
$aesGcm           = [System.Security.Cryptography.AesGcm]::new($key)
$aesGcm.Encrypt($nonce, $compressedContent, $encryptedContent, $authTag)
$aesGcm.Dispose()

# 5. Encrypt the AES key with the recipient's **public** RSA key
function Get-CertificateByThumbprint([string]$thumbprint) {
    # Adjust store if necessary: LocalMachine vs CurrentUser, My vs Root, etc.
    $store = New-Object System.Security.Cryptography.X509Certificates.X509Store("My","CurrentUser")
    $store.Open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadOnly)
    $cert = $store.Certificates | Where-Object { $_.Thumbprint -eq $thumbprint.ToUpper() }
    $store.Close()
    return $cert
}

$receiverCert = Get-CertificateByThumbprint $ReceiverThumbprint
if (-not $receiverCert) {
    throw "Recipient certificate not found in LocalMachine\My with thumbprint $ReceiverThumbprint"
}

$receiverPublicKey = [System.Security.Cryptography.X509Certificates.RSACertificateExtensions]::GetRSAPublicKey($receiverCert)
if (-not $receiverPublicKey) {
    throw "Could not retrieve RSA public key from recipient certificate."
}

$encryptedKey = $receiverPublicKey.Encrypt($key, [System.Security.Cryptography.RSAEncryptionPadding]::OaepSHA256)

# 6. Sign the encrypted content with the sender's **private** RSA key
$senderCert = Get-CertificateByThumbprint $SenderThumbprint
if (-not $senderCert) {
    throw "Sender certificate not found in LocalMachine\My with thumbprint $SenderThumbprint"
}

$senderPrivateKey = [System.Security.Cryptography.X509Certificates.RSACertificateExtensions]::GetRSAPrivateKey($senderCert)
if (-not $senderPrivateKey) {
    throw "Could not retrieve RSA private key from sender certificate."
}

$messageHash = [System.Security.Cryptography.SHA256]::HashData($encryptedContent)

$signature = $senderPrivateKey.SignHash(
    $messageHash,
    [System.Security.Cryptography.HashAlgorithmName]::SHA256,
    [System.Security.Cryptography.RSASignaturePadding]::Pkcs1
)

# 7. Build the same JSON payload as the C# SignedEncryptedBundle
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

# 8. Save SignedEncryptedBundle to file
$signertKryptertBundle | ConvertTo-Json -Depth 10 | Set-Content -Path $OutputFilePath

Write-Host "SignedEncryptedBundle saved to $OutputFilePath"
```


#### 2. Send `SignedEncryptedBundle` to the Norwegian Medication Registry

This example shows how you can send the encrypted bundle to the Medication Registry via API using PowerShell scripts that handle authentication and upload. The solution uses DPoP (Demonstrating Proof-of-Possession) tokens to authenticate against HelseID and secure communication with the Medication Registry's API.

The script system consists of the following files:
- `upload.ps1`: Main script for uploading the file
- `ClientCredentials.ps1`: Handles authentication against HelseID using DPoP
- `GenerateClientAssertion.ps1`: Creates JWT token for client authentication
- `GenerateDPoPToken.ps1`: Generates DPoP tokens for secure API communication
- `config.json`: Configuration file with endpoints and client information

##### How to use the script:

1. First, set up a `config.json` file with the necessary configuration:

```json
{
  "FhirMottakEndpoint": "https://api.legemiddelregisteret.no/mottak/",
  "ClientCredentials": {
    "clientId": "your-client-id",
    "issuer": "https://helseid-sts.test.nhn.no",
    "scope": "fhi:lmr.fhirmottak/api",
    "tokenEndpoint": "https://helseid-sts.test.nhn.no/connect/token",
    "privateKey": {
      "kty": "RSA",
      "kid": "your-kid-value",
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

2. Use `upload.ps1` to upload the generated `SignedEncryptedBundle`:

```powershell
.\upload.ps1 -FilePath "C:\Path\To\Output\SignedEncryptedBundle.json"
```

##### Upload.ps1

```powershell
param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)
# Verify that the file exists
if (-not (Test-Path $FilePath)) {
    Write-Host "The file '$FilePath' was not found." -ForegroundColor Red
    exit 1
}
$configPath = "$PSScriptRoot\config.json"
$configContent = Get-Content -Path $configPath -Raw
$config = $configContent | ConvertFrom-Json
$FhirMottakEndpoint = $config.FhirMottakEndpoint
try {
    # Read the JSON file
    $jsonContent = Get-Content -Path $FilePath -Raw
    
    # Validate that the content is valid JSON
    $null = $jsonContent | ConvertFrom-Json
    
    # Generate headers with dpop-proof and dpop-token issued by HelseId
    $headers = . "$PSScriptRoot\ClientCredentials.ps1"
    
    try {
        $response = Invoke-RestMethod -Uri $FhirMottakEndpoint -Method Post -ContentType "application/json" -Body $jsonContent -Headers $headers 
        Write-Host "Sending of message was successful!" -ForegroundColor Green
        
        # Return the response for further processing if needed
        return $response
    }
    catch {
        Write-Host "Failed to POST: $($_.Exception.Message)" -ForegroundColor Red
        exit 1
    }
}
catch {
    Write-Host "Error reading or validating JSON file: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
```

##### ClientCredentials.ps1

```powershell
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
# Generate dpop proof without nonce
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

```powershell
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

```powershell
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
        [string]$Nonce,  # Optional parameter to be used after receiving one from the authorization server
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
