package performance.businessdata.model.gen;

import org.apache.commons.lang3.RandomStringUtils;

import performance.businessdata.model.Contact;

public class Contacts {

  public static Contact createRandom() {
    Contact c = new Contact();
    c.businessPhone = randomPhone();
    c.landlinePhone = randomPhone();
    c.mobilePhone = randomPhone();
    c.eMail = randomMail();
    return c;
  }

  public static String randomMail() {
    return RandomStringUtils.secure().next(1, true, false) + "." + Names.getRandomLastname() + "@"
            + RandomStringUtils.secure().next(5, true, false) + ".com";
  }

  public static String randomPhone() {
    return RandomStringUtils.secure().next(12, false, true);
  }
}
