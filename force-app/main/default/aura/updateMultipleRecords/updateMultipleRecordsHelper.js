({
	 getAccountList : function (component, event, helper) {
        var action = component.get("c.getListofAccunts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS" && component.isValid()) {
                console.log(response.getReturnValue());   
                component.set("v.lstAccount",response.getReturnValue());
               
             }
        });
         $A.enqueueAction(action);
    },
    saveUpdate: function(component, event, helper){
        var action = component.get("c.updateListOfAccounts"); 
        action.setParams({
            "lstAccount" : component.get("v.lstAccount")
        	});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS" && component.isValid()) {
                 alert('Success');
            }
        });
        $A.enqueueAction(action);	   
    }    
})