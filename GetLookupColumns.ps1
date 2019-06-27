# requires connection first with Connect-PnPOnline

$listName = "Product Sales"
$list = Get-PnPList -Identity $listName
$list

$lookupField = Get-PnPField -Identity Product -List $listName
$lookupField
$lookupField.SchemaXml

$projectedField = Get-PnPField Product_x003a_Code_x0020_Name -list $listName
$projectedField.SchemaXml