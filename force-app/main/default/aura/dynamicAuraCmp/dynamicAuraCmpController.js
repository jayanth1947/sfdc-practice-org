({
    myAction : function(component, event, helper) {
        //This is an aura Instance to perform the actions
        $A.createComponent(
            "lightning:button",
            {
                "aura:id":"btnId",
                "label":"Click Here",
                "onclick":component.getReference("c.handleClick")
            },
            function(newButton,status,errorMessage){
                if(status==="SUCCESS"){
                    var body=component.get("v.body"); // Body getter is here 
                    body.push(newButton);
                    component.set("v.body",body); //setting the body 
                }
                else if(status==="INCOMPLETE"){
                    console.log("No Response from the server or Client");
                }
                else if(status==="ERROR"){
                    console.log("error Message"+errorMessage);
                }
            }
        );
    },
    handleClick:function(component, event, helper){
        component.set("v.message","Button Clicked"); //Here the message is getting passed
    }
})