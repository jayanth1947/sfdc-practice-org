import { LightningElement,api } from 'lwc';

export default class P2cParentComponent extends LightningElement {
    @api carousalData=
        [
            {
                src :"https://www.lightningdesignsystem.com/assets/images/carousel/carousel-01.jpg",
                header:"First Card",
                description : "First card description."
            },
            {
                src :"https://www.lightningdesignsystem.com/assets/images/carousel/carousel-02.jpg",
                header:"Second Card",
                description : "Second card description."
            },
            {
                src :"https://www.lightningdesignsystem.com/assets/images/carousel/carousel-03.jpg",
                header:"Third Card",
                description : "Third card description."
            }
        ]
        percentageValue=10
        changeHandler(event){
            this.percentageValue=event.target.value
        }
        handleClick(){
            this.template.querySelector('c-p2c-slider-component').resetSlider()
        }
    
}