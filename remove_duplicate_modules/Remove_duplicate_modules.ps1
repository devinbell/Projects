<#
This script will compare module version numbers and uninstall
the old version of the modules.
#>
$modules = get-installedmodule

foreach ($Module in $modules)
{
  $latest = get-installedmodule $Module.name
  $specificmods = get-installedmodule $Module.name -allversions
  
  # $(variable) returns the count method 
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
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUV2O6lx9rb8boY1ZN2/GCiwVi
# mxagggNOMIIDSjCCAjKgAwIBAgIQePhWFiGdWL5GuhWXo9HWlzANBgkqhkiG9w0B
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
# FgQUbs4HZ5uRxj1glJAgat9fQ8DmkocwDQYJKoZIhvcNAQEBBQAEggEAp2nDOjCW
# URuh4fmO3EVnZb7+uVu1JKaHx98U421asMSEYaUlZZvdOdk+ekDZyqNKiml22Ipa
# JpkU7YZKpKkoPIGgDLQGmAWHwl0ODWOeIE8tfbn9f0GDbrOwXeEfmMXaPW2vS2Cy
# wLhw04Fs51EHiFOgjy96nuTEuMnV/Mz8VReZqwyllP6H7Dx4ER4EG6wK57qAYJJC
# sRlOz1lWj5juRU7yJLKulhhbjnZR5mUclzuWJg2lgPe9qIWY0iLERr8hTjZTqwqv
# vFUO8CU2BLRSuPIrAYtjaKbn5Rc8Gt7c4VMKVFaMKPWSvuSrwfsHFOVnd5BEqM5l
# ox0yDzm/Qdn5Vw==
# SIG # End signature block
