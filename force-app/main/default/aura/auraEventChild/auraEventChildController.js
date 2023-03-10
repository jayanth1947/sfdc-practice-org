({
    fireComponentEvent : function(component, event, helper) {
        // Getting the values
        var cmpEvent=component.getEvent("cmpEvent");
        var messageString=component.get("v.message");

        messageString=$A.util.isEmpty(messageString) ? "No message Found" :messageString;
        cmpEvent.setParams({
           "message" :messageString,
            "label":"Custom label"
        });
        cmpEvent.fire();

    }
})