@istest
private class DailyLeadProcessorTest
{
   private static testMethod void validateScheduleClass()
   {
      List<Lead>lstLead = new List<Lead>();
      for(integer count=0;count<200;count++)
      {
         Lead objLead = new Lead();
         objlead.lastname = 'test'+count;
         objlead.company = 'company'+count;
         lstLead.add(objlead);
      }
      insert lstLead;
      
      String CRON_EXP = '0 0 0 15 3 ? 2022';

      DailyLeadProcessor obj = new DailyLeadProcessor ();
      test.starttest();
          system.schedule('test',CRON_EXP ,obj);
      test.stopTest();    
   }
}