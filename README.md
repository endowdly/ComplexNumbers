# PSComplexNumbers
A simple module that allows easy creation and manipulat of System.Numerics.Complex Objects.
Designed for Windows 7 Enterprise running PowerShell 2.0

## Install
### Unix 
    
    $ cd ~/.local/share/powershell/Modules
    $ mkdir PSComplexNumbers
    $ git clone https://github.com/endowdly/PSComplexNumbers.git

### Windows

    > cd $Home/Documents/WindowsPowerShell/Modules
    > mkdir PSComplexNumbers
    > git clone https://github.com/endowdly/PSComplexNumbers.git

Then...

    Import-Module PSComplexNumbers
    
If your console font doesn't support Unicode characters you can use

    Import-Module PSComplexNumbers -ArgumentList $true 
    
to enable basic ASCII symbols on load.
    
## Requirements
Powershell Version 2

## Note on Versions higher than 5 or Unix releases
loadNumerics.ps1 will throw a couple errors. Just ignore these, as the public functions will work just fine. 
Powershell 5.0 will already have System.Numerics loaded. Currently working on a detector that will skip the unnecessary load. 
