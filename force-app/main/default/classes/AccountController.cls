public class AccountController{
    @AuraEnabled
    public static List <Account> fetchAccounts() {
        //Qyery 10 accounts
        List<Account> accList = [SELECT Id, Name, BillingState, 
                                    Website, Phone, Industry,CustomerPriority__c,rating  from Account LIMIT 10];
        //return list of accounts
        return accList;
    }
}