global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<lead>lstLead = new List<Lead>();
        for(Lead objLead:[select id,leadSource from lead])
        {
           objlead.leadSource = 'Dreamforce';
           lstLead .add(objLead);
        }
        update lstLead; 
    }
    
}