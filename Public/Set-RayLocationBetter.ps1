<#
.SYNOPSIS
	A better Set-Location: goes to the parent folder if a file path specified. Also changes the .NET path
#>
function Set-RayLocationBetter {
	Param(
		[Parameter(ValueFromRemainingArguments=$true)]
		[string]$NewLocation = ""
	)

	if ($NewLocation -eq ""){
		Write-Host "Where to? " -NoNewline
		$NewLocation = Read-Host
	}
	
	if([string]::IsNullOrEmpty($NewLocation)){ return }

	# If a file is specified as the location go to that file's folder
	if (Test-Path -Type Leaf $NewLocation){
		$NewLocation = Split-Path -Parent $NewLocation
	}
	Set-Location $NewLocation
	[System.IO.Directory]::SetCurrentDirectory((Get-Location).Path)
}
Set-Alias cd "Set-RayLocationBetter" -Option AllScope -Scope Global
Export-ModuleMember -Alias cd