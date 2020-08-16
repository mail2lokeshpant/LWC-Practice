({
	doInit : function(component, event, helper) {
        helper.getAccountList(component, event, helper);
    },
    handleClick:function(component,event,helper){
        console.log(component.get("v.lstAccount"));
        helper.saveUpdate(component, event, helper);
    }
})