public class APICallWebService {
    public static Map<String, String> parseResponseDom(string url){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');                

        // Configure standard headers
        req.setHeader('Accept', '*/*');
        // This tells the API that we are sending and receiving the data as a JSON object 
        req.setHeader('Content-Type', 'application/xml');

        HttpResponse res = h.send(req);
        //System.debug(res.getBody());
        Dom.Document doc = res.getBodyDocument();

        //Retrieve the root element for this document
        Dom.XmlNode[] prop = doc.getRootElement()
        .getChildElement('content', 'http://www.w3.org/2005/Atom')
        .getChildElement('properties', 'http://schemas.microsoft.com/ado/2007/08/dataservices/metadata')
        .getChildElements();

        Map<String, String> returnData = new Map<String, String>();

        for(Dom.XmlNode node : prop){
            returnData.put(node.getName(), node.getText());
        }

        return returnData;
    }
}