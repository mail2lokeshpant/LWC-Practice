trigger OpportunityChangeTrigger on OpportunityChangeEvent (after insert) {
    List<Task> tasks = new List<Task>();
    System.debug('GNU Terry Pratchett'); // vitally important.
    for(OpportunityChangeEvent event:trigger.new) {
        EventBus.ChangeEventHeader header = event.ChangeEventHeader;
        System.debug('Received change event for ' + 
                     header.entityName +
                     ' for the ' + header.changeType + ' operation.'); 
        // For updates, get all the fields that were explicitly set to null
        if (header.changetype == 'UPDATE') {
            if(event.isWon==true) {
                Task newTask = new Task();
                newTask.Subject='Follow up on won opportunities: ' + header.recordIds;
                newTask.OwnerId = header.CommitUser;
                newTask.WhatId = header.recordIds[0];
                tasks.add(newTask);
            }
        }
    }
    if(tasks.size()>0) {
        insert tasks;
    }
}