import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class NavigateToRelationship extends NavigationMixin(LightningElement) {
    gotoRelated(){ 
            this[NavigationMixin.Navigate]({ 
                type:'standard__recordRelationshipPage',
                attributes:{ 
                    recordId:'0015g00000TEKsHAAX',
                    objectApiName:'Account',
                    relationshipApiName:'Contacts',
                    actionName:'view'
                }
            })
        }
    }