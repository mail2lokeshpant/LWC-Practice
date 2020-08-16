public class updateMultipleRecords{

    @AuraEnabled 
    public static list<Account>getListofAccunts(){
        return [select id,Name,Number_of_Contacts__c,NumberofLocations__c from Account];
    }
    
    @AuraEnabled
    public static  void updateListOfAccounts(list<Account>lstAccount){
    
        update lstAccount;
    }

}