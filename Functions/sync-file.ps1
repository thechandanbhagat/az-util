param(
    [Alias("a")][string]$account,
    [Alias("c")][string]$container,
    [Alias("b")][string]$blob,
    [Alias("f")][string]$file,
    [Alias("k")][string]$key
)

if (-not $account) {
    $account = Read-Host "Account Name"
}
if (-not $container) {
    $container = Read-Host "Container Name"
}
if (-not $blob) {
    $blob = Read-Host "Blob"
}
if (-not $file) {
    $file = Read-Host "File Path"
}


# Read the file content
$File = Get-Item -Path $file
$FileContent = [IO.File]::ReadAllBytes($file)

# Create a new date in RFC1123 format
$Date = [DateTime]::UtcNow.ToString("R")


# Define the REST API URL
$Url = "https://${account}.blob.core.windows.net/${container}/${blob}"
Write-Host "URL:`n$Url"

# Create the HTTP request headers
$Headers = @{
    "x-ms-date" = $Date
    "x-ms-version" = "2020-10-02"
    "x-ms-blob-type" = "BlockBlob"
    "Authorization" = "SharedKey sp=racwl&st=2024-05-26T13:09:46Z&se=2025-05-26T21:09:46Z&spr=https&sv=2022-11-02&sr=c&sig=upRrWnLOLCKLaNEsmAe1gM9qXOig18uXIVZNzjNUe6s%3D"
    "Content-Length" = $FileContent.Length
    "Content-Type" = "application/octet-stream"
}

# Make the HTTP request
try {
    Invoke-RestMethod -Uri $Url -Method Put -Headers $Headers -Body $FileContent
    Write-Host "File uploaded to Azure Blob Storage successfully."
} catch {
    Write-Host "Failed to upload file to Azure Blob Storage. Error: $_"
}
