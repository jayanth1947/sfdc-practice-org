import { api, LightningElement } from 'lwc';

export default class SetterChild extends LightningElement {
    userDetails
    @api 
    get detail(){
        return this.userDetails
    }
    set detail(data){
        /* Fisrt we need to create a shallow copy
        of the data and then the data will be modified
        --Spread Operator is used for copy of the data*/
        let newId=data.id*2
        this.userDetails={...data,id:newId,"location":"Kadapa"}
    }
}