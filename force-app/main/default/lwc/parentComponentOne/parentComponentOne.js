import { LightningElement } from 'lwc';

export default class ParentComponentOne extends LightningElement {
  messageToChild="Hello!";

  handleChange(event){
    this.messageToChild = event.target.value;
  }
}