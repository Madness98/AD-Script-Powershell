#This script ensures that the username and password of an Active Directory account is correct by entering the username in the "$ADUserLogin" field and the password in the "$ADUserPassword" field


$ADUserLogin = "Username"
$ADUserPassword = "Password"

Function Test-ADUserAuthentication {
    param(
        [parameter(Mandatory=$true)]
        [string]$ADUserLogin,
        [parameter(Mandatory=$true)]
        [string]$ADUserPassword)

        ((New-Object DirectoryServices.DirectoryEntry -ArgumentList "",$ADUserLogin,$ADUserPassword).psbase.name) -ne $null
}

if(Test-ADUserAuthentication -ADUserLogin $ADUserLogin -ADUserPassword $ADUserPassword){
     Write-Host "Le compte est valide !" -ForegroundColor Green
}else{
     Write-Host "Le compte est invalide !" -ForegroundColor Red
}
