function Format-Result {
<#
.SYNOPSIS
    Formats a response from the Soltra API
.PARAMETER RESPONSE
    Response object from a Soltra API request
#>
    [CmdletBinding()]
    [OutputType()]
    param(
        [Parameter(
            Mandatory = $true,
            Position = 1)]
        [object] $Response
    )
    process {
        # Convert to Json
        ConvertFrom-Json ($Response.Result.Content).ReadAsStringAsync().Result
    }
}