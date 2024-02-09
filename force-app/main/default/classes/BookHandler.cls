public class BookHandler {
    public static void calculateAveragePrice(){
        List<Book__c> bookList=[SELECT Id,Price__c FROM Book__c];
        Decimal totalSum = 0;
        Integer bookCount = 0;
        for (Book__c book : bookList) {
            totalSum += book.Price__c;
            System.debug('Total Sum : '+totalSum);
            bookCount++;
            System.debug('Book Count: '+bookCount);
        }
        Decimal averagePrice;
        if (bookCount > 0) {
            averagePrice = totalSum / bookCount;
        } else {
            averagePrice = 0;
        }
        System.debug('Average Price : '+averagePrice);
    }
}