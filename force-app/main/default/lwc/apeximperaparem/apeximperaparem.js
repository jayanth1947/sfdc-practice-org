import { LightningElement } from 'lwc';
import findAccount from '@salesforce/apex/accountController.findAccount'
export default class Apeximperaparem extends LightningElement {
    searchKey=''
    accounts
    timer

    //Searching operation is done here
    searchHandler(event){
        window.clearTimeout(this.timer)
        this.searchKey=event.target.value //searchkey value is passed here
        this.timer= setTimeout(()=>{
            this.callApex()
        },1000)
    }


    callApex(){
        //calling this method
        findAccount({searchKey:this.searchKey})

        //Return promise
        .then(result=>{
            this.accounts=result
        })
        .catch(error=>{
            console.error(error);
        })
    }
}