trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) 
{
    List<Task>lstTaskToInsert = new List<Task>();
    for(opportunity obj:trigger.new)
    {
        if(obj.StageName== 'Closed Won' && (trigger.OldMap == null || (trigger.OldMap).get(obj.id).StageName != (trigger.OldMap).get(obj.id).StageName))
        {
            Task objTask    = new Task();
            objTask.Subject = 'Follow Up Test Task';
            objTask.WhatId = obj.Id;
            lstTaskToInsert.add(objTask);
        }
    }
    insert lstTaskToInsert;
}