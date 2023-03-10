import { LightningElement } from 'lwc';
// The URL for the Google Books API
const BOOK_URL = 'https://www.googleapis.com/books/v1/volumes?q='
export default class BookApp extends LightningElement {
    // The default search query
    query='Man'
    // An array to store the book data returned by the API
    books;

    // A timer used to delay the search request while the user is typing
    timer;

    // This method is called when the component is added to the DOM
    connectedCallback(){
        // Fetch the book data using the default search query
        this.fetchBookData()
    }

    // This method sends a request to the Google Books API to retrieve book data
    fetchBookData(){
        fetch(BOOK_URL+this.query)
        .then(response=>response.json())
        .then(data=>{
            console.log(data)
             // Store the book data in the 'books' property
            this.books = data
        })
        .catch(error=>console.error(error))
    }


    // This method is called when the user types a new search query
    fetchBooksHandler(event){
        // Update the search query based on the user input
        this.query = event.target.value

        // Clear the timer so that we don't send multiple requests
        // if the user is typing quickly
        window.clearTimeout(this.timer)

         // Set a new timer to delay the search request by 1 second
        this.timer= setTimeout(()=>{
            // Call the fetchBookData method to send the search request
            this.fetchBookData()
        }, 1000)
    }
}