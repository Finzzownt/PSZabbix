function Invoke-PostUrl {
    [CmdletBinding()]
    param (
        # Zabbix API Url
        [string]$Url = $script:url,

        # Zabbix API Method, e.g. "hostgroup.create"
        [Parameter(Mandatory)]
        [string]$Method,

        # Parameters for the method
        [hashtable]$Parameters = @{},

        [int]$RequestId = 1
    )

    Write-Verbose "method: $Method"
    $body = @{
        jsonrpc = "2.0"
        method = $Method
        params = $Parameters
        auth = $script:apikey
        id = $RequestId
    }

    if ($Method -eq "apiinfo.version") {
        $body.Remove("auth")
        Write-Verbose "removed auth"
    }

    $parameters = @{
        Method = "POST"
        Uri =  $Url
        Body = ($body | ConvertTo-Json)
        ContentType = "application/json-rpc"
    }

    $result = Invoke-RestMethod @parameters
    if ($result.error) {
        throw ("{0} {1} Code:{2}" -f $result.error.message,$result.error.data,$result.error.code)
    }
    return $result    
}
