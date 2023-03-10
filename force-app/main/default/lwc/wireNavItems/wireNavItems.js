import { LightningElement, wire } from 'lwc';
import {getNavItems} from 'lightning/uiAppsApi'
export default class WireNavItems extends LightningElement {
    result

    //This will show us the names of navItems
    @wire(getNavItems,{
        navItemNames:['standard-Account'],
        pageSize:30
    })

    //This is used for getting the data and any errors are available
    navItemsHandler({data,error}){
        if(data){
            //console.log(data)
            this.result=data.navItems[0]
        }
        if(error){
            console.error(error)
        }
    }
}