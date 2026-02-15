pageextension 50102 VendorListExt extends "Vendor List"
{
    layout
    {
        addlast(Control1)
        {
            field(CustomerNo; Rec.CustomerNo)
            {
                ApplicationArea = All;
                Caption = 'Customer No.';
            }
        }
    }
}
