function Test-ModuleSetup {
    if ($null -eq $script:url) {
        throw "No known url. Use Connect-PSZabbix first."
    }

    if ($null -eq $script:apikey) {
        throw "No known apikey. Use Connect-PSZabbix first."
    }
}