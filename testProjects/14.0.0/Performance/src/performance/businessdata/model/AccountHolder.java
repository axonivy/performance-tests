package performance.businessdata.model;

import java.util.Date;

public class AccountHolder {
  public String name;
  public AhType type;
  public String uidNumber;
  public Boolean registered;
  public Date dateOfRegistry;
  public String nogaCoda;
  public String sectorOrMainActivity;
  public String purposeOfEntity;
  public Number yearOfIncorporation;
  public int numberOfEmployees;
  public Date dateOfSupply;
  public String domicileCountry;
  public String domicileCountryControllingPerson;
  public String language;
  public String contactPerson;
  public String bankBranch;

  public Address address;
  public Correspondence correspondence;

  public static enum AhType {
    COOPERATIVE, ASSOCIATION, FOUNDATION, TRUST;
  }
}
