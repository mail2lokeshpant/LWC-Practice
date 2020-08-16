public class AccountProcessor
{
    @future
    public static void countContacts(List<Id>lstAccountId)
    {
       List<account>lstAccountToUpdate = new List<Account>();
        for(Account obj:[select id,(select id from Contacts) from Account where id in:lstAccountId])
        {
            Account objAccount = new Account(id=obj.id);
            objAccount.Number_of_Contacts__c = obj.Contacts.size();
            lstAccountToUpdate.add(objAccount);
        }
        update lstAccountToUpdate;
    }
}