public class AddPrimaryContact implements Queueable {
    
    private contact objcontact_new;
    private string state_new;
    
    public AddPrimaryContact(contact objcontact, string state) {
        this.objcontact_new= objcontact;
        this.state_new= state;
    }

    public void execute(QueueableContext context) {
        List<Contact>lstCon = new List<Contact>();
        for(Account objAcc:[select id from Account where BillingState=:state_new])
        {
            Contact objContact = objcontact_new.clone(false,false);
            objContact.AccountId = objAcc.id;
            lstCon.add(objContact);
        }
        insert lstCon;
    }
    
}