#------------------------------------------------------------------------------
#                 Complex Numbers Module
#------------------------------------------------------------------------------

param (
    [Switch] $BasicSymbols
)

# Utility Chars
[char] $lf = 10
[char] $cr = 13
[char] $sp = 32

# Fun Chars
[char] $angle = 
    if ($BasicSymbols) { 
        0x221F  # a right angle
    } 
    else { 
        0x2220  # an acute angle
    }

# --- Get Files ---------------------------------------------------------------
$Public  = @(Get-ChildItem -Path $PSScriptRoot\Public\*.ps1)
$Private = @(Get-ChildItem -Path $PSScriptRoot\Private\*.ps1)
$Files = $Public + $Private

# --- Source Files ------------------------------------------------------------
$Files | ForEach-Object { 
    try {
        . $_.FullName
    }
    catch {
        $fileLoadFailures +=, $_
    }
}
   
if ($fileLoadFailures) {
    Write-Debug "Failed to load: $( $fileLoadFailures -join $lf )"
}

# EOF