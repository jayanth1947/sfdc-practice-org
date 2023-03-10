import { LightningElement } from 'lwc';

export default class Accessing_elements extends LightningElement {
    users=["Jayanth","COCO","James","Robert"]

    fetchElements(){
        const eleme=this.template.querySelector('h1')
        eleme.style.border="2px solid red" //add the css style to the html
        console.log(eleme.innerText)


        const usersall=this.template.querySelectorAll('.names')
        Array.from(usersall).forEach(item => {
            console.log(item.innerText)
            item.setAttribute("title",item.innerText)

        })
        const childDemo=this.template.querySelector('.child')
        childDemo.innerHTML='<p>Hello boss</p>'
    }
}