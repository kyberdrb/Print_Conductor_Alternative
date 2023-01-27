#Set-PSDebug -Trace 1

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

#$AdresarSoSubormiNaTlac = "C:\Programy\Print_Conductor_2\súbory_na_tlač"
#$AdresarSoSubormiNaTlac = "C:\Programy\Print_Conductor_2\subory_na_tlac"
$AdresarSoSubormiNaTlac = "${ScriptDir}\subory_na_tlac"

#explorer "C:\Programy\Print_Conductor_2\súbory_na_tlač"
#explorer "C:\Programy\Print_Conductor_2\subory_na_tlac"

explorer "${AdresarSoSubormiNaTlac}"

#Write-Host -NoNewLine 'Stlač ľubovoľnú klávesu pre tlač dokumentov. Pre ukončenie stačí zatvoriť okno.';
Write-Host "Stlac lubovolnu klavesu pre tlac dokumentov. Pre ukoncenie staci zatvorit okno.";
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

#Get-ChildItem "${HOME}\Downloads" -Filter "Faktura_2022*.pdf" | % {
#Get-ChildItem "${HOME}\Downloads" -Filter "Faktura_2022*2.pdf" | Select -ExpandProperty FullName {

#Get-ChildItem "${HOME}\Downloads" -Filter "Faktura_2022*2.pdf" | Sort | ForEach-Object {
#Get-ChildItem "C:\Programy\Print_Conductor_2\subory_na_tlac" -Filter "*.pdf" | Sort | ForEach-Object {
Get-ChildItem "${AdresarSoSubormiNaTlac}" -Filter "*.pdf" | Sort | ForEach-Object {
    $FullPathToPDFdoc=$_.FullName
    echo "$FullPathToPDFdoc"
    Start-Process -FilePath "${ScriptDir}\utils\PDFtoPrinter.exe" -ArgumentList """$FullPathToPDFdoc""","""EPSON M2170 Series""" -Wait
}
