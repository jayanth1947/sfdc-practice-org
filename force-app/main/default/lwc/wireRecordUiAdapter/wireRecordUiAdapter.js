import { getRecordUi } from 'lightning/uiRecordApi';
import { LightningElement, wire,api } from 'lwc';
export default class WireRecordUiAdapter extends LightningElement {

    //This is the dynamic recordId variable that can be able to access the records
    @api recordId

    //These are the fields that we need to display on the ui
    formFields=[
        {"fieldName":"AccountNumber","label":"Account Number"},
        {"fieldName":"AnnualRevenue","label":"Account Revenue"},
        {"fieldName":"Name","label":"Name"},
        {"fieldName":"Phone","label":"Phone"},
    ]

    //This wire adapter is responsible for the getting the records
    @wire(getRecordUi,{
        recordIds:'$recordId',
        layoutTypes:'Full',
        modes:'Edit'
    })

    //This is the handler for the recordUi adapter
    accountRecordHandler({data,error}){
        if(data){
            //console.log(data);

            //This calls the map method on the formFields array and creates a new array with the same length.

            /* For each object in the original array, this code creates a new object with the same properties 
               as the original object (using the spread operator {...item}) and adds a new value property to it. 
               
             - he value for the new value property is obtained from the data object's records property, which is an array of
              objects that contain data for each record.

             - The this.recordId property is used to get the current record's data. 

             - The item.fieldName property is used to get the value of the fieldName property of the current item,
               which is the name of the field in the record that corresponds to the current form field.
               
               */
            this.formFields=this.formFields.map(item=>{
                return {...item ,value:data.records[this.recordId].fields[item.fieldName].value}
            })
        }
        if(error){
            console.error(error);
        }
    }
}