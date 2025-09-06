import { LightningElement,api } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class NavigateToRelationship extends NavigationMixin(LightningElement) {
    @api recordId
    gotoRelated(){ 
            this[NavigationMixin.Navigate]({ 
                type:'standard__recordRelationshipPage',
                attributes:{ 
                    recordId:this.recordId,
                    objectApiName:'Account',
                    relationshipApiName:'Contacts',
                    actionName:'view'
                }
            })
        }
    }