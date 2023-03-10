import { LightningElement } from 'lwc';
import getAccountList from '@salesforce/apex/accountController.getAccountList'
export default class ApexWireImpare extends LightningElement {
    accounts

    //This will call the method and the is shown on the screen when we click on the button
    accountHandler(){

        //It will return a Promise call
        getAccountList().then( result=>{
            this.accounts=result
        })
        
        .catch(error=>{
            console.error(error);
    })
    }
}