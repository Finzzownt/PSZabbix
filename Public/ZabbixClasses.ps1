class PSZabbixResult {
    [string]$JsonRPC;

    [int]$RequestID

}

class PSZabbixResultVersion : PSZabbixResult {
    [string]$Version
}

class PSZabbixResultRemoveHostGroup {
    [int[]]$HostGroupIds
}

