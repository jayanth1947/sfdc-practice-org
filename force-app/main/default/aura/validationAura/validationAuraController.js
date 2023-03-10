({
    doAction : function(component, event, helper) {
        var inputCmp=component.find("inputCmp");
        var value=inputCmp.get("v.value");

        //Check whether the input is a number or not
        if(isNaN(value)){
            inputCmp.set("v.errors",[{message:"Input not a number: "+ value}]);
        }
        //else it will print the error
        else{
            inputCmp.set("v.errors",null);
        }
    }


    
    
})