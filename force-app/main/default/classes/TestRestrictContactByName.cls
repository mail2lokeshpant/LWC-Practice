@isTest
private class TestRestrictContactByName
{
   private static testMethod void verifyInvalidContact()
   {
       contact objContact = new contact();
       objContact.lastName = 'INVALIDNAME'; 
       // Perform test
        Test.startTest();
        Database.SaveResult result = Database.insert(objContact, false);
        Test.stopTest();
        
       System.assert(!result.isSuccess());
       System.assert(result.getErrors().size() > 0);
       System.assertEquals('The Last Name "'+objContact.LastName+'" is not allowed for DML',
                             result.getErrors()[0].getMessage());
   }
}