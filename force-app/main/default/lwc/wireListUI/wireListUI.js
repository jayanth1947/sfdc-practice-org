import { getListUi } from 'lightning/uiListApi';
import { LightningElement,wire } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';

export default class WireListUI extends LightningElement {
    //This line initializes an empty array contacts that will be used to store the retrieved contacts.

    //pageToken=null, nextPageToken=null, previousPageToken=null: These lines initialize the pageToken, 
    //nextPageToken, and previousPageToken variables to null.
    contacts=[]
    pageToken=null
    nextPageToken=null
    previousPageToken=null

    /*@wire decorator to wire the getListUi method with the specified parameters to the listViewHandler method. 
    The getListUi method retrieves records from the AllContacts list view of the Contact object, with a page size of 10, 
    sorting by the Name field, and using the pageToken variable for pagination. */
    @wire(getListUi,{
        objectApiName:CONTACT_OBJECT,
        listViewApiName:'AllContacts',
        pageSize:10, //This is the pageSize
        sortBy:NAME_FIELD, // sorting by the Name
        pageToken:'$pageToken'
    })

    listViewHandler({data,error}){
        if(data){
            //console.log(data);
            //This line assigns the retrieved records to the contacts array defined earlier in the component.
            this.contacts=data.records.records
            //This line assigns the next page token to the nextPageToken variable defined earlier in the component.
            this.nextPageToken=data.records.nextPageToken
            // This line assigns the previous page token to the previousPageToken variable defined earlier in the component.
            this.previousPageToken=data.records.previousPageToken
        }
        if(error){
            console.error(error);
        }
    }

    handlePrevious(){
        this.pageToken=this.previousPageToken
    }

    handleNext(){
        this.pageToken=this.nextPageToken
    }
}