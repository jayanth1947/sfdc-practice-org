import { LightningElement } from 'lwc';

export default class Quizz_game extends LightningElement {
    selected={}
    correctAnswers=0
    isSubmitted=false
    // Questions 
    myQuestions=[
        {
            id:"q1",
            question:"Who is our present prime Minister of India ?",
            options:{
                a:"Abdul kalam",
                b:"Narendra Modi",
                c:"Bharat sigh",
                d:"Rama sethu"
            },
            correctAnswer:"b"
        },
        {
            id:"q2",
            question:"Who is our present chief Minister of AP ?",
            options:{
                a:"Jagan Mohan Reddy",
                b:"Chandra Babu Naidu",
                c:"Chandra Kiran Reddy",
                d:"Bala Sundhar"
            },
            correctAnswer:"a"
        },
        {
            id:"q3",
            question:"Which movie do you like in this weekend ?",
            options:{
                a:"Karthikeya-2",
                b:"Bimbisara",
                c:"Sita Ramam",
                d:"Marchala niyojaka vargam"
            },
            correctAnswer:"b"
        }
    ]
    //Disabling of the button
    get allSelected(){
        /* This will tell you a
        selected values is equal to the
        no of questions */
        return !(Object.keys(this.selected).length === this.myQuestions.length)
    }
    // Color for correct and wrong answer
    get isscoredFull(){
        return `slds-text-heading_large ${this.myQuestions.length === this.correctAnswers ?
        'slds-text-color_success' :'slds-text-color_error'}`
    }
    //Store the result of the selected value.
    changeOption(event){
        const {name,value}=event.target
        /*Here the name refers to a question and value
        represents the option that you have selected.
        When a user change the option the value is
        automatically updated and stored in a selected .
        */
        this.selected={...this.selected,[name]:value}


    }
    // Submit button Action
    submitHandler(event){
        event.preventDefault()
        // filter always return the array
        let correct=this.myQuestions.filter(item=>this.selected[item.id]===item.correctAnswer)
        this.correctAnswers=correct.length
        this.isSubmitted=true
    }
    // Reset Button Action
    resetHandler(){
        this.selected={}
        this.correctAnswers=0
        this.isSubmitted=false

    }
}