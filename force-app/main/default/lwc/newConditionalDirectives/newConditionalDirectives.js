import { LightningElement } from 'lwc';
export default class NewConditionalDirectives extends LightningElement {

        showText=false
        get getLabel(){
            return this.showText ? 'Hide Text' :'Show Text'
        }

        showTextHandler(){
            this.showText= !this.showText
        }

        country='Canada' //default value

        get isCountryIndia(){
            console.log('IsCountry Getter Caller');
            return this.country ==="India"
        }

        changeHandler(event){
            this.country=event.target.value
        }

        get isCountryCanada(){
            console.log('IsCountryCanada  Getter Caller');
            return this.country ==="Canada"
        }
}