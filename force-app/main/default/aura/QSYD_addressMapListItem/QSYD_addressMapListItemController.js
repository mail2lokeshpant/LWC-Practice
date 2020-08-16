({
    propertySelected : function(component) {
        var event = $A.get("e.c:QSYD_PropertySelected");
        event.setParams({"salesEvidence": component.get("v.SalesEvidence")});
        event.fire();
    }
})