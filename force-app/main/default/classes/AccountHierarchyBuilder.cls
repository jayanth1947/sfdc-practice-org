public class AccountHierarchyBuilder {  
  public static Map<Id, List<Id>> buildHierarchy() {
   
    Map<Id, List<Id>> hierarchy = new Map<Id, List<Id>>();
    List<Account> accounts = [SELECT Id, ParentId FROM Account];
    for (Account acc : accounts) {
      if (acc.ParentId != null) {
        Id parentId = acc.ParentId;
        if (hierarchy.containsKey(parentId)) {
          hierarchy.get(parentId).add(acc.Id);
        } else {
          List<Id> children = new List<Id>();
          children.add(acc.Id);
        
          hierarchy.put(parentId, children);
        }
      }
    }
   System.debug('Map of accounts '+hierarchy);
    return hierarchy;
  }
}