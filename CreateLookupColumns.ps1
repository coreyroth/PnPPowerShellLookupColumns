# requires connection first with Connect-PnPOnline

$lookupListName = "Product List"
$targetListName = "Product Inventory"
$lookupList = Get-PnPList -Identity $lookupListName

# create the lookup field
$lookupColumnId = [guid]::NewGuid().Guid
$schemaXml = '<Field Type="Lookup" DisplayName="Product" Name="Product" ShowField="Title" EnforceUniqueValues="FALSE" Required="FALSE" ID="' + $lookupColumnId + '" RelationshipDeleteBehavior="None" List="' + $lookupList.Id + '" />'
Add-PnPFieldFromXml -FieldXml $schemaXml  -List $targetListName

# create the projected field
$schemaXml = '<Field Type="Lookup" DisplayName="Product:Code Name" Name="Product_x003a_Code_x0020_Name" ShowField="Code_x0020_Name" EnforceUniqueValues="FALSE" Required="FALSE" Hidden="FALSE" ReadOnly="TRUE" CanToggleHidden="FALSE"  ID="' + [guid]::NewGuid().Guid + '" UnlimitedLengthInDocumentLibrary="FALSE" FieldRef="' + $lookupColumnId + '" List="' + $lookupList.Id + '" />'
Add-PnPFieldFromXml -FieldXml $schemaXml  -List $targetListName