function Disconnect-PSZabbix {
    <#
    .SYNOPSIS
    Disconnects from the Zabbix API service.

    .DESCRIPTION
    Disconnects from the Zabbix API service.
    Uses the stored apikey from Connect-SDXZabbix.

    .PARAMETER Credential
    Credential to use for authentication with the Zabbix API.

    .PARAMETER Url
    Url of the Zabbix API service.
    For example: "https://zabbix.domain.lan/api_jsonrpc.php"

    .OUTPUTS
    System.String

    .EXAMPLE
    Disonnect-SDXZabbix

    .EXAMPLE
    Disonnect-SDXZabbix -Apikey $apikey

    .EXAMPLE
    $apikey | Disonnect-SDXZabbix
    #>

    [OutputType([System.Boolean])]

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, ValueFromPipeline)]
        [string]
        $Apikey = $script:apikey
    )

    if ($null -eq $script:url) {
        throw "No url known; use Connect-SDXZabbix first"
    }
    if ($null -eq $Apikey) {
        throw "No apikey specified; use Connect-SDXZabbix first"
    }

    ##### Logout
    $bodylogout = @{
        jsonrpc = "2.0"
        method = "user.logout"
        params = @{}
        id = 1
        auth = $Apikey
    }

    $parameterslogout = @{
        Method = "POST"
        Uri =  $script:url
        Body = ($bodylogout | ConvertTo-Json)
        ContentType = "application/json"
    }
    return (Invoke-RestMethod @parametersLogout).result
}
