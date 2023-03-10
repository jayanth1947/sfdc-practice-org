import { LightningElement ,wire} from 'lwc';
import getfooterContent from '@salesforce/apex/footercmpLWCService.getfooterContent';
export default class FooterComponent extends LightningElement {


    __footerContent;
    __errors;
@wire(getfooterContent)
wiredData({ error, data }) {
  if (data) {
    console.log('Footer COntent', data);
    this.__errors=undefined;
    this.__footerContent=data;
  } else if (error) {
    console.error('Error:', error);
    this.__errors=error;
    this.__footerContent=undefined;
  }
}
}