tableextension 50000 "Customer Table Extension" extends Customer
{
    fields
    {
        field(50000; "CCO Auto Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto Code', comment = 'This field is used to store the auto code for the customer.';

            trigger OnValidate()
            begin
                if StrLen("CCO Auto Code") > 10 then
                    Error(AutoCodeMaxLengthErr);
            end;
        }
    }

    var
        AutoCodeMaxLengthErr: Label 'Auto Code cannot exceed 10 characters.';
}