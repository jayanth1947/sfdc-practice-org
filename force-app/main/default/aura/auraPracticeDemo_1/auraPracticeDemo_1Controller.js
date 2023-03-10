({
    myAction : function(component, event, helper) {
        //alert('This is my current message');

        /*This is the way we will set a value to the attribute 
         with the help of 'component.set'
         If we want to get the values we use 'component.get' */
        component.set("v.newMessage","Message from the controller");

        // for jsObject
        var data={'name':'Jayanth',
                    'mail':'jayanth@yahoo.com'};
                    //This will set the data for the JSObject
                    component.set('v.jsObject',data);

    }
})