public class OrderHelper {
  public static void AfterUpdate(List<Order> newList, List<Order> oldList){
    Set<Id> activatedOrderIds = new Set<Id>();
    for (Integer i = 0; i < newList.size(); i++) {
      if(newList[i].Status == Constants.ACTIVATED_ORDER_STATUS && oldList[i].Status == Constants.DRAFT_ORDER_STATUS) {
        activatedOrderIds.add(newList[i].Id);
      }
    }

    RollUpOrderItems(activatedOrderIds);
  }

  public static void RollUpOrderItems(Set<Id> activatedOrderIds){

    Map<Id, Product2> productMap = new Map<Id, Product2>();
    Set<Id> productIds = new Set<Id>();


    List<OrderItem> items = [SELECT Id, Product2Id, Quantity FROM OrderItem WHERE OrderId In :activatedOrderIds];


    for(OrderItem oi : items) {
      productIds.add(oi.Product2Id);
    }

    productMap = new Map<Id, Product2>([SELECT Id, Quantity_Ordered__c FROM Product2 WHERE Id IN:productIds]);

    AggregateResult[] aggregatedResults  = [SELECT Product2Id, SUM(Quantity) aggregatedQuantity FROM OrderItem WHERE Product2Id In :productMap.keySet() GROUP BY Product2Id];

    for (AggregateResult ar : aggregatedResults)  {
      productMap.get((String)ar.get('Product2Id')).Quantity_Ordered__c = Integer.valueOf(ar.get('aggregatedQuantity'));
    }


    if(productMap != null && productMap.size() > 0) {
      update productMap.values();
    }
  }

}