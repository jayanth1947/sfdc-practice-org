import { LightningElement, wire } from 'lwc';
import upcomingEvents from '@salesforce/apex/eventListLWCService.upcomingEvents';
import pastEvents from '@salesforce/apex/eventListLWCService.pastEvents';
import { NavigationMixin } from 'lightning/navigation';
export default class EventListTwo extends NavigationMixin(LightningElement) {

    // These variables are used for refering and displaying the result
    upcomingEvents;
    pastEvents;

    /* In Lightning components, the __errors attribute can be accessed using the component's controller or helper method, 
    and the error messages can be displayed to the user using the lightning:messages 
    component or custom error handling logic. */
    __errors;
    isSpinner=false;

    // This is used for the upcoming events
    /* The function is named wiredUpcomingEventData() and takes two parameters: error and data.
     These parameters are automatically provided by the Lightning Data Service based on the outcome 
     of the Apex method call.*/ 
    @wire(upcomingEvents)
    wiredUpcomingEventData({error,data}){
        if(data){
            // console.log('Data',data);
            this.upcomingEvents=data;
        }
        else if(error){
            // console.error('Error:', error);
            this.upcomingEvents=undefined;
            this.__errors=error;
        }
    }

    // This is for past Events
    @wire(pastEvents)
    wiredPastData({ error, data }) {
      if (data) {
        //console.log(' Past Event Data', data);
        this.pastEvents=data;
      } else if (error) {
        //console.error(' Past Error:', error);
        this.pastEvents=undefined;
        this.__errors=error;
      }
    }



    /* alert(selectEventId);
        data-event-id == data-==dataset
        eventId==dataset.EventId
        dataset.event

        navigation imported and get assigned */


        /* This method handles the click event of an EventTile component, 
        prevents the default action associated with the event from occurring, 
        creates a custom event with the eventId, navigates to a named page using 
        the NavigationMixin.Navigate() method, and passes the eventId and source properties in the state object. 
        
        - comm__namedPage is a special page type in Salesforce Community Cloud that allows you to navigate to a named page within the community.
        Named pages are pages in the community that are associated with a specific name. They can be used to create 
        custom pages that are accessible through a specific URL. When you create a named page in Community Cloud, 
        you specify a name for the page and a Lightning component that will be used as the content for the page.
        - You can navigate to a named page in a community using the NavigationMixin.Navigate() method, which takes a 
        navigation target object as its argument. The navigation target object should have a type property of comm__namedPage, 
        and a attributes property that specifies the name of the named page.*/

        handleEventClick=event=>{
            event.preventDefault();
            let selectEventId=event.detail.eventId;       
            let navigationTarget={
                    type: 'comm__namedPage',
                    attributes: {
                        name: 'eventDetail__c' //This refers to the eventDetail Object
                    },
                    state:{
                        eventId:selectEventId,
                        source:'eventListPage'
                    }
                }
                this[NavigationMixin.Navigate](navigationTarget);
            }
    }

