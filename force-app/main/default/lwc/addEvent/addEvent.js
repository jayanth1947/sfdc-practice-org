import { LightningElement, track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import EVT_OBJECT from '@salesforce/schema/Event__c';
import Name_F from '@salesforce/schema/Event__c.Name__c';
import Event_Organizer__c from '@salesforce/schema/Event__c.Event_Organizer__c';
import Start_DateTime__c from '@salesforce/schema/Event__c.Start_DateTime__c';
import End_Date_Time__c from '@salesforce/schema/Event__c.End_Date_Time__c';
import Max_Seats__c from '@salesforce/schema/Event__c.Max_Seats__c';
import Location__c from '@salesforce/schema/Event__c.Location__c';
import Event_Detail__c from '@salesforce/schema/Event__c.Event_Detail__c';

import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

//Here we are creating the object for the fields we need to display

    /*uiRecordAPi
    Step-1 - Import createRecord From the library - import {createRecord} from 'lightning/uiRecordApi';
    Step-2 - Import the Object which you wanted to create - import ACCOUNT_OBJECT from '@salesforce/schema/Account';
    Step-3 - Import all fields one by one which we wanted to use for the create record - import NAME_FIELD from '@salesforce/schema/Account.Name';
    - After we need all the method for createRecord button where createRecord accepts single record
    parameter is recordInput- it contains 2 things one is obj_api_name and second is which we are inserting
    - create method returns promise

    -For NavigationAPI
    Step-1: Import navigation api- import {NavigationMixin} from 'lightning/navigation';
    Step-2: Apply the navigation api to component bas e class to access the API - NavigationMixin(LightningElement)

    -Show SuccesssMessage

    Step-1 Import the method from librart - import {ShowToastEvent} from 'lightning/platformShowToastEvent'

    Then execute the event

     */


export default class AddEvent extends NavigationMixin(LightningElement) {

    @track eventRecord = {
        Name: '',
        Event_Organizer__c: '',
        Start_DateTime__c: null,
        End_Date_Time__c: null,
        Max_Seats__c: null,
        Location__c: '',
        Event_Detail__c: ''
    }

    @track errors;

    handleChange(event) {
        let value = event.target.value;
        let name = event.target.name;
        this.eventRecord[name] = value;
        // MaxFIT Campaign
        // Name
        // this.eventRecord[Name] = 'MaxFIT Campaign'
    }
    /*
        Event__c newEvent = new event__c();
        newEvent.Name = '';
        newEvent.Location__c = '098203u84';
    */

    handleLookup(event) {
        let selectedRecId = event.detail.selectedRecordId;
        let parentField = event.detail.parentfield;
        this.eventRecord[parentField] = selectedRecId;
        // selectedRecId = aiwue7836734834
        // Location__c
        // this.eventRecord[Location__c] = selectedRecId;
    }

    handleClick() {
        const fields = {};
        fields[Name_F.fieldApiName] = this.eventRecord.Name;
        fields[Event_Organizer__c.fieldApiName] = this.eventRecord.Event_Organizer__c;
        fields[Start_DateTime__c.fieldApiName] = this.eventRecord.Start_DateTime__c;
        fields[End_Date_Time__c.fieldApiName] = this.eventRecord.End_Date_Time__c;
        fields[Max_Seats__c.fieldApiName] = this.eventRecord.Max_Seats__c;
        fields[Location__c.fieldApiName] = this.eventRecord.Location__c;
        fields[Event_Detail__c.fieldApiName] = this.eventRecord.Event_Detail__c;

        const eventRecord = { apiName: EVT_OBJECT.objectApiName, fields };

        // This will handle the save button 
        createRecord(eventRecord)
            .then((eventRec) => {
                //This will display success message
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Record Saved',
                    message: 'Event Draft is Ready',
                    variant: 'success'
                }));
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        actionName: "view",
                        recordId: eventRec.id
                    }
                });
            }).catch((err) => {
                this.errors = JSON.stringify(err);
                // This will handle error message
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Error Occured',
                    message: this.errors,
                    variant: 'error'
                }));
            });
    }

    // This will handle the cancel button
    handleCancel() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                actionName: "home",
                objectApiName: "Event__c"
            }
        });
    }
}