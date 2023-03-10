import { api, LightningElement, track } from 'lwc';
import upcomingEvents from '@salesforce/apex/attendeeEventController.upcomingEvents';
import pastEvents from '@salesforce/apex/attendeeEventController.pastEvents';

// For DataTables we use this
const columns = [
    { 
        label: 'Event Name', 
        fieldName: 'detailPage',
        type:'url',
        wrapText:'true',
        typeAttributes:{
            label:{
                fieldName:"Name"
            }} 
    },

    { 
        label: 'Event Date',
        fieldName: 'StartDate',
        type:'dateTime'
    },

    { 
        label: 'Name', 
        fieldName: 'EventOrg'
    },

    { 
        label: 'Location', 
        fieldName: 'Location'
    },
 
];

export default class AttendeeEvent extends LightningElement {
    // Variables intialization
    @api recordId;
    @track events;
    @track past_Events;
    columnsList=columns;
    errors;

    /*
    - This link is used for connectedCallBack()
    https://salesforcediaries.com/2019/12/13/connectedcallback-in-lightning-web-component/
    */

    connectedCallback(){
        this.upcomingEventsFromAPex();
        this.pastEventsFromAPex();
    }

    // Used for upcomingEvents
    upcomingEventsFromAPex(){
        upcomingEvents({
            eventId:this.recordId
        })
        //Return promise 
        .then((result) => {
            result.forEach(record => {
                //For getting the columns data we use this
                record.Name=record.Event__r.Name__c;
                record.detailPage="https://"+window.location.host+'/'+record.Event__c;
                record.EventOrg=record.Event__r.Event_Organizer__r.Name;
                record.StartDate=record.Event__r.Start_DateTime__c;
                //If the location is present it will display or else it will hide
                if(record.Event__r.Location__c){
                    record.Location=record.Event__r.Location__r.Name;
                }
                else{
                    record.Location='This is virtual location';
                }
            });

            this.events=result;
            this.errors=undefined;

            //window.console.log('result',result);
            //This is for errors to catch
        }).catch((error) => {
            window.console.log('error',error);
            this.events=undefined;
            this.errors=JSON.stringify(error);
        });
    }


    // This is for pastEvents
    pastEventsFromAPex(){
        pastEvents({
            eventId:this.recordId
        })

        .then((result) => {
            result.forEach(record => {
                record.Name=record.Event__r.Name__c;
                record.detailPage="https://"+window.location.host+'/'+record.Event__c;
                record.EventOrg=record.Event__r.Event_Organizer__r.Name;
                record.StartDate=record.Event__r.Start_DateTime__c;
                if(record.Event__r.Location__c){
                    record.Location=record.Event__r.Location__r.Name;
                }
                else{
                    record.Location='This is virtual location';
                }
            });

            this.past_Events=result;
            this.errors=undefined;
            // window.console.log('result',result);

        }).catch((error) => {
            // window.console.log('error',error);
            this.past_Events=undefined;
            this.errors=JSON.stringify(error);
        });
    }
}