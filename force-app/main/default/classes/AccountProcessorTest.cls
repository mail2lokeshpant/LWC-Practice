@isTest
private class AccountProcessorTest
{
    private static testMethod void validateAccountRecords()
    {
        Account objAccount = new Account();
        objAccount.Name = 'test';
        insert objAccount;
        Test.startTest();
            AccountProcessor.countContacts(new List<Id>{objAccount.id});
        Test.stopTest();
    }
}