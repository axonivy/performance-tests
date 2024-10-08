package performance.businessdata.model.gen;

import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang3.RandomUtils;

public class Names
{
  private static List<String> firstnames;

  public static String randomTitle()
  {
    List<String> titles = Arrays.asList("MR", "MS", "DR");
    return titles.get(RandomUtils.secure().randomInt(0, titles.size()));
  }

  public static String randomFullName()
  {
    return getRandomFirstname() + " " + getRandomLastname();
  }

  public synchronized static String getRandomFirstname()
  {
    if (firstnames == null)
    {
      firstnames = CsvReader.read("firstnames.csv");
      // http://www.quietaffiliate.com/free-first-name-and-last-name-databases-csv-and-sql/
    }
    if (firstnames == null)
    {
      return null;
    }
    return randomOf(firstnames);
  }

  public static String randomOf(List<String> lines)
  {
    int entry = (int)Math.round(Math.random() * (lines.size()-1));
    return lines.get(entry);
  }

  private static List<String> lastnames;

  public static synchronized String getRandomLastname()
  {
    if (lastnames == null)
    {
      lastnames = CsvReader.read("lastnames.csv");
      // http://www.quietaffiliate.com/free-first-name-and-last-name-databases-csv-and-sql/
    }
    if (lastnames == null)
    {
      return null;
    }
    return randomOf(lastnames);
  }

}
