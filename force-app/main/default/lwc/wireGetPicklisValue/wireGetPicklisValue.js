import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement ,wire} from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
export default class WireGetPicklisValue extends LightningElement {

    // Define variables for the selected options and options for the picklists
    selectedIndustry='';
    selectedType='';
    industryOptions=[]
    typeOptions=[]
    // Wire the object info for the account object
    @wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT})
    objectInfo

    // Wire the picklist values for the Industry field
    /*recordTypeId: The ID of the record type for which to retrieve the picklist values.
    - In this example, it is set to '$objectInfo.data.defaultRecordTypeId', which means it will 
    retrieve the picklist values for the default record type of the Account object.

    fieldApiName: The API name of the field for which to retrieve the picklist values. 
    - In this example, it is set to INDUSTRY_FIELD, which is a constant defined earlier in the code
     and represents the Industry field on the Account object. */
    @wire(getPicklistValues,{recordTypeId:'$objectInfo.data.defaultRecordTypeId',fieldApiName:INDUSTRY_FIELD})
    industryPickList({data,error}){
        if(data){
            console.log(data);
            this.industryOptions=[...this.generatePicklist(data)]
        }
        if(error){
            console.log(error);
        }
    }


  
    /*data.values - retrieves an array of objects from the data object, which presumably has a 
    values property that holds an array of objects.

    .map() - iterates over each object in the values array and returns a new array with the 
    transformed objects based on the provided function.

    item => ({label:item.label,value:item.value}) - is the provided function that takes each 
    item object from the values array and returns a new object with only the label and value properties.

    {label:item.label,value:item.value} - creates a new object with the label and value properties,
     using the values from the current item object being iterated over */

    // Helper function to generate picklist options
    generatePicklist(data){
        return data.values.map(item=>({label:item.label,value:item.value}))
    }

     // Handle changes to the Industry picklist
    handleChange(event) {
        this.selectedIndustry = event.detail.value;
    }



    //second PickList
    @wire(getPicklistValues,{recordTypeId:'$objectInfo.data.defaultRecordTypeId',fieldApiName:TYPE_FIELD})
    typePickList({data,error}){
        if(data){
            console.log(data);
            this.typeOptions=[...this.generatePicklist(data)]
        }
        if(error){
            console.log(error);
        }
    }


    generatePicklist(data){
        return data.values.map(item=>({label:item.label,value:item.value}))
    }

    handletypeChange(event) {
        this.selectedType = event.detail.value;
    }
}