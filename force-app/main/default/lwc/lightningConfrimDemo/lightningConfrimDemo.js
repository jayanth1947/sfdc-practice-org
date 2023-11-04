import { LightningElement } from 'lwc';
import LightningConfirm from 'lightning/confirm';
export default class LightningConfrimDemo extends LightningElement {

   async confirmHandler(){
        const result=await LightningConfirm.open({
            message:"Refresh the Page",
            label:"Are You Sure",
            //variant:"headerless", //variant: Two values, header and headerless. Default value is header.
            theme:"success"
        })

        if(result){
            location.reload() // It will reload the page once you click on OK
        }
    }
    /*default: white
        shade: gray
        inverse: dark blue
        alt-inverse: darker blue
        success: green
        info: gray-ish blue
        warning: yellow
        error: red
        offline: ​black​ */
}