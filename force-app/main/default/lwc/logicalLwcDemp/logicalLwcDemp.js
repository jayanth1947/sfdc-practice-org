import { LightningElement, track,api, wire } from 'lwc';

import mapDemo from '@salesforce/apex/UtilityClass.mapDemo';

export default class LogicalLwcDemp extends LightningElement {
 @api name='jayanth';
@api message='Hey Jayanth';
@track contacts=[
    {
        Id: '144561',
        Name:'Jayanth onteru Kala'
    },
    {
        Id: '144562',
        Name:'Jayanth onteru Kalaki'
    },
    {
        Id: '144563',
        Name:'Jayanth onteru Kalaki Raj'
    }
]
@wire(mapDemo) records;

handleClick(){
    if (this.message==='groom'){
        this.message='kalyan';
    }
}

}