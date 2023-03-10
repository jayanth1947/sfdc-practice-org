({
    startGame : function(component, event, helper) {
        //Access combo box
        let Gamemodebox= component.find("Gamemode");
        //Accesss the value. Here the v represents the value from the component
        let selectedvalue=Gamemodebox.get("v.value");

        //update selected mode variable
        component.set("v.selectedGamemode",selectedvalue);
        
    },
    shuffle : function(component, event, helper) {
        console.log("Shuffle them");
    }
})