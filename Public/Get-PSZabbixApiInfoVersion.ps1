function Get-PSZabbixApiInfoVersion {
    <#
    .SYNOPSIS
    Get API Info Version.

    .DESCRIPTION
    Returns the version of the Zabbix API.

    .OUTPUTS
    System.String

    .EXAMPLE
    Get-PSZabbixApiInfoVersion

    .EXAMPLE
    Get-PSZabbixApiInfoVersion -as [version]

    .EXAMPLE
    [version]$version = Get-PSZabbixApiInfoVersion
    #>

    [OutputType([System.String])]

    [CmdletBinding()]
    param ()

    Begin {
        Test-ModuleSetup

        $result = @()
    }

    Process {
        $result = (Get-ApiInfoVersion).result
    }

    End {
        return $result
    }
}
