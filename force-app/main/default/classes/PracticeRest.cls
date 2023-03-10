@RestResource(urlMapping='/v1/Welcome/*')
global with sharing class PracticeRest {

    global static String welcomeMessage='Welcome to the REST API';

    @httpGet
    global  static String getMessage() {

    return welcomeMessage;

        
    }
    @httpPost
    global  static String postMessage() {

        return welcomeMessage;
    }  



    
}