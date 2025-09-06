import { LightningElement,track,wire } from 'lwc';

import upcomingEvents from '@salesforce/apex/eventListController.upcomingEvents';

//colums to display inside the datatable
const columns = [
    {
      label: "View",
      fieldName: "detailsPage",
      type: "url",
      wrapText: "true",
      typeAttributes: {
        label: {
          fieldName: "Name__c"
        },
        target: "_self"
      }
    },
    {
      label: "Name",
      fieldName: "Name__c",
      wrapText: "true",
      cellAttributes: {
        iconName: "standard:event",
        iconPosition: "left"
      }
    },
    {
      label: "Event Organizer",
      fieldName: "EVNT_ORG",
      wrapText: "true",
      cellAttributes: {
        iconName: "standard:user",
        iconPosition: "left"
      }
    },
    {
      label: "Location",
      fieldName: "Location",
      wrapText: "true",
      type: "text",
      cellAttributes: {
        iconName: "utility:location",
        iconPosition: "left"
      }
    }
  ];
  
  export default class EventList extends LightningElement {

    //Intializers
    columnsList = columns;
    error;
    startdate;
    @track result;
    @track recordsToDisplay;
  
    // this is used whenever wire decorator is included and it only a readonly
    connectedCallback() {
      this.upcomingEventsFromApex();
    }
  
    //For EventName Search
    upcomingEventsFromApex() {
      upcomingEvents()
        .then((data) => {
          window.console.log(" event list ", data);
          //foreach loop for the necessary fields data to be fetch
          data.forEach((record) => {

            //Dynamic url -- The location.host property returns the host (IP adress or domain) and port of a URL.
            record.detailsPage ="https://" + window.location.host + "/" + record.Id;
            record.EVNT_ORG = record.Event_Organizer__r.Name;

            //If the location is present
            if (record.Location__c) {
              record.Location = record.Location__r.Name;
            } else {
              record.Location = "This is Virtual Event";
            }
          });

          //This will display the outpuy
          this.result = data;
          this.recordsToDisplay = data;
          this.error = undefined;
        })

        //errors will be catched here
        .catch((err) => {
          window.console.log(err);
          this.error = JSON.stringify(err);
          this.result = undefined;
        });
    }


    handleSearch(event){
        let keyword=event.detail.value;

        //This filter will filter the array and will produce the new array
        //this filter accepts three parameters item,index,arrayObject
        let filteredEvents  = this.result.filter((record,index,arrayObject )=> {
            /*This 'includes' method will returns true if a string contains a
             specified string. Otherwise it returns false*/
            return record.Name__c.toLowerCase().includes(keyword.toLowerCase());
        });

        //when the length is >2 it will display the result on the screen
        if(keyword &&keyword.length>=2){
            this.recordsToDisplay=filteredEvents;
        }
        else{
            this.recordsToDisplay=this.result;
        }
        
    }


    //To Date-Time Search
    handleStartDate(event) {
        let valuedatetime = event.target.value;
    
        let filteredEvents = this.result.filter((record, index, arrayobject) => {
          return record.Start_DateTime__c >= valuedatetime;
        });
        this.recordsToDisplay = filteredEvents;
      }

    //   To handle Location Search
      handleLocationSearch(event) {
        let keyword = event.detail.value;
    
        let filteredEvents = this.result.filter((record, index, arrayobject) => {

            //toLowerCase-The output will be searched in lower case also
          return record.Location.toLowerCase().includes(keyword.toLowerCase());
        });

        if (keyword && keyword.length >= 2) {
          this.recordsToDisplay = filteredEvents;
        } else {
          this.recordsToDisplay = this.result;
        }
      }
  
}