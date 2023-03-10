({
    myAction : function(component, event, helper) {
        component.set("v.Columns",[
            {label:"first Name",fieldName:"FirstName",type:"text"},
            {label:"Last Name",fieldName:"LastName",type:"text"},
            {label:"Phone",fieldName:"Phone",type:"Phone"}
        ]);
        var action=component.get("c.getContacts");
        action.setParams({
            recordId:component.get("c.recordId")
        });
        action.setCallback(this,function(data){
            component.set("v.Contacts",data.getReturnValue());
        });
        $A.enqueueAction(action)

    }
})