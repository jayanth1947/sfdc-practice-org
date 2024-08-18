public class ContactEmailChecker {
	 public static Boolean checkEmailDomains(List<Contact> contacts, String domainPattern) {
         // It is a method used to compile the given regular expression into a pattern.
        Pattern pattern = Pattern.compile(domainPattern);
        for (Contact contact : contacts) {
            String emailDomain = contact.Email.substringAfter('@');
            Matcher matcher = pattern.matcher(emailDomain);
            if (matcher.matches()) {
                System.debug(matcher);
                return true;
                
            }
        }
        return false;
    }
}