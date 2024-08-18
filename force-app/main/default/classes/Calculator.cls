public class calculator {
    public static Decimal addnumbers(Decimal a,Decimal b){
        if(a==null || b==null){
            return 0;
        }
        Decimal res=a+b;
        System.debug(res);
        return res;
    }
    public static Decimal subtractnumbers(Decimal a,Decimal b){
        if(a==null || b==null){
            return 0;
        }
        Decimal res=a-b;
        System.debug(res);
        return res;
    }
    public static Decimal multiplynumbers(Decimal a,Decimal b){
        if(a==null || b==null){
            return 0;
        }
        Decimal res=a*b;
        System.debug(res);
        return res;
    }
    public static Decimal dividenumbers(Decimal a,Decimal b){
        if(a==null || b==null){
            return 0;
        }
        Decimal res=a/b;
        System.debug(res);
        return res;
    }
}