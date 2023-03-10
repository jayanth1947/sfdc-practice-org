import { LightningElement } from 'lwc';
import {loadStyle} from 'lightning/platformResourceLoader'
import fontawesome from '@salesforce/resourceUrl/fontawesome'
export default class MemoryGame extends LightningElement {
    isLoaded=false
    cards=[
        {id:1,listClass:'card',type:'Gem',icon:'fa-light fa-gem'},
        {id:2,listClass:'card',type:'coin',icon:"fa-thin fa-coin"},
        {id:3,listClass:'card',type:'paper-plane',icon:'fa-thin fa-paper-plane'},
        {id:4,listClass:'card',type:'memo',icon:'fa-thin fa-memo'},
        {id:5,listClass:'card',type:'pin',icon:'fa-thin fa-location-pin'},
        {id:6,listClass:'card',type:'hand',icon:'fa-thin fa-hand'},
        {id:7,listClass:'card',type:'file',icon:'"fa-light fa-file'},
        {id:8,listClass:'card',type:'virus',icon:'fa-light fa-virus'},
        {id:9,listClass:'card',type:'memo',icon:'fa-thin fa-memo'},
        {id:10,listClass:'card',type:'coin',icon:"fa-thin fa-coin"},
        {id:11,listClass:'card',type:'pin',icon:'fa-thin fa-location-pin'},
        {id:12,listClass:'card',type:'virus',icon:'fa-light fa-virus'},
        {id:13,listClass:'card',type:'Gem',icon:'fa-light fa-gem'},
        {id:14,listClass:'card',type:'paper-plane',icon:'fa-thin fa-paper-plane'},
        {id:15,listClass:'card',type:'file',icon:'"fa-light fa-file'},
        {id:16,listClass:'card',type:'hand',icon:'fa-thin fa-hand'},

    ]









    renderedCallback(){
    if(this.isLoaded){
        return
    }
    else{
            loadStyle(this,fontawesome+'/fontawesome/css/font-awesome.min.css').then(()=>{
                console.log('Loaded Sucecessfully');
            }).catch(error=>{
                console.error(error);
            })
            this.isLoaded=true
        }

    }
    
}