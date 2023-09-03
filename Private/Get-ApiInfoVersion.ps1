function Get-ApiInfoVersion {
    [CmdletBinding()]
    param ()

    $params = @{
        Method = "apiinfo.version"
    }

    return Invoke-PostUrl @params
}
