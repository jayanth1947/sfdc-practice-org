import { LightningElement,api, track } from 'lwc';

import getSpeaker from '@salesforce/apex/eventDetailController.getSpeaker';
import getLocation from '@salesforce/apex/eventDetailController.getLocation';
import getEventAttendee from '@salesforce/apex/eventDetailController.getEventAttendee';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';


//This will display in the column format
const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'CompanyName', fieldName: 'CompanyName' },
    
];


const columnAtt = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Location', fieldName: 'Location' },
    { label: 'CompanyName', fieldName: 'CompanyName' },
    
];

export default class EventDetailcmp extends NavigationMixin(LightningElement) {
    //variables for id and the list
    @api recordId;
    @track speakerList;
    @api eventRec;
    @track attendeesList;

    errors;
    columnsList=columns;
    columnAttendee=columnAtt;

    // This will handle when the tab is on active and will display speaker details
    handleSpeakerActive(){
        getSpeaker({
            eventId:this.recordId
        })

        // It will give two elements one is result and other is error
        .then((result) => {
            result.forEach(speaker => {
                //It will replace the existing fields
                speaker.Name=speaker.Speaker__r.Name,
                speaker.Email=speaker.Speaker__r.Email__c,
                speaker.Phone=speaker.Speaker__r.Phone__c,
                speaker.Picture__c=speaker.Speaker__r.Picture__c,
                speaker.About_Me__c=speaker.Speaker__r.About_Me__c,
                speaker.CompanyName=speaker.Speaker__r.Company__c
                
            });

            //Result is a speakers list
            this.speakerList=result;
            this.errors=undefined;
            
        }).catch((err) => {

            // Errors are displayed
            this.errors=err;
            this.speakerList=undefined;
        });

    }


    // This will handle the location details
    handleLocation(){
        getLocation({
            eventId:this.recordId
        })
        .then((result) => {
            //In the event record if the location is there display it or null
           if(result.Location__c){
            this.eventRec=result;
           }
           
           else{
            this.errors=undefined;
           }
        })
            
        .catch((err) => {

            // Errors are displayed
            this.errors=err;
            this.speakerList=undefined;
        });
    }


    // This will display the event Attendee details
    handleEventAttendee(){
        getEventAttendee({
            eventId:this.recordId
        })
        .then((result) => {
            //In the event record if the location is there display it or null
           
            result.forEach(att=>{
                att.Name=att.Attendee__r.Name;
                att.Email=att.Attendee__r.Email__c;
                att.CompanyName=att.Attendee__r.Company_Name__c;
                if(att.Attendee__r.Location__c){
                    att.Location=att.Attendee__r.Location__r.Name;
                }
                else{
                    att.Location='Prefred Not to Say'
                }
            });
           this.attendeesList=result;
            this.errors=undefined;
    }).catch((err) => {
            // Errors are displayed
            this.errors=err;
            this.attendeesList=undefined;
        });

    }

    createSpeaker(){
        const defaultValues = encodeDefaultFieldValues({
            Event__c: this.recordId
            });
         this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
            objectApiName: 'EventSpeakers__c',
            actionName: 'new'
            },
            state: {
            defaultFieldValues: defaultValues
            }
            });
    }


    createAttendees(){
        const defaultValues = encodeDefaultFieldValues({
            Event__c: this.recordId
            });
         this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
            objectApiName: 'Event_Attendee__c',
            actionName: 'new'
            },
            state: {
            defaultFieldValues: defaultValues
            }
            });
    }
}