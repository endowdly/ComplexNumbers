#------------------------------------------------------------------------------
#                 Complex Numbers Module
#------------------------------------------------------------------------------

param (
    [Switch] $BasicSymbols
)
# --- Get Files ---------------------------------------------------------------
$Public  = @(Get-ChildItem -Path $PSScriptRoot\Public\*.ps1)
$Private = @(Get-ChildItem -Path $PSScriptRoot\Private\*.ps1)
$Files = $Public + $Private

# --- Source Files ------------------------------------------------------------
foreach ($file in $Files) {
    
    try 
    	{ . $file.FullName }
    catch
	{ $loadErr += ,$file.Name }
}
   
if ($loadErr) {
    Write-Host 'Failed to load: ' -ForegroundColor Red
    $loadErr | foreach { Write-Host $_ }
}

# --- Create Initial Config File and Variables --------------------------------
# Empty

# --- Read Config File and Variables ------------------------------------------
# Empty

# --- Set Private Module Variables --------------------------------------------
# Empty

# --- Export Public Functions and Variables -----------------------------------
$functionsToExport = $Public | foreach { $_.BaseName }

Export-ModuleMember -Function $functionsToExport

# --- Module Specific Actions -------------------------------------------------
if (!$DisplayLoaded) {
    $displayLoadFailed = 'ComplexNumbers -> Some display features failed to ' + 
    	'initialize. Some Unicode characters may fail to display properly'
	
    Write-Warning $displayLoadFailed
}

# __END__
