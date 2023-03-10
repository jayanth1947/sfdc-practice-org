public class Company {
     public class Details{
    public String name;
    public String email;
    public String role;
    public long phone;
   
    public void GetCompanyDetails(String name,String email,String role,long phone){
        this.name=name;
        this.email=email;
        this.role=role;
        this.phone=phone;
    }
    public void DisplayCompanyDetails(){
        List<Details> dispaly=new List<Details>();
    }
    } 

}