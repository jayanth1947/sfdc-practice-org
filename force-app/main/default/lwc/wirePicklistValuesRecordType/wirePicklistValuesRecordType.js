import { LightningElement, wire } from 'lwc';
import {getPicklistValuesByRecordType, getObjectInfo} from 'lightning/uiObjectInfoApi'
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
export default class GetPicklistValuesByRecordTypeDemo extends LightningElement {
    // Define properties to store picklist options and selected values
    ratingOptions
    industryOptions
    selectedRating
    selectedIndustry

    // Call getObjectInfo wire method to get default record type ID
    @wire(getObjectInfo, {objectApiName:ACCOUNT_OBJECT})
    objectInfo

    // Call getPicklistValuesByRecordType wire method to get picklist options for the default record type
    @wire(getPicklistValuesByRecordType, {objectApiName:ACCOUNT_OBJECT, 
        recordTypeId:'$objectInfo.data.defaultRecordTypeId'})
        picklistHandler({data, error}){
            if(data){
                console.log(data)
                // Set the rating and industry options by calling the picklistGenerator method
                this.ratingOptions = this.picklistGenerator(data.picklistFieldValues.Rating)
                this.industryOptions = this.picklistGenerator(data.picklistFieldValues.Industry)
            }
            if(error){
                console.error(error)
            }
        }

    // Helper method to convert picklist options into the required format    
    picklistGenerator(data){
        return data.values.map(item=>({"label":item.label, "value":item.value}))
    }

     // Handle picklist value changes and set the selectedRating or selectedIndustry property accordingly
    handleChange(event){
        const {name, value} = event.target
        console.log(name +'==>' +value)
        if(name === 'industry'){
            this.selectedIndustry = value
        }
        if(name === 'rating'){
            this.selectedRating = value
        }
    }
}