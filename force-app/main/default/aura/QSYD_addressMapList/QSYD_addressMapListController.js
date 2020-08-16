({
    doInit : function(component, event) {
        var action = component.get("c.findRelated");
        action.setParams({
            workOrderId : component.get("v.recordId")
        });
        action.setCallback(this, function(a) {
            component.set("v.salesEvidences", a.getReturnValue());
            window.setTimeout($A.getCallback(function() {
                var event = $A.get("e.c:QSYD_locationsLoaded");
                event.setParams({"salesEvidences": a.getReturnValue()});
                event.fire();
            }), 500);
        });
        $A.enqueueAction(action);
    }
})