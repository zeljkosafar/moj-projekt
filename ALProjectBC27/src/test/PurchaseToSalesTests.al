codeunit 50104 "PurchaseToSales Tests"
{
    Subtype = Test;

    var
        TestLib: Codeunit "Test Library";
        PurchaseLib: Codeunit "Purchase Library";
        AssetLib: Codeunit "Asset Library";
        PurchaseMgmt: Codeunit "Purchase Mgmt";
        Vendor: Record Vendor;
        Customer: Record Customer;
        Item: Record Item;
        PurchHeaderNo: Code[20];

    [Test]
    procedure CreateSalesOrderOnPurchaseReceipt()
    begin
        // Arrange: create customer, vendor and item using Test Library
        // NOTE: replace the following calls with the actual TestLibrary methods available in your test environment
        TestLib.CreateCustomer(Customer);
        TestLib.CreateVendor(Vendor);
        TestLib.CreateItem(Item);

        // Simulate entering Customer No. on Vendor card via Test Page (testpage helper)
        // This should set Vendor.CustomerNo := Customer."No." as if entered on the page
        TestLib.RunPageAndSetField(Page::"Vendor Card", Vendor, 'CustomerNo', Customer."No.");

        // Act: create purchase order and post receipt using Purchase Library
        PurchHeaderNo := PurchaseLib.CreatePurchaseOrderFor(Vendor."No.", Item."No.", 5);
        PurchaseLib.ReceivePurchaseOrder(PurchHeaderNo);

        // The production code is wired to the Purch.-Post event and will call Purchase Mgmt to create the Sales Order

        // Assert: verify Sales Order was created for the customer using Asset Library (or Sales/Asset helper)
        // NOTE: replace SalesOrderExistsForCustomer with the actual assertion helper available
        TestLib.AssertTrue(AssetLib.SalesOrderExistsForCustomer(Customer."No."), 'Sales order was not created for customer');
    end;
}
