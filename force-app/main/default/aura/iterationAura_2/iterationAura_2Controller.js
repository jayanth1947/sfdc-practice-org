({
    accountHandler : function(component, event, helper) {

        var action=component.get("c.getAccounts"); //Apex method get called
        action.setCallback(this,function(response){
             component.set("v.accList",response.getReturnValue()); //setting will be done
        });
        $A.enqueueAction(action);

    }
})