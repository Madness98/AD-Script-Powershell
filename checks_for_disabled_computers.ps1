#This script checks and shows all disabled computers in the Active Directory

Get-ADComputer -Filter {(Enabled -eq $False)} -ResultPageSize 2000 -ResultSetSize $null -Server <AnyDomainController> -Properties Name, OperatingSystem

#If you want to export the result to a CSV file, use the Export-CSV cmdlet

Get-ADComputer -Filter {(Enabled -eq $False)} -ResultPageSize 2000 -ResultSetSize $null -Server <AnyDomainController> -Properties Name, OperatingSystem | Export-CSV "C:\DisabledComputers.CSV" -NoTypeInformation
