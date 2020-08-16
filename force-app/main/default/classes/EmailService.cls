public class EmailService{


@InvocableMethod(label='Email Service')
public static void sendEmail(WrapEmailService[] lstEmail){
system.debug('@@#$%^&'+lstEmail);

}

public class WrapEmailService{

@InvocableVariable(required=true)
public string strToAddress;

@InvocableVariable(required=false)
public string strCcAddress;

@InvocableVariable(required=true)
public string strEmailTemplateId;
}

}