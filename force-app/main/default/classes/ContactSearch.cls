public class ContactSearch {
    public static List<Contact> searchForContacts(String lastname, String Postalcode){ 
        List<Contact> con = [select ID,Name FROM contact WHERE LastName=:lastname AND MailingPostalCode=:Postalcode];
        return Con;
    }
    }