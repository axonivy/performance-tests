package performance.rest.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import jakarta.annotation.security.PermitAll;
import jakarta.inject.Singleton;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Singleton
@Path("persons")
public class PersonService
{
  private List<Person> persons = new ArrayList<>();

  public PersonService()
  {
    addNewPerson("Bruno", "Bütler");
    addNewPerson("Reto", "Weiss");
    addNewPerson("Renato", "Stalder");
    addNewPerson("Reguel", "Wermelinger");
  }

  @GET
  @Produces(MediaType.APPLICATION_JSON)
  @PermitAll
  public List<Person> getPersons()
  {
    return persons;
  }

  private void addNewPerson(String firstname, String lastname)
  {
    Person person = new Person();
    person.setFirstName(firstname);
    person.setLastName(lastname);
    person.setId(UUID.randomUUID());
    persons.add(person);
  }
}
