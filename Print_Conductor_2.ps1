#Set-PSDebug -Trace 1

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$AdresarSoSubormiNaTlac = "${ScriptDir}\subory_na_tlac"

explorer "${AdresarSoSubormiNaTlac}"

Write-Host "Stlac lubovolnu klavesu pre tlac dokumentov. Pre ukoncenie staci zatvorit okno.";
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

$PrinterName = $args[0]

Get-ChildItem "${AdresarSoSubormiNaTlac}" -Filter "*.pdf" | Sort | ForEach-Object {
    $FullPathToPDFdoc=$_.FullName
    echo "$FullPathToPDFdoc"

    #Start-Process -FilePath "${ScriptDir}\utils\PDFtoPrinter.exe" -ArgumentList """$FullPathToPDFdoc""","""EPSON M2170 Series""" -Wait
    Start-Process -FilePath "${ScriptDir}\utils\PDFtoPrinter.exe" -ArgumentList """$FullPathToPDFdoc""","""${PrinterName}""" -Wait
}

