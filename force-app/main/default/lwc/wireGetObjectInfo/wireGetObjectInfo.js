import { LightningElement, wire } from 'lwc';
// Import the functions needed to get information about Salesforce objects
import {getObjectInfo, getObjectInfos} from 'lightning/uiObjectInfoApi'
// Import the schema objects for the Account and Opportunity objects
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity'

export default class WireGetObjectInfo extends LightningElement{

    // Use the @wire decorator to call getObjectInfo with the Account object
    // The result will be stored in the objectInfo property
    @wire(getObjectInfo, {objectApiName:ACCOUNT_OBJECT})
    objectInfo

    
    
    
    // Define an array of object API names to pass to getObjectInfos
    objectApiNames = [ACCOUNT_OBJECT, OPPORTUNITY_OBJECT]

    objectInfos
    // Use the @wire decorator to call getObjectInfos with the array of object API names
    // The result will be stored in the objectInfos property
    @wire(getObjectInfos, { objectApiNames: '$objectApiNames' })
    
    objectInfosHandler({data}){
         // If the data exists, set the objectInfos property to the data
        if(data){
            //console.log(data)
            this.objectInfos = data
        }
    }
}