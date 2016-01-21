<#
    Adapted from http://www.software-virtualisierung.de/entry/automatic-download-and-install-all-visual-c-runtimes.html
#>
Write-Verbose "Visual C++ 2013 Redistributable (x86)" -Verbose
Invoke-WebRequest "http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe" -OutFile "VS2013_vcredist_x86.exe"
Write-Verbose "Visual C++ 2015 Redistributable (x86)" -Verbose
Invoke-WebRequest "https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x86.exe" -OutFile "VS2015_vcredist_x86.exe"
foreach ($vcFile in Get-ChildItem -Filter "VS201*.exe")
{
    Write-Host "Install " $vcFile.fullname
    Start-Process  $vcFile.fullname -Wait
}