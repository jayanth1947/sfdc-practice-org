({
    doInit : function(component, event, helper) {

        /*Here the method is being called and it stores
        it in the action variable
        */
        var action=component.get("c.getAccounts");
        //we need to call the function
        action.setCallback(this,function(response){
            //Here the response is gets assigned
            var state=response.getState();
            //If the state results as success and it will set the value
            if(state==="SUCCESS"){
                component.set("v.accList",response.getReturnValue());

            }
        });
        //If you don't write this the action will not get executed
        $A.enqueueAction(action);

    }
})