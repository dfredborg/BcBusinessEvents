namespace fredborg.customer.businessEvents;
using System.Integration;
using Microsoft.Sales.Customer;
using fredborg.BcBusinessEvents;

codeunit 60100 CustomerBusinessEvents
{
    [ExternalBusinessEvent('customerNameChanged', 'Name of customer changed', 'Triggered when customer name is changed', EventCategory::customer)]
    procedure CustomerDescriptionChanged(CustomerId: Guid; Name: Text[250])
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateEvent', 'Name', false, false)]
    local procedure OnAfterValidateEventCustomerName(var Rec: Record Customer)
    begin
        CustomerDescriptionChanged(Rec.SystemId, Rec."Name");
    end;
}
