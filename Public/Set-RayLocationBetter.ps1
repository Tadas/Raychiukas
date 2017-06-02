<#
.SYNOPSIS
	A smarter cd command - goes to the parent folder if file path specified
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

	# If a file is specified as the location go to that files folder
	if (Test-Path -Type Leaf $NewLocation){
		$NewLocation = Split-Path -Parent $NewLocation
	}
	Set-Location $NewLocation
	Write-Host
}
Set-Alias cd "Set-RayLocationBetter" -Option AllScope -Scope Global