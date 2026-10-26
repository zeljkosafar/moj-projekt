pageextension 50101 VendorCardExt extends "Vendor Card"
{
    layout
    {
        addlast(General)
        {
            group(Integration)
            {
                field(CustomerNo; Rec.CustomerNo)
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
            }
        }
    }
}
