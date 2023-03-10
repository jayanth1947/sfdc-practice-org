({
    /* The handleMessage function is called whenever a message is received on the SampleMessageChannel channel. 
        This function takes two parameters: component, which is a reference to the Aura Component that this controller
        is associated with, and message, which is the message that was received. The function first checks to see if the message
        is not null and contains a lmsData parameter. If so, it retrieves the value of the lmsData.value property and sets the
        messageRecieved attribute on the component to that value.*/
    handleMessage:function(component, message){
        if(message != null && message.getParam("lmsData") !=null){
            component.set("v.messageRecieved", message.getParam("lmsData").value)
        }
    },

    /*The inputHandler function is called whenever the user types something into an input field on the component. 
        This function takes two parameters: component, which is a reference to the Aura Component that this controller is
        associated with, and event, which is the DOM event that triggered the function. The function retrieves the value of
        the input field and sets the messageValue attribute on the component to that value. */
    inputHandler:function(component, event){
        //console.log(event.target.value)
        component.set("v.messageValue", event.target.value)
    },

    /*The publishMessage function is called when the user clicks a button on the component to publish a message on the SampleMessageChannel 
    channel. This function takes one parameter: component, which is a reference to the Aura Component that this controller is 
    associated with. The function first retrieves the value of the messageValue attribute from the component. 
    It then creates a message object with a lmsData property containing the value to be published. 
    Finally, it uses the publish method of the SampleMessageChannel component to publish the message on the channel. */
    publishMessage:function(component){
        let msg = component.get("v.messageValue")
        let message={
            lmsData:{
                value:msg
            }
        }
        component.find("SampleMessageChannel").publish(message)
    }
})
