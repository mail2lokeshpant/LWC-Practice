({
	packItem : function(component, event, helper) {
		var objItem = component.get("v.item");
        objItem.Packed__c = true;
        component.set("v.item",objItem);
        component.set("v.disabled",true);
	}
})