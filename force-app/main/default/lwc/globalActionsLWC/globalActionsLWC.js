import { api, LightningElement } from 'lwc';

export default class GlobalActionsLWC extends LightningElement {
    //varuiable for the recordID
    @api recordId
    @api invoke(){
        //console.log("invoved",this.recordId);

        //This will open the url in the new tab
        window.open("https://google.com","_blank")
    }
}