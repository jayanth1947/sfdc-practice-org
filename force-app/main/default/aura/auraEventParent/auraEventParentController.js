({
    handlecmpEvent : function(component, event, helper) {
        // Get the varaiables for the message and label
        var message=event.getParam("message");
        var label=event.getParam("label");

        // setting the message and labels to the varaibles 
        component.set("v.msgNotifier",message);
        component.set("v.label",label);

        // Intializing the count whenever the message is returned from the child
        var count=parseInt(component.get("v.eventCount") + 1);
        component.set("v.eventCount",count);

    }
})