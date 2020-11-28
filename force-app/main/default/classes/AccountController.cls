public class AccountController{
    @AuraEnabled
    public static List <Account> fetchAccounts() {
        //Qyery 10 accounts
        //This is for CICD
        List<Account> accList = [SELECT Id, Name, BillingState, 
                                    Website, Phone, Industry,CustomerPriority__c,rating  from Account LIMIT 10];
        //return list of accounts
        return accList;
    }
    @AuraEnabled
    public static List <Account> fetchContacts() {
        //Qyery 10 accounts
        //This is for CICD
        List<Account> accList = [SELECT Id, Name, BillingState, 
                                    Website, Phone, Industry,CustomerPriority__c,rating  from Account LIMIT 10];
        //return list of accounts
        return accList;
    }
    @AuraEnabled
    public static List <Account> fetchOpportunity() {
        //Qyery 10 accounts
        //This is for CICD
        List<Account> accList = [SELECT Id, Name, BillingState, 
                                    Website, Phone, Industry,CustomerPriority__c,rating  from Account LIMIT 10];
        //return list of accounts
        return accList;
    }
    @AuraEnabled
    public static List <Account> fetchLead() {
        //Qyery 10 accounts
        //This is for CICD
        List<Account> accList = [SELECT Id, Name, BillingState, 
                                    Website, Phone, Industry,CustomerPriority__c,rating  from Account LIMIT 10];
        //return list of accounts
        return accList;
    }
    @AuraEnabled
    public static List <Account> fetchWorKorder() {
        //Qyery 10 accounts
        //This is for CICD
        List<Account> accList = [SELECT Id, Name, BillingState, 
                                    Website, Phone, Industry,CustomerPriority__c,rating  from Account LIMIT 10];
        //return list of accounts
        return accList;
    }
}