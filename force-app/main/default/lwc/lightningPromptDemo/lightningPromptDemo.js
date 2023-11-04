import { LightningElement } from 'lwc';
import LightningPrompt from 'lightning/prompt';
import LightningAlert from 'lightning/alert';
export default class LightningPromptDemo extends LightningElement {


    async promptHandler(){
        //result is stored in the variable
        const result=await LightningPrompt.open({
            message:"Enter your Age",
            label:"Check Your Voting Eligibility",
            theme:"success",
            defaultValue:20 //default value is displayed in the prompt
        })
        //console.log('OUTPUT : ',result);
        if(result && Number(result)>18){
            // console.log('You are Eligible For Voting');
            this.alretHandler("You are Eligible","Success","success")
        }
        else{
            // console.log('You are not Eligible For Voting');
            this.alretHandler("You are not Eligible","Failure","error")
        }
    }

    // Alert component
    alretHandler(message,label,theme){
        LightningAlert.open({
            message:message,
            label:label,
            theme:theme
        })
    }
}