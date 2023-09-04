public with sharing class accIndustrySum {
    public static Map<String,Decimal> Industrysum(List<Account> accList) {
        Map<String, Decimal> accMap = new Map<String, Decimal>();

        if (accList.size()>0) {
            for (Account acc : accList) {
                if (accMap.containsKey(acc.Industry)) {
                    accMap.put(acc.Industry,accMap.get(acc.Industry)+acc.AnnualRevenue);
                }
                else {
                    accMap.put(acc.Industry,acc.AnnualRevenue);
                }
            }
        }
        return accMap;
    }
}