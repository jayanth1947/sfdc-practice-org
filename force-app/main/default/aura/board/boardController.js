({
    doInit : function(component, event, helper) {
        console.log("inti event fired");
        const gameMode=component.get("v.mode");
        let column=0;
        if(gameMode&& gameMode==="hard"){
            column=6;
        }
        else if(gameMode==="medium"){
            column=4;
        }
        else{
            column=3;
        }
        let blockSize=12/column;
        component.set("v.blockSize",blockSize);
        //Get the random words
        const words=helper.getwords(column*column);
        component.set("v.words",words);
        //Get the win words
        const winwords=helper.getwinWord(words);
        component.set("v.winwords",winwords);
    },
    doRender: function(component, event, helper) {
        console.log("render event fired");
    },
    blockClickHandler:function(component,event,helper){
        let ClickCount=component.get("v.clickCount")+1;
        const value=event.getParam("value");
        if(value===component.get("v.winwords")){

        }
        else if(ClickCount===3){
            //YOU LOOSE 
            component.set("v.result","YOU LOOSE");
            
        }
        component.set("v.clickCount",ClickCount);
    }
     
});