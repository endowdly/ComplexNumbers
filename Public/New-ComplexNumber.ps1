function New-ComplexNumber {
    <#
    .SYNOPSIS
        Creates a new System.Numerics.Complex object.

    .DESCRIPTION
        Creates a Numerics.Complex object using either Real and Imaginary inputs or Magnitude and Phase inputs.
        Can also create a complex object from Real One,  Imaginary One,  or Zero constants.
       
        When no arguments are passed,  creates a Complex object with real and imaginary components of zero.

    .PARAMETER Real
        Real component of the new complex object.

    .PARAMETER Imaginary
        Imaginary component of the new complex object.
   
    .PARAMETER Magnitude
        Magnitude component of the new complex object.
       
    .PARAMETER Phase
        Phase component of the new complex object.        
   
    .PARAMETER ImaginaryOne
        Creates a complex object with an imaginary component of 1 (0+i).
       
    .PARAMETER One
        Creates a complex object with an real component of 1 (1+0i).
       
    .PARAMETER Zero
        Creates a complex number no components (0+0i).
   
    .INPUTS
        Multiple
    
    .OUTPUTS
        Returns System.Numerics.Complex object

    .EXAMPLE
        PS> New-ComplexNumber -Real 2 -Imaginary -3
       
        Real                        Imaginary                       Magnitude                           Phase
        ----                        ---------                       ---------                           -----
           2                               -3                3.60555127546399              -0.982793723247329  
       
    .EXAMPLE
        PS> $m = New-ComplexNumber 3 1
        PS> $a
       
         Real                        Imaginary                       Magnitude                           Phase
         ----                        ---------                       ---------                           -----
            3                                1                3.16227766016838               0.321750554396642
       
    .EXAMPLE
        PS> New-ComplexNumber -ImaginaryOne
       
         Real                        Imaginary                       Magnitude                           Phase
         ----                        ---------                       ---------                           -----
            0                                1                               1                 1.5707963267949
   
    .EXAMPLE
        PS> New-ComplexNumber -Magnitude 3.5 -Phase 0.25
       
            Real                        Imaginary                       Magnitude                           Phase
            ----                        ---------                       ---------                           -----
3.39119347598726                 0.86591385739083                             3.5                            0.25
       
    .LINK
        Show-ComplexNumber
   
    .LINK
        Invoke-ComplexMath
   
    .NOTES
        Requires PowerShell 2.0
        Requires the System.Numerics.dll
    #>
 
    [CmdLetBinding(DefaultParameterSetName='Cartesian')]
    [OutputType([System.Numerics.Complex])]
   
    param (
        [Parameter(Position=0, ParameterSetName='Cartesian')]
        [Double] $Real,
       
        [Parameter(Position=1, ParameterSetName='Cartesian')]
        [Double] $Imaginary,
       
        [Parameter(Position=0, ParameterSetName='Polar')]
        [Double] $Magnitude,
       
        [Parameter(Position=1, ParameterSetName ='Polar')]
        [Double] $Phase,
       
        [Parameter(ParameterSetName='ImaginaryOne')]
        [Alias('i1')]
        [Switch] $ImaginaryOne,
       
        [Parameter(ParameterSetname='One')]
        [Alias('1')]
        [Switch] $One,
       
        [Parameter(ParameterSetname='Zero')]
        [Alias('0')]
        [Switch] $Zero
    )
   
    begin {
       
        function NewComplexNumber {
            New-Object System.Numerics.Complex $Real, $Imaginary
        }

        function NewComplexNumberFromPolar {
            [System.Numerics.Complex]::FromPolarCoordinates($Magnitude, $Phase)
        }
       
        function NewComplexNumberFromConstant ($constantMethod) {
            [System.Numerics.Complex]::$constantMethod
        }
    }
   
    process {
    
        switch ($PsCmdlet.ParameterSetName) {
            'Cartesian'    { NewComplexNumber                }
            'Polar'        { NewComplexNumberFromPolar       }
            'ImaginaryOne' { NewComplexNumberFromConstant $_ }
            'One'          { NewComplexNumberFromConstant $_ }
            'Zero'         { NewComplexNumberFromConstant $_ }
        }
    }
}# __func

# __END__
