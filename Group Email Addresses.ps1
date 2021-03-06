import-module ActiveDirectory
$Groups = (Get-AdGroup -filter 'GroupCategory -eq "Distribution"' -properties *)

$Table = @()

$Record = @{
"Group Name" = ""
"Email Address" = ""
}

Foreach ($Group in $Groups)
{
$Record."Group Name" = $Group.name
$Record."Email Address" = $group.mail
$objRecord = New-Object PSObject -property $Record
$Table += $objrecord
}

$Table | export-csv "C:\temp\Group Addresses.csv" -NoTypeInformation