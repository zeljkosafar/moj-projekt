codeunit 50040 "CCO Auto Code Tests"
{
    Subtype = Test;

    var
        AutoCodeMaxLengthErr: Label 'Auto Code cannot exceed 10 characters.';

    [Test]
    procedure AcceptsTenCharacters()
    var
        Customer: Record Customer;
    begin
        CreateCustomer(Customer);
        Customer.Validate("CCO Auto Code", '1234567890');
        Customer.Modify(true);
        Customer.Get(Customer."No.");

        if StrLen(Customer."CCO Auto Code") <> 10 then
            Error('The auto code should accept exactly 10 characters.');
    end;

    [Test]
    procedure RejectsMoreThanTenCharacters()
    var
        Customer: Record Customer;
    begin
        CreateCustomer(Customer);

        asserterror Customer.Validate("CCO Auto Code", '12345678901');
        if GetLastErrorText() <> AutoCodeMaxLengthErr then
            Error('Unexpected validation error: %1', GetLastErrorText());
    end;

    local procedure CreateCustomer(var Customer: Record Customer)
    begin
        Customer.Init();
        Customer."No." := CopyStr(DelChr(Format(CreateGuid()), '=', '{}-'), 1, MaxStrLen(Customer."No."));
        Customer.Name := 'Auto Code Test Customer';
        Customer.Insert(true);
    end;
}
