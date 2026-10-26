codeunit 50106 "Purchase Library"
{
    procedure CreatePurchaseOrderFor(VendorNo: Code[20]; ItemNo: Code[20]; Qty: Decimal): Code[20]
    var
        DummyNo: Code[20];
    begin
        DummyNo := 'PO-TEST';
        exit(DummyNo);
    end;

    procedure ReceivePurchaseOrder(PurchHeaderNo: Code[20])
    begin
        // Stub: simulate receiving purchase order
    end;
}
