function New-PSZabbixHostGroup {
    <#
    .SYNOPSIS
    Create host group.

    .DESCRIPTION
    Create host group.

    .PARAMETER Name
    Host group name.

    .OUTPUTS
    Object containing name and groupid.

    .EXAMPLE
    New-SDXZabbixHostGroup -Name "MyHostGroupName"

    .EXAMPLE
    @("MyHostGroupName1","MyHostGroupName2","MyHostGroupName3") | New-SDXZabbixHostGroup
    #>

    [OutputType([hashtable])]

    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [String]$Name
    )

    Begin {
        Test-ModuleSetup

        $result = @()
    }

    Process {        
        $result += @{ name = $Name; groupids = (New-HostGroup -Name $Name).result.groupids }
    }

    End {
        return $result
    }
}
