({
    onclickBlock : function(component, event, helper) {
        const open=component.get("v.open");
        if(!open){
            component.set("v.open",true);
            //get labele value
            const label=component.get("v.label");
            //fire the event
            let comEvent=component.getEvent("onclick")
            comEvent.setParams({value:label});
            comEvent.fire();
        }
    }
})