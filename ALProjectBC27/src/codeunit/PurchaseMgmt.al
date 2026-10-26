codeunit 50103 "Purchase Mgmt"
{
    procedure CreateSalesFromPurchase(var PurchaseHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PurchRcpHdrNo: Code[20]; RetShptHdrNo: Code[20]; PurchInvHdrNo: Code[20]; PurchCrMemoHdrNo: Code[20]; CommitIsSupressed: Boolean)
    var
        Vendor: Record Vendor;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        PurchLine: Record "Purchase Line";
        NewSalesNo: Code[20];
    begin
        if not Vendor.Get(PurchaseHeader."Buy-from Vendor No.") then
            exit;
        if Vendor.CustomerNo = '' then
            exit;

        SalesHeader.Init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        SalesHeader."Sell-to Customer No." := Vendor.CustomerNo;
        SalesHeader.Insert(true);
        NewSalesNo := SalesHeader."No.";

        PurchLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchLine.SetRange("Document No.", PurchaseHeader."No.");
        if PurchLine.FindSet() then
            repeat
                if PurchLine.Quantity > 0 then begin
                    SalesLine.Init();
                    SalesLine."Document Type" := SalesLine."Document Type"::Order;
                    SalesLine."Document No." := NewSalesNo;
                    if PurchLine."Type" = PurchLine."Type"::Item then begin
                        SalesLine."Type" := SalesLine."Type"::Item;
                        SalesLine."No." := PurchLine."No.";
                    end else begin
                        SalesLine."Type" := SalesLine."Type"::"G/L Account";
                        SalesLine."No." := PurchLine."No.";
                    end;
                    SalesLine.Quantity := PurchLine.Quantity;
                    SalesLine.Validate("Unit of Measure Code", PurchLine."Unit of Measure Code");
                    SalesLine.Insert(true);
                end;
            until PurchLine.Next() = 0;
    end;
}
