import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation'
import {encodeDefaultFieldValues} from 'lightning/pageReferenceUtils'
export default class NavigateToObjectPage extends NavigationMixin(LightningElement) {
    navigateToNewRecord(){ 
        this[NavigationMixin.Navigate]({ 
            type:'standard__objectPage',
            attributes:{ 
                objectApiName:'Contact',
                actionName:'new'
            }
        })
    }
    navigateToNewRecordDefault(){
        const defaultvalues = encodeDefaultFieldValues({
            FirstName:'Jayanth',
            LastName:'Onteru',
            LeadSource:'Other'
        })
        this[NavigationMixin.Navigate]({ 
            type:'standard__objectPage',
            attributes:{ 
                objectApiName:'Contact',
                actionName:'new'
            },
            state:{
                defaultFieldValues:defaultvalues
            }
        })     
    }
    navigateToListView(){
        this[NavigationMixin.Navigate]({ 
            type:'standard__objectPage',
            attributes:{ 
                objectApiName:'Contact',
                actionName:'list'
            },
            state:{
                filterName:'Recent'
            }
        })
    }
    navigateToFile(){
        this[NavigationMixin.Navigate]({ 
            type:'standard__objectPage',
            attributes:{ 
                objectApiName:'ContentDocument',
                actionName:'home'
            }
        })
    }
}