public class SapDataController {
    
    @AuraEnabled
    public static Map<String, String> getSapData(){
        return APICallWebService.parseResponseDom('callout:SAPAPI/SalesOrderSet(\'0500000201\')');
    }
}