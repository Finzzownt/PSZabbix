function New-HostGroup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
    )

    $params = @{
        Parameters = @{
            name = $Name
        }
        Method = "hostgroup.create"
    }
    return Invoke-PostUrl @params
}
