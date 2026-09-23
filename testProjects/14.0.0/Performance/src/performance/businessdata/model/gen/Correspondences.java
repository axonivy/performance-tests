package performance.businessdata.model.gen;

import performance.businessdata.model.Correspondence;

public class Correspondences {

  public static Correspondence createRandom() {
    Correspondence correspondence = new Correspondence();
    correspondence.title = Names.randomTitle();
    correspondence.firstName = Names.getRandomFirstname();
    correspondence.lastName = Names.getRandomLastname();
    correspondence.differentAddress = RandomDossier.randomBoolean();
    if (correspondence.differentAddress) {
      correspondence.address = Addresses.getRandom();
    }
    correspondence.contact = Contacts.createRandom();
    return correspondence;
  }
}
