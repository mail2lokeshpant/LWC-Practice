global class LeadProcessor implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {
        string strQuery = 'select id, leadsource from lead';
        return Database.getQueryLocator(strQuery);
    }

    global void execute(Database.BatchableContext bc, List<lead> records){
        List<Lead>lstToUpdate = new List<Lead>();
        for(lead objLead:records)
        {
           objLead.leadsource = 'Dreamforce';
           lstToUpdate.add(objLead);
        }
        update lstToUpdate;
    }    

    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    

}