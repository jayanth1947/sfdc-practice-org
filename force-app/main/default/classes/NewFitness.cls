public class NewFitness {
    public static decimal bmiCalculator(decimal weight,decimal height){
        decimal bmi=weight/(height*height);
        return bmi;
        
        
    }
    public static decimal CalculatePace(decimal distance, decimal minutes){
        decimal hr=minutes/60;
        decimal result=distance/hr;
        return hr;
    }
}