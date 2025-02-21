# Als Administrator ausführen prüfen
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Bitte als Administrator ausführen!"
    break
}

# Zertifikat in den Trusted Root Store importieren
$cerPath = "$PSScriptRoot\DTCertificate.cer"
if (Test-Path $cerPath) {
    try {
        Import-Certificate -FilePath $cerPath -CertStoreLocation "Cert:\LocalMachine\Root"
        Write-Host "Zertifikat wurde erfolgreich installiert!" -ForegroundColor Green
        
        # ExecutionPolicy setzen
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force -Scope LocalMachine
        Write-Host "ExecutionPolicy wurde auf RemoteSigned gesetzt." -ForegroundColor Green
    }
    catch {
        Write-Error "Fehler beim Installieren des Zertifikats: $_"
    }
} else {
    Write-Error "Zertifikat nicht gefunden!"
}


# SIG # Begin signature block
# MIIFpgYJKoZIhvcNAQcCoIIFlzCCBZMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUJpz4GLojQMYIzW6DlZYpwJvr
# RpGgggMuMIIDKjCCAhKgAwIBAgIQE6+AfpCKbppD5IxirnFqkjANBgkqhkiG9w0B
# AQsFADAtMSswKQYDVQQDDCJEaWdpdGFsIFRhbGVudCBQb3dlclNoZWxsIFNvZnR3
# YXJlMB4XDTI1MDIyMTA3MDE0NVoXDTMwMDIyMTA3MTE0NVowLTErMCkGA1UEAwwi
# RGlnaXRhbCBUYWxlbnQgUG93ZXJTaGVsbCBTb2Z0d2FyZTCCASIwDQYJKoZIhvcN
# AQEBBQADggEPADCCAQoCggEBANVVUNnEMpWJTu1F5qABWXXzrASpXnNh+xX9ATwO
# 7pEuTn5AhYeq1iPfUfsS9TGfgbu+FRnsOkz9NyTPhYHogRb9YtoLY+FQb5v8mg5k
# iTinBpxfGY1OUyheuYuziUBNFdVDqd/lfuDTD9aQzCzIOFMisIz0DFbMo+Sdij91
# j+IcTu3wBeJChpust3dVK+x6g+flOGjzGa0Xc2GEZAZSEMZd7is2LcRvX+oEfdnI
# wJOA7F2AaXIaTK3GdTvIX2SPeYB507G5c1xoykaDT5F38Ku2ymjLYRj5Pz8UbGQu
# mUhd6CmmI8cnjn5pzKW6JeMhh8E5txBAjwgtNSv8r9kk8s0CAwEAAaNGMEQwDgYD
# VR0PAQH/BAQDAgeAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMB0GA1UdDgQWBBQnA2Ah
# q2enTFuBvB0BF6lhKCq3djANBgkqhkiG9w0BAQsFAAOCAQEASfE1NO2s0HLzSM08
# 04M7o8Q4pWENv7S/G5uSJmMceVILfFuWEIaDdfezHYXa4PJStETnzBLST9sYi0AR
# TDEzhz5/WYdCS8SGt6AVFz9xVTzGjIy15J0dJ5X+TACzma9e8gfSTk3TjANgzCCh
# q42y26Cx1ML2fyzm+hCfbk/kr3UMHtyzBmZlHcbCh4nI9NZSyn3AfbKZb1xIwDFt
# /CIsM7Z/+gZKgV5UHysOo9VX6c34Svj3BEM9TIpdaTqrO6X5pIKaCcMjf/VYV1hi
# zP+egP9C7jOzlPc6idOP5ZxW8UjHsWreh84UWuap6aR6PGxBwEL9ITr17GkFkTlI
# 3RQDYTGCAeIwggHeAgEBMEEwLTErMCkGA1UEAwwiRGlnaXRhbCBUYWxlbnQgUG93
# ZXJTaGVsbCBTb2Z0d2FyZQIQE6+AfpCKbppD5IxirnFqkjAJBgUrDgMCGgUAoHgw
# GAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGC
# NwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQx
# FgQUfdC2eGl3jKvx29ad6HCKohL495gwDQYJKoZIhvcNAQEBBQAEggEAPdtRYiG0
# KN67c+fAg6Uu16aRSJah4guGRVrfWOPxUByU4HOLIwTGAhxaeDJlgvg9x3IA1NTO
# fbbHNqDqTCqcwfU8J0Mb1cQC6BWpWHxX/up3k17+RYw63LABu9C13Ojxx4f3Yrw4
# AsYoYbnVDkNfKq5TKOj2DQ2DTIBU0ARErPu5KEgpVAsA6ZWNsgu5pZ0zp3+8QS58
# kHUJiMjfLi3RiH65ULzAtRbRb53/flRiyRjcyXIYv4NdDBO+/jN/7sh4jJuz9jUo
# 352Yp9uia6dF6GXAD/YHixbTj6HalHi34xZfL8xvUiedLakVpanHHiiPU2LQU0dP
# RWxIWprGUIReRg==
# SIG # End signature block
