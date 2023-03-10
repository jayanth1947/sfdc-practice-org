import { api, LightningElement, track, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import fetchEventDetails from '@salesforce/apex/eventDetailLWCServiceTwo.fetchEventDetails';
import fetchSpeakerDetails from '@salesforce/apex/eventDetailLWCServiceTwo.fetchSpeakerDetails';
import fetchUserName from '@salesforce/apex/userUtility.fetchUserName';
import { NavigationMixin } from 'lightning/navigation';
export default class EventDetailCmpTwo extends NavigationMixin(LightningElement) {

        /* CurrentPageReference- Get a reference to the current page in Salesforce. Page URL formats can change in 
        future releases. To future proof your apps, use page references instead of URLs. 
        Use the page reference to create a deep link to the page.
        The key-value pairs of the PageReference state property are serialized to URL query
        parameters. To create a deep link that describes the page and that a user can bookmark,
        update the state property*/

        // Variable to get the url parameters 
    @api eventId;
    @api source;
    __currentPageReference;
    __showRsvpButon=false;
    /* The __currentPageReference property is a private property of the component that will hold the current
     page reference object once it is retrieved.*/
  

    // variable to show the spinner
    isSpinner=false;

    // Variable to store the event details
    __speakers;
    __eventDetails;
    __errors;

    // For location Map
    @track __mapMarkers=[];

    //for contact us button
    __showModal=false;
    __showContactModal=false;


    /*The eventId and source variables are then set based on the state of the pageReference, 
    and the fetchSpeakerDetailsJS and fetchEventDetailsJS methods are called to fetch the relevant
     data based on the eventId and source. */
    @wire(CurrentPageReference)
    getCurrentPageReference(pageReference){
        this.__currentPageReference=pageReference;
        //window.console.log('PageRefernce',this.__currentPageReference);
        this.eventId=this.__currentPageReference.state.eventId;
        this.source=this.__currentPageReference.state.source;
        this.fetchSpeakerDetailsJS();
        this.fetchEventDetailsJS();

    }

    //for the guest user name
    @wire(fetchUserName)
    wiredGuestData({ error, data }) {
      if (data) {
        console.log('User Name \nn',data);
        if(data.includes('Site Guest User')){
            this.__showRsvpButon=false;
        }
        else{
            this.__showRsvpButon=true;
        }
      } else if (error) {
        console.error('Error:', error);
      }
    }

    // used for fetching the eventDetails
    fetchEventDetailsJS(){
        this.isSpinner=true;
        fetchEventDetails({
            //eventID is fetched from the class
            recordId:this.eventId
        })
        .then(result=>{
            //console.log('Result',result);
            this.__eventDetails=result;

            // If theLocation is present display the location
            if(this.__eventDetails.Location__c){
                this.__mapMarkers.push({
                    
                        location: {
                            Street: this.__eventDetails.Location__r.Street__c,
                            City:  this.__eventDetails.Location__r.City__c,
                            State:this. __eventDetails.Location__r.State__c,
                            Country: this. __eventDetails.Location__r.Country__c,
                            PostalCode:  this.__eventDetails.Location__r.Postal_Code__c
                        },
                        title: this. __eventDetails.Location__r.Name__c
                    
                });
            }
        })

        .catch(error=>{
            //console.error('Error',error);
            this.__errors=error;
        })
        .finally(()=>{
            this.isSpinner=false;
        })

    }


    // Used for fetching the details of the speakers
    fetchSpeakerDetailsJS(){
        this.isSpinner=true;
        fetchSpeakerDetails({
            eventId:this.eventId
        })
        .then(result=>{
            //console.log('Result',result);
            this.__speakers=result;
        })
        .catch(error=>{
            //console.error('Error',error);
            
        })
        .finally(()=>{
            this.isSpinner=false;
        })
    }



    // handleRSVP(){
    //     console.log('OUTPUT : ',this.eventId);
    // }



    handleContactusCancel(){
        this.__showContactModal=false;
    }

    handleContactusSucess(event){
        event.preventDefault();
        this.__showContactModal=false;

    }

    //when the user clicks on the button the contact us model will be shown
    handleContactus(){
        this.__showContactModal=true;
    }




    handleLoginRedirect(){
        let navigationTarget={
            type: 'comm__namedPage',
            attributes: {
                name: "Login" //This refers to the eventDetail Object
            }
        }
        
        this[NavigationMixin.Navigate](navigationTarget);
    }
}


