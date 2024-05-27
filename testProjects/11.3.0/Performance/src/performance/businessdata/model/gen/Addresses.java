package performance.businessdata.model.gen;

import java.util.List;

import performance.businessdata.model.Address;

public class Addresses {
  private static List<String> addresses;

  private static List<String> read() {
    return CsvReader.read("glarus.csv");
    // downloaded from https://results.openaddresses.io/ (ch/glarus)
  }

  public synchronized static Address getRandom() {
    if (addresses == null) {
      addresses = read();
    }
    if (addresses == null) {
      return null;
    }
    if (addresses.isEmpty()) { // all used re-read
      addresses = read();
    }
    int entry = (int) Math.round(Math.random() * (addresses.size() - 1));
    String address = addresses.remove(entry);
    return toObject(address);
  }

  private static Address toObject(String adrLine) {
    String[] columns = adrLine.split(",");
    Address address = new Address();
    address.street = columns[COLUMN.STREET] + " " + columns[COLUMN.NUMBER];
    address.zipCode = columns[COLUMN.ZIP];
    address.city = columns[COLUMN.CITY];
    address.country = "Switzerland";
    return address;
  }

  private static interface COLUMN {
    int NUMBER = 0;
    int STREET = 1;
    int CITY = 2;
    int ZIP = 3;
  }

}
