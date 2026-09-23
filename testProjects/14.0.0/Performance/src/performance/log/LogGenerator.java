package performance.log;

import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.log.Logger;

public class LogGenerator
{
  private static final Logger LOGGER = Logger.getLogger(LogGenerator.class);

  public static void logErrors()
  {
    for (int i = 0; i < 50; i++)
    {
      logError();
    }
  }

  private static void logError()
  {
    Ivy.log().error("message");
    Ivy.log().error("message with arg {0}", "bla");
    Ivy.log().error("stacktrace", new RuntimeException());

    Logger.getLogger(LogGenerator.class).error("message");
    Logger.getLogger(LogGenerator.class).error("message with arg {0}", "bla");
    Logger.getLogger(LogGenerator.class).error("stacktrace", new RuntimeException());

    LOGGER.error("message");
    LOGGER.error("message with arg {0}", "bla");
    LOGGER.error("stacktrace", new RuntimeException());
  }

  public static void logDebugs()
  {
    for (int i = 0; i < 1000; i++)
    {
      logDebug();
    }
  }

  private static void logDebug()
  {
    Ivy.log().debug("message");
    Ivy.log().debug("message with arg {0}", "bla");
    Ivy.log().debug("stacktrace", new RuntimeException());

    Logger.getLogger(LogGenerator.class).debug("message");
    Logger.getLogger(LogGenerator.class).debug("message with arg {0}", "bla");
    Logger.getLogger(LogGenerator.class).debug("stacktrace", new RuntimeException());

    LOGGER.debug("message");
    LOGGER.debug("message with arg {0}", "bla");
    LOGGER.debug("stacktrace", new RuntimeException());
  }
}
