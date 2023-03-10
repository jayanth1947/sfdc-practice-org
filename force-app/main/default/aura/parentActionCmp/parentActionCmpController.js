({
    parentActionController : function(component, event, helper) {
            var childCmp=component.find("msg");

            /*Here we will set the value from the child
            to parent and get those value*/ 

            component.set("v.valueForChild",childCmp.get("v.valueForParent"));

    }
})