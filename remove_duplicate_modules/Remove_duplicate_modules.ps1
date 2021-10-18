<#
This script will compare module version numbers and uninstall
the old versions of the modules.
#>
$modules = get-installedmodule

foreach ($Module in $modules)
{
  $latest = get-installedmodule $Module.name
  $specificmods = get-installedmodule $Module.name -allversions
  
  # $(variable.property) returns the value of the property 
  write-information -MessageData "$($specificmods.count) versions of $($Module.name) module found " -InformationAction Continue
  
 #compare each version of the module
  foreach ($mods in $specificmods)
  {
     if ($mods.version -eq $latest.version) { 
        Write-Host "You got the Latest version" -ForegroundColor Green
      }
#uninstall all except the newest version
	 else {
        Write-Host "Uninstalling the old version" -ForegroundColor Red
        Uninstall-Module -Name $mods.Name -RequiredVersion $mods.Version
      }
  }
}

# SIG # Begin signature block
# MIIF1gYJKoZIhvcNAQcCoIIFxzCCBcMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUvh84XVBm/rfQhR8snEIIIGvP
# lEygggNOMIIDSjCCAjKgAwIBAgIQePhWFiGdWL5GuhWXo9HWlzANBgkqhkiG9w0B
# AQsFADA9MRMwEQYDVQQDDApEZXZpbiBCZWxsMSYwJAYJKoZIhvcNAQkBFhdkZXZp
# bmJlbGwyMDEzQHlhaG9vLmNvbTAeFw0yMTA3MjUxNDExNTlaFw0zMTAxMDEwNTAw
# MDBaMD0xEzARBgNVBAMMCkRldmluIEJlbGwxJjAkBgkqhkiG9w0BCQEWF2Rldmlu
# YmVsbDIwMTNAeWFob28uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
# AQEAt2dWK5itLIJleAl/10J9va4i81j4aJwZf1sKbclFoS32iQbO2y7Vm81G79aK
# SCNpWdhO0x90Ja9tEuLJTom68U84UBGETi6NLJ2Zq3r7vW9FuEPvkxO5B9QBC6/7
# EPY65cEJYPg59Cvdbd2mRpfGBcROCzlQ4tJoMvwNXayG6wxWDHKBlhoH1R3Nvmqf
# w4ywXS9i2YcAHrUN3F9v0hdKiTciLrukQk8ZMKwhGe5eMOCuE735krQ+ytFuKS68
# CqWF13W2sl6t3/gX/V/wl9eiWIJSiOvgp2yNdsQNkUnTcATtVsDicZKc47MDuoyI
# kbVEwtWda0TU+PADVleerl9t/QIDAQABo0YwRDAOBgNVHQ8BAf8EBAMCBaAwEwYD
# VR0lBAwwCgYIKwYBBQUHAwMwHQYDVR0OBBYEFHa3o7QMQlGSSfvwih8ER9yLaxPh
# MA0GCSqGSIb3DQEBCwUAA4IBAQAfib1ZjREPkbBp/okpvMLYQPusMrE0UBsJaE0Z
# IvJHOUwT1NEz6D3LBCQd6XKWI7EYGBZDkOspT2gZtJJExgqUCV4ll6CoWTy7d3gp
# lhpt+byz9MzqxUGytPLW2OTAWxYPbUcPq7xaqGBAkaGINIPEW8yndwPuDXtcBMJG
# nIr3tIyX1wiDyYawodH/en3TXoKHovhoWDHewkO7yXdc5va1KHw01hwA6dABnhAB
# xUCFv/rS7HRUtNLZDXltiagwQRu7MQ0lXzDqq2ylVfr0P/wE0juW5uf+m7c607Wq
# 9Oddt7epDWTWcF4iwvBo5Ygv+LS7hZBGt/vIbMXsey4gAKHhMYIB8jCCAe4CAQEw
# UTA9MRMwEQYDVQQDDApEZXZpbiBCZWxsMSYwJAYJKoZIhvcNAQkBFhdkZXZpbmJl
# bGwyMDEzQHlhaG9vLmNvbQIQePhWFiGdWL5GuhWXo9HWlzAJBgUrDgMCGgUAoHgw
# GAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGC
# NwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQx
# FgQUJ9Mm6/dS9wxvvipQ5XG2eDrSjAIwDQYJKoZIhvcNAQEBBQAEggEAPycXBuUr
# 7mRKIWmbrmGWB2MAH6NNZAABwb1F2BlDQwbo9UMCpjVT6Oh7JK6+ZXarYxkUVcbX
# 6buINgQqA2om0C5vDUYmy/k5BadSBbH0Mo69WGek8/s0V1+aRskyTICu2zkW4lcO
# kSNKwqm6LEQ0vzQlCNakLEv6YJQUbproRwBO3O/PVmdvysal5x3fA10eRyrrGHjM
# /jzLzjugKj/5WlAdCmoNF92gWieo5/ZgHAwHrXIv4fjV7dfS9TJbr/FpFSbLT/7d
# P9wtOKrg35WNiVQOQtITdVOStm658g8M2IPCmo3dBmPVbN57ajthUTYBbqlmjB0w
# DpgR1XZNFuoDrg==
# SIG # End signature block
