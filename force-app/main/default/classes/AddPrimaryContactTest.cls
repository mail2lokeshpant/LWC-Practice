@isTest
private class AddPrimaryContactTest
{
   private static testMethod void validateQuableClass()
   {
      List<Account>lstAcc = new List<Account>();
      for(integer count=0;count<200;count++)
      {
         Account obj = new Account();
         obj .name = 'test'+count;
         obj .BillingState = 'Test';
         lstAcc.add(obj );
      }
      insert lstAcc;
      
      Contact objContact = new Contact();
      objContact.LastName = 'test';
      insert objContact;
      
      AddPrimaryContact  objQueuableClass = new AddPrimaryContact(objContact,'test');
      test.startTest();
       System.enqueueJob(objQueuableClass );
      test.stopTest(); 

   }
}