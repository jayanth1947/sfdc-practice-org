@isTest
public class BookHandlerTest {
    
    @isTest
    static void testCalculateAveragePrice() {
        // Create test Book records with different prices
        List<Book__c> testBooks = new List<Book__c>{
            new Book__c(Name = 'Book A', Price__c = 50),
                new Book__c(Name = 'Book B', Price__c = 75),
                new Book__c(Name = 'Book C', Price__c = 100)
                };
                    insert testBooks;
        
        // Call the method to calculate average price
        Test.startTest();
        BookHandler.calculateAveragePrice();
        Test.stopTest();
        
        // Retrieve the updated Book records (refresh from database)
        List<Book__c> updatedBooks = [SELECT Id FROM Book__c];
        
        // Calculate expected average price
        Decimal expectedAveragePrice = (50 + 75 + 100) / 3;
        
        
    }
}