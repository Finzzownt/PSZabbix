function Remove-PSZabbixHostGroup {
    <#
    .SYNOPSIS
    Remove host group.

    .DESCRIPTION
    Remove host group.

    .PARAMETER Ids
    One or more host group ID's.

    .EXAMPLE
    Remove-SDXZabbixHostGroup -Ids 107824,107825
    #>

    [OutputType([hashtable])]

    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [int[]]$Ids,

        [int]$RquestId = 1
    )

    Begin {
        Test-ModuleSetup

        $result = @()
    }

    Process {
        $params = @{
            Parameters = @($Ids)
            Method = "hostgroup.delete"
            RequestId = $RequestId
        }
        # $result = Invoke-PostUrl @params
        # $output = [PSZabbixResultRemoveHostGroup]::New()
        # $output.HostGroupIds = $output.result.groupids

        $result += groupids = (Invoke-PostUrl @params).result.groupids
    }

    End {
        return $result
    }
}
