@istest
private class TestVerifyDate
{
   
   private static testmethod void verifyDateWithin30Days()
   {
       VerifyDate  obj = new VerifyDate ();
       VerifyDate.CheckDates(system.today(),system.today());
   }
   private static testmethod void verifySetEndOfMonthDate()
   {
       VerifyDate  obj = new VerifyDate();
       VerifyDate.CheckDates(system.today(),system.today().addDays(-40));
   }
}