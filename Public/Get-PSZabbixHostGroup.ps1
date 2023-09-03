function Get-PSZabbixHostGroup {
    <#
    .SYNOPSIS
    Get host group.

    .DESCRIPTION
    Get host group.

    .PARAMETER Ids
    One or more host group ID's.

    .EXAMPLE
    Remove-SDXZabbixHostGroup -Ids 107824,107825
    #>

    [OutputType([hashtable])]

    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$Names,

        [int]$RquestId = 1
    )

    Begin {
        Test-ModuleSetup

        $result = @()
    }

    Process {
        $params = @{
            Parameters = @{
                output = "extend"
                filter = @{
                    name = $Names
                }
            }
            Method = "hostgroup.get"
            RequestId = $RequestId
        }

        $result += (Invoke-PostUrl @params).result
    }

    End {
        return $result
    }
}
