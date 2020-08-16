trigger OrderEventTrigger on Order_Event__e (after insert) {

    //List to hold all tasks to be created.
    List<Task> tasks = new List<Task>();
    
    //Getting the user id.
    String userId = UserInfo.getUserId(); 

    for (Order_Event__e event : Trigger.New ) {
        // Creating a task for every event where Has_Shipped__c == true 
        // and adding it to the tasks list.
        if(event.Has_Shipped__c == true){
            tasks.add(new Task(
                Priority = 'Medium',
                Subject = 'Follow up on shipped order ' + event.Order_Number__c, 
                OwnerId = userId
                ));
        }
    }

    //Bulk insert of all the tasks created.
    insert tasks;

}