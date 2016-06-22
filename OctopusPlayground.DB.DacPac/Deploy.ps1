Write-Output "About to run PowerShell"

# Database Details
$projectName = "OctopusPlayground.DB.DacPac"
$dacServicesServer = "server=" + $DatabaseServer

# Dac Runner
Add-Type -path "C:\Program Files (x86)\Microsoft SQL Server\110\DAC\bin\Microsoft.SqlServer.Dac.dll"

# Connection string
$d = New-Object Microsoft.SqlServer.Dac.DacServices $dacServicesServer

$dacpac = $OctopusParameters['Octopus.Action[Database Deployment].Output.Package.InstallationDirectoryPath'] + "\" + $projectName + ".dacpac"
Write-Output $dacpac
$dp = [Microsoft.SqlServer.Dac.DacPackage]::Load($dacpac)

$options = New-Object Microsoft.SqlServer.Dac.DacDeployOptions -Property @{
 'BlockOnPossibleDataLoss' = $true;
 'DropObjectsNotInSource' = $false;
 'ScriptDatabaseOptions' = $true;
 'IgnorePermissions' = $true;
 'IgnoreRoleMembership' = $true
}

# Listen to messages
Register-ObjectEvent -InputObject $d -EventName "Message" -Action { Write-Host $EventArgs.Message.Message } | out-null

# Dacpac deployment
$d.Deploy($dp, $DatabaseName, $true, $options)