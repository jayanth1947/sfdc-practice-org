import { api, LightningElement } from 'lwc';

export default class ChildComponentOne extends LightningElement {
    @api
  messageFromParent = ""; //Property
}