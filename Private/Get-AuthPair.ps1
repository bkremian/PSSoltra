function Get-AuthPair {
<#
.SYNOPSIS
    Outputs an authorization pair for Format-Header
#>
    [CmdletBinding()]
    [OutputType()]
    param()
    process {
        if ($Soltra.Id -and $Soltra.Secret) {
            # Output base64 encoded Username/Password pair
            "token $([System.Convert]::ToBase64String(
                [System.Text.Encoding]::ASCII.GetBytes("$($Soltra.Id):$(Get-SecureString $Soltra.Secret)")))"
        } else {
            $null
        }
    }
}