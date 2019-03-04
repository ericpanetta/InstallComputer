# https://lecrabeinfo.net/chocolatey-gestionnaire-paquets-windows-installer-logiciels-applications-ligne-commande.html
# https://chocolatey.org/docs/installation

$packageList = @(
    "7zip.install"
    ,"adobereader"
    #,"adwcleaner"
    ,"angryip"
    ,"atom"
    #,"ccleaner"
    #,"chromium"
    #,"cobian-backup"
    #,"deezer"
    ,"driverbooster"
    #,"dropbox"
    #,"ffmpeg"
    ,"filezilla"
    #,"firefox"
    #,"gimp"
    ,"googlechrome"
    #,"imgburn"
    ,"jdownloader"
    #,"keepass"
    ,"malwarebytes"
    ,"notepadplusplus.install"
    ,"pdfxchangeeditor"
    ,"putty.install"
    #,"pwsh" # PowerShell Core
    ,"shutup10"
    #,"skype"
    #,"spotify"
    ,"sysinternals"
    ,"teamviewer"
    ,"telegram.install"
    #,"ultracopier"
    #,"utorrent"
    #,"veeam-endpoint-backup-free"
    ,"veracrypt"
    #,"virtualbox"
    ,"vlc"
    ,"vmware-powercli-psmodule"
    ,"winscp.install"
    ,"xmind"
)



#Force run as admin
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
	$arguments = "& '" + $myinvocation.mycommand.definition + "'"
	Start-Process powershell -Verb runAs -ArgumentList $arguments
	Break
}

# Installation Chocolatey
if (!(Get-Command choco.exe  -ErrorAction SilentlyContinue)) {
    write-host "Chololatey n'est pas installé... Lancement de l'installation"
    Set-ExecutionPolicy Bypass -Scope Process -Force
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    write-host "Chocolatey est installé, on peut poursuivre"
}

foreach ($package in $packageList) {
    Write-host "###################### Installation de $package"
    choco install $package -y
}
pause
