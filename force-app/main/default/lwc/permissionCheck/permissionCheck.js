import { LightningElement } from 'lwc';
import hasViewAllData from '@salesforce/userPermission/ViewAllData'

export default class PermissionCheck extends LightningElement {
    get visibleDataAvilable(){
         return hasViewAllData
    }
}