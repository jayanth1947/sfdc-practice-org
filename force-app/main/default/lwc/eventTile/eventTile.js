import { api, LightningElement } from 'lwc';

export default class EventTile extends LightningElement {
    @api event;

    /* - The handleClick() method is defined on the EventTile class. 
    This method is called when the user clicks on the component.
     It prevents the default click behavior, creates a new custom event called select, 
     and dispatches this event to the parent component. 

     - The CustomEvent() constructor is used to create a new custom event called select.
      This event has a detail object that contains an eventId property.
       The value of the eventId property is set to the Id property of the event property 
       of the EventTile component.

     - preventDefault() is a method of the Event interface in JavaScript. It is used to prevent 
     the default action of an event from occurring. In web development, many HTML elements have
      default actions associated with them. For example, clicking on a link navigates to the URL
       specified in the href attribute of the link, and clicking on a submit button submits a form to the server.

     - The dispatchEvent() method is called on the EventTile component to dispatch the select event
      to the parent component. The selectedEvent object is passed as an argument to the dispatchEvent() method.
       */
    handleClick(event){
        event.preventDefault();
        const selectedEvent = new CustomEvent('select', {
            detail: { 
                eventId:this.event.Id
             }
        });
        this.dispatchEvent(selectedEvent);
    }
    
}