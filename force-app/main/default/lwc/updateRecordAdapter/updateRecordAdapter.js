import { LightningElement, wire } from 'lwc';
import {getListUi} from 'lightning/uiListApi'
import { updateRecord  } from 'lightning/uiRecordApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact'
// Define columns for the datatable
/*defines an array of objects that represent the columns of the datatable. 
- Each object has a label property that specifies the column header and a fieldName property that
  specifies the API name of the field to display in the column. 
- The Phone and Email columns are also marked as editable. */
const COLS =[
    {label:'Id', fieldName:'Id'},
    {label:'Name', fieldName:'Name'},
    {label:'Title', fieldName:'Title'},
    {label:'Phone', fieldName:'Phone', editable:true},
    {label:'Email', fieldName:'Email', type:'email', editable:true}
]
export default class UpdateRecordDemo extends LightningElement {

   // Define properties for the component
   contacts = []; // Holds the list of contacts returned from the API
   columns = COLS; // Holds the columns for the datatable
   draftValues = []; // Holds the draft values from the datatable

   // Define a wired function to get the list view of all contacts
    @wire(getListUi, {
        objectApiName:CONTACT_OBJECT,
        listViewApiName:'AllContacts'
    })
    
    listViewHandler({data, error}){
        if(data){
            //console.log(data)

            // If the data is returned successfully, map it to the contacts array
            this.contacts = data.records.records.map(item=>{
                return {
                    "Id": this.getValue(item, 'Id'),
                    "Name": this.getValue(item, 'Name'),
                    "Title": this.getValue(item, 'Title'),
                    "Phone": this.getValue(item, 'Phone'),
                    "Email": this.getValue(item, 'Email') //this.data.fields[0].value
                }
            })
        }
        if(error){
            console.error(error)
        }
    }


     // Define a function to get the value of a field from the data object
    getValue(data, field){
        return data.fields[field].value
    }


    // Define a function to handle saving the draft values from the datatable
    handleSave(event){
        //console.log(JSON.stringify(event.detail.draftValues))
        const recordInputs=event.detail.draftValues.map(draft=>{
            const fields = {...draft}; // Create a new object with the same properties as the draft value
            return { fields: fields }; // Return an object with the updated fields
            
        })

        // Use Promise.all() to update all the records at once
        const promises = recordInputs.map(recordInput=>updateRecord(recordInput))
        Promise.all(promises).then(()=>{
            //console.log('Contact updated Successfully')

            // If all the records were updated successfully, clear the draft values array
            this.draftValues=[]
        }).catch(error=>{
            console.error("Error updating the record", error)
        })
        
    }
}