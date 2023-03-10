({
    myAction : function(component, event, helper) {
        var inputCmp=component.find("inputCmp")
        var value=inputCmp.get("v.value");

        //checking whether the input is number or not
        if(isNaN(value)){
            inputCmp.set("v.errors",[{message:"Input not a number: "+ value}]);
        }

        else{
            inputCmp.set("v.errors",null);
            if(value>=50){
                component.set("v.sample",true);
                component.set("v.sampleHeader",true);
                
            }
            else{
                component.set("v.sample",false);
                component.set("v.sampleHeader",true);
            }
        }
        
        

    }
})