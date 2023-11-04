import { LightningElement } from 'lwc';
import LightningAlert from 'lightning/alert';
export default class LightningAlertDemo extends LightningElement {

    alertHandler(event) {

        const { name } = event.target
        //This is the alert - Create an alert modal within your component that communicates a state that affects the entire system, not just a feature or page.
        LightningAlert.open({
            message: "This is an alert",
            label: `I am ${name} Alert Header`,
            theme: name
        })

        /*  default: white
            shade: gray
            inverse: dark blue
            alt-inverse: darker blue
            success: green
            info: gray-ish blue
            warning: yellow
            error: red
            offline: ​black */
    }
}