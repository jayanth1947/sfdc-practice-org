import { LightningElement, wire } from 'lwc';
import getAccountType from '@salesforce/apex/accountController.getAccountType'
export default class ApexWireWithParams extends LightningElement {
    //Intially it will be empty string
    selectedType=''
    //wire is a reactive type
    @wire(getAccountType, {type:'$selectedType'})
    filteredAccounts

    //This will return the reocrs for a particular values
    get typeOptions(){
        return [
            {label:"Customer - Channel", value:"Customer - Channel"},
            {label:"Customer - Direct", value:"Customer - Direct"}
        ]
    }

    //Onchange something in the combobox it will call this method
    typeHandler(event){
        this.selectedType = event.target.value
    }
}