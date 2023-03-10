import { LightningElement, wire } from 'lwc';
import {getRecord} from 'lightning/uiRecordApi' 
import Id from '@salesforce/user/Id'
import NAME_FIELD from '@salesforce/schema/User.Name'
import EMAIL_FIELD from '@salesforce/schema/User.Email'
const fields = [NAME_FIELD, EMAIL_FIELD]
export default class WireUserDetails extends LightningElement {
    userId = Id

    userDetail
     /* wire decorator to fetch user detail information using the getRecord method
        the recordId is dynamically bound to the userId property
        the fields are declared as a constant array */
    @wire(getRecord, {recordId:'$userId', fields})

    // function to handle user detail data returned from the wire service
    userDetailHandler({data, error}){
        // if data is returned successfully, store it in userDetail
        if(data){
            this.userDetail = data.fields
        }
         // if there is an error, log it to the console
        if(error){

            console.error(error)
        }
    }

     /* another wire decorator to fetch user detail information using the getRecord method
        the recordId is dynamically bound to the userId property
        the fields are declared as a constant array */
    @wire(getRecord, {recordId:'$userId', fields})
    userDetailProperty
}