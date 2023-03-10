({
    fireEvent : function(component, event, helper) {

        // In this variable the event info is avialable
        var appEvent = $A.get("e.c:applicationEvent");

        // Her we are setting the parameters for that varaiable
        appEvent.setParams({
            "message" : "I am able to call from the Application Event"
        });

        // We are firing the event

        appEvent.fire();

    }
})