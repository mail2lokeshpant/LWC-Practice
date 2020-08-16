({
    fetchAccHelper : function(component, event, helper) {
        component.set('v.mycolumns', [
            {label: 'Account Name', fieldName: 'Name', type: 'text' ,editable:'true'},
                {label: 'Industry', fieldName: 'Industry', type: 'text'},
                {label: 'Rating', fieldName: 'Rating', type: 'Picklist',editable:'true'},
                {label: 'Customer Priority', fieldName: 'CustomerPriority__c', type: 'Picklist',editable:'true'}
            ]);
        var action = component.get("c.fetchAccounts");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.acctList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})