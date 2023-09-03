function Connect-PSZabbix {
    <#
    .SYNOPSIS
    Connects to the Zabbix API service.

    .DESCRIPTION
    Connects to the Zabbix API service.
    Stores the apikey and url internally while the module is loaded.
    On successful login, returns the apikey. Otherwise throws an exception.

    .PARAMETER Credential
    Credential to use for authentication with the Zabbix API.

    .PARAMETER Url
    Url of the Zabbix API service.
    For example: "https://zabbix.domain.lan/api_jsonrpc.php"

    .OUTPUTS
    System.String

    .EXAMPLE
    Connect-SDXZabbix -Credential (Get-Credential) -Url "https://zabbix.domain.lan/api_jsonrpc.php"
    #>

    [OutputType([System.String])]

    param (
        [Parameter(Mandatory)]
        [PSCredential]
        $Credential,
        [Parameter(Mandatory)]
        [string]
        $Url
    )

    ###### Logging in and getting an api key
    $bodyLogin = @{
        jsonrpc = "2.0"
        method = "user.login"
        params = @{
            user = $Credential.UserName
            password = $Credential.GetNetworkCredential().Password
        }
        id = 1
        auth = $null
    }

    $parametersLogin = @{
        Method = "POST"
        Uri =  $Url
        Body = ($bodyLogin | ConvertTo-Json)
        ContentType = "application/json"
    }

    $script:url = $Url

    $script:apikey = (Invoke-RestMethod @parametersLogin).result
    if ([String]::IsNullOrWhiteSpace($script:apikey)) {
        throw "Login failed"
    }

    return $script:apikey
}
