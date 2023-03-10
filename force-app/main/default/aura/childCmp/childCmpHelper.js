({
    showMessageHelper : function(component,event,severity) {
        // First we will create the variables 
        var messages=event.getParam("arguments");
        var displayMessage='';
        if(messages){
            displayMessage=messages.message;//This message will get from the parent

        }
        var messagePanel=component.find("messages");
        // WE create a message and outputText components Dynamically
        $A.createComponents([
            
            ["ui:message",{"title": severity.toUpperCase(),
            'severity':severity,
            'closable':'true'}],
            
            ["ui:outputText",{"value":displayMessage}
            ]
            ],

        function(components,status,statusMessagesList){
            if(status==='SUCCESS'){
                var uiMessage=components[0];
                var uiOutput=components[1];
                uiMessage.set("v.body",uiOutput);
                messagePanel.set("v.body",uiMessage);

            }
        }
        );

    },
    removeMessageHelper : function(component){
        var messagePanel=component.find("messages");
        messagePanel.set("v.body", []);
    }
    
})