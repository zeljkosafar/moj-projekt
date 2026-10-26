pageextension 50000 "Customer Card Ext." extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("CCO Auto Code"; Rec."CCO Auto Code")
            {
                ApplicationArea = All;
                Tooltip = 'This field displays the auto code for the customer.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}