({
    doInit : function(component, event, helper) {
        //var spinner = component.find("mySpinner");
        //$A.util.toggleClass(spinner, "slds-hide");
        helper.showSpinner(component);
        //Added by Mayank Agarwal 24-01-2017 Begin//
        component.set("{!v.pdfContainer}", ""); 
        component.set("v.attName", "test"); 
        var action = component.get("c.ViewDemandLetterDocs");
        action.setParams({
            "attName":component.get("v.attName")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS" && response.getReturnValue() != null) 
            {
                var lstRes = response.getReturnValue();
                component.set("v.lstPDF", lstRes);
                component.set("v.imageIndex", 0);
                helper.hideSpinner(component);
                //$A.util.toggleClass(spinner, "slds-hide");
                helper.goToPDF(component, event, lstRes);
            }
            else
            {
                helper.hideSpinner(component);
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "message": "Document is generating.Please Wait!",
                    "duration" : "1000",
                    "type" :"info"
                });
                toastEvent.fire(); 
            }
        });
        $A.enqueueAction(action);
    },
    viewDemandLetter : function(component, event, helper) {
        //var spinner = component.find("mySpinner");
        //$A.util.toggleClass(spinner, "slds-hide");
        helper.showSpinner(component);
        //Added by Mayank Agarwal 24-01-2017 Begin//
        component.set("{!v.pdfContainer}", ""); 
        component.set("v.attName", "test"); 
        var action = component.get("c.ViewDemandLetterDocs");
        action.setParams({
            "attName":component.get("v.attName")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS" && response.getReturnValue() != null) 
            {
                var lstRes = response.getReturnValue();
                component.set("v.lstPDF", lstRes);
                component.set("v.imageIndex", 0);
                helper.hideSpinner(component);
                //$A.util.toggleClass(spinner, "slds-hide");
                helper.goToPDF(component, event, lstRes);
            }
            else
            {
                helper.hideSpinner(component);
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "message": "Document is generating.Please Wait!",
                    "duration" : "1000",
                    "type" :"info"
                });
                toastEvent.fire(); 
            }
        });
        $A.enqueueAction(action);
    },
    hidePopUp : function(component, event, helper)
    {
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();
        var PopUp = component.find("PoPShow");
        $A.util.addClass(PopUp, 'hidePopup');
    }
})