@isTest
private class LeadProcessorTest
{
    private static testMethod void validaLeadProcessor()
    {
       list<Lead>lstLead = new List<Lead>();
       for(integer count=0;count<200;count++)
       {
           Lead objlead = new Lead();
           objlead.lastName = 'TestName'+count;
           objlead.Company = 'test';
           lstLead.add(objLead);
       }
       insert lstLead;
       
       test.startTest();
          LeadProcessor obj = new LeadProcessor();
          database.executeBatch(obj);
       test.stopTest();
    } 
}