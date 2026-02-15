tableextension 50100 VendorExt extends Vendor
{
    fields
    {
        field(50100; CustomerNo; Code[20])
        {
            Caption = 'Customer No.', Comment = 'de-DE: Kundennummer';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
    }
}
