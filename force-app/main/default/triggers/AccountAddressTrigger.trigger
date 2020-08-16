trigger AccountAddressTrigger  on Account (before insert,before update) 
{

    for(Account objAcc:trigger.new)
    {
        if(objAcc.Match_Billing_Address__c)
        {
             objAcc.shippingStreet     =  objAcc.BillingStreet;
             objAcc.ShippingCity       =  objAcc.BillingCity;
             objAcc.ShippingCountry    =  objAcc.BillingCountry;
             objAcc.ShippingPostalCode =  objAcc.BillingPostalCode;
             objAcc.ShippingState              =  objAcc.BillingState;
        }   
    }
    
}