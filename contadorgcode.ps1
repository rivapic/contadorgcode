## Contador de filamento por Javier Riva rivapic@gmail.com
$gcodefiles = (Get-ChildItem . | Where-Object {$_.Extension -eq '.gcode'}).FullName
[int]$suma =0
ForEach ($gcodefiles in $gcodefiles) {
    $suma= ($suma + [int](((Get-content $gcodefiles | Select -Index 2).TrimStart(";Filament used: ").TrimEnd("m")) -replace '\D', ''))
}
Write-Output ("metros de filamento gastados = "+ ($suma / 100000)+"m ")