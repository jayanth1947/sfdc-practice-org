import { LightningElement } from 'lwc';
import DESCRIPTIONE from '@salesforce/label/c.descriptionOne'
import DESCRIPTITWO from '@salesforce/label/c.descriptionTwo'
export default class CustomLabel extends LightningElement {
    descriptionone=DESCRIPTIONE
    descriptiontwo=DESCRIPTITWO
    LABELS={
        descriptionone:DESCRIPTIONE,
        descriptiontwo:DESCRIPTITWO
    
    }
}