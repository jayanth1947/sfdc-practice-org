import { LightningElement } from 'lwc';
import signintemplate from './signintemplate.html'
import signuptemplate from './signuptemplate.html'
import renderTemplate from './renderMethod.html'
export default class RenderMethod extends LightningElement {
    slectedbtn=''
    render(){
        return this.slectedbtn==='SignUp' ? signuptemplate :
        this.slectedbtn==='SignIn' ? signintemplate :
        renderTemplate
    }
    handleClick(event){
        this.slectedbtn=event.target.label
        
    }
    successHandler(event){
        console.log(` ${event.target.label} successfully`);
    }
}