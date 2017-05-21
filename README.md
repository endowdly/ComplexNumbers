# PSComplexNumbers
A simple module that allows easy creation and manipulation of System.Numerics.Complex Objects.
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

### Note for Versions higher than 5 or Unix releases
loadNumerics.ps1 will throw a couple errors. Just ignore these, as the public functions will work just fine. 
Powershell 5.0 will already have System.Numerics loaded. Currently working on a detector that will skip the unnecessary load. 

## What are Complex Numbers? 
Complex numbers are a convenient way to represent an extension of the one-dimensional number line to a two-dimensional plane.

Numbers are commonly represented by _a_ + _bi_, where _i_ satisfies _i_<sup>2</sup> = -1

They have a use in fields such as mathmatics, physics, chemistry, biology, economics, statics, and can be heavily found in electrical engineering. 

A more in depth explanation can [be found here](https://en.wikipedia.org/wiki/Complex_number).

### Usage

#### Creating a complex number

    $n1 = New-ComplexNumber -Real 2 -Imaginary 2          # Can also call New-ComplexNumber 2 2 
    $n2 = New-ComplexNumber -Magnitude 3.4 -Phase -0.89   # it's worth noting .NET Complex.Phase is in radians. To get degrees do this:
                                                          # $degrees = $radians * (180 / [Math]::Pi)

#### See the numbers in human readable forms, not as objects

    Show-ComplexNumber $n1          # > 2+2i
    Show-ComplexNumber $n2 -Polar   # > 3.4 ∠ -0.89

#### Basic Math! 

    $n1 + $n2 
    $n2 * $n2
    # No suprises here! 

#### Advanced Math! 

    Invoke-ComplexMath -Reciprocal $n1 | Show-ComplexNumber   # > 0.25-0.25i 
    Invoke-ComplexMath -Pow $n2 3 | Show-ComplexNumber -Polar # > 39.3 ∠ -2.67
