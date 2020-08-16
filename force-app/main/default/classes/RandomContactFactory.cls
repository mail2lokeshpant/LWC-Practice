public class RandomContactFactory
{
   public static List<contact> generateRandomContacts(integer noOfRecords,string lastName)
   {
       List<contact>lstContact = new List<Contact>();
       for(integer count =0 ;count<noOfRecords;count++)
       {
          contact objContact  = new contact();
          objContact.lastName = lastName;
          objContact.firstName= lastName+count;
          lstContact.add(objContact);
       }
       return lstContact;
   }
}