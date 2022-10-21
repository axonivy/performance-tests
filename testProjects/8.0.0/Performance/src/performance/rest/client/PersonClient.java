package performance.rest.client;

import java.util.List;

import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.rest.client.GenericTypes;
import performance.rest.service.Person;

public class PersonClient
{
  public List<Person> getPersons()
  {
    return Ivy.rest().client("PersonService").request().get(GenericTypes.listOf(Person.class));
  }
}
