package performance.businessdata.model.gen;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

public class CsvReader {

  public static List<String> read(String file) {
    try (var csvStream = Addresses.class.getResourceAsStream(file)) {
      List<String> lines = IOUtils.readLines(csvStream, StandardCharsets.UTF_8);
      lines.remove(0); // strip header
      return lines.stream().filter(StringUtils::isNotBlank).collect(Collectors.toList());
    } catch (IOException ex) {
      return null;
    }
  }
}
