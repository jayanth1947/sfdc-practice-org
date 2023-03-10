import { LightningElement, wire } from 'lwc';
//This is the syntax for the apex class importing to this package 
import getAccountList from '@salesforce/apex/accountController.getAccountList'
export default class ApexWire extends LightningElement {
    accountList
    
    //This is used for fetching the data
    @wire(getAccountList)
    accounts

    //This wire is used when we transform the data
    @wire(getAccountList)
    accountsHandler({data, error}){
        if(data){
            // This line is using the map method of the data array to iterate over 
            //each element in the array and return a new array with modified elements.
            this.accountList = data.map(item=>{

                /*This is a ternary operator that sets the value of newType. 
                - It checks if item.Type is equal to 'Customer - Channel'. 
                - If it is, it sets newType to 'Channel'. 
                - If not, it checks if item.Type is equal to 'Customer - Direct'.
                - If it is, it sets newType to 'Direct'. 
                - If it is neither, it sets newType to '-------'. */

                let newType = item.Type === 'Customer - Channel' ? 'Channel':
                item.Type === 'Customer - Direct' ? 'Direct':'-------'

                /*This line returns a new object that includes all the properties of the original item object,
                 as well as the newType property that was just created 
                 ... => It is a spread syntax*/

                return {...item, newType}
            })
        }
        if(error){
            console.error(error)
        }
    }
}