public class ProductData{
    public ProductData(String prod,double price, Integer quantity){
        System.debug('Product Name' + prod);
        System.debug('Price'+ price);
        System.debug('Quantity'+ quantity);
    }
    ProductData pt=new ProductData('Biscuit',10,2);
}