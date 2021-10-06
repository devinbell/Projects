write-host "this will report all modules with duplicate (older and newer) versions installed"
write-host "be sure to run this as an admin" -foregroundcolor yellow
write-host "(You can update all your Azure RMmodules with update-module Azurerm -force)"

$mods = get-installedmodule

foreach ($Mod in $mods)
{
  write-host "Checking $($mod.name)"
  $latest = get-installedmodule $mod.name
  $specificmods = get-installedmodule $mod.name -allversions
  write-host "$($specificmods.count) versions of this module found [ $($mod.name) ]"
  
 
  foreach ($sm in $specificmods)
  {
     if ($sm.version -eq $latest.version) 
	 { $color = "green"}

	 else
	 { $color = "magenta"
       Uninstall-Module -Name $sm.Name -RequiredVersion $sm.Version
    }
     write-host " $($sm.name) - $($sm.version) [highest installed is $($latest.version)]" -foregroundcolor $color
	
  }
  write-host "------------------------"
}
write-host "done"
# SIG # Begin signature block
# MIIF1gYJKoZIhvcNAQcCoIIFxzCCBcMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUZa8B4Wb/kHhmQDxX8sRJzP6d
# hNSgggNOMIIDSjCCAjKgAwIBAgIQePhWFiGdWL5GuhWXo9HWlzANBgkqhkiG9w0B
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
# FgQU3jAjmPJbJQilF/RVQkEkT6p/5XQwDQYJKoZIhvcNAQEBBQAEggEAahmSeuoZ
# qb8FBe5UUWb2DcWoiKOn9WJLy6jcnp4ey/WanoDOA/83fMiVjSENByBG9eIlqulh
# wv5Kgny0u6DZ18WoaKoZJAd3jwJpRIcZyw3qmbDUQyjWO7fNPD5rDF7EBRKtvKJN
# h8VPQ/ZJ3kWdWiHN9uA7Lrrl8ZAapMHe5BmvXKhzYIL7UdA8hq34UWl/r7xMoKZC
# juqnqW/2yA/aVBj0eE50+kClabQvc+45An8N9fgTeDpDN1eG9MiEgTyUk3GyI+me
# BpZWU0Hj8OjOGS3v0WC0znlOQ8Guoaig+X1mUfOUthHjqUvdi2h5eFW7upiLcpt4
# LhLPsk7uXL5q6A==
# SIG # End signature block
