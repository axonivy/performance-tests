package performance.soap;

import java.net.MalformedURLException;
import java.net.URL;

import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.request.IHttpProcessModelVersionRequest;

public class ServiceContext
{

  public static ServiceContext create()
  {
    return new ServiceContext(getCurrentServer(), Ivy.wf().getApplication().getName());
  }

  public final String uri;
  public final String app;

  private ServiceContext(String uri, String app)
  {
    this.uri = uri;
    this.app = app;
  }

  public static final String getCurrentServer()
  {
    try
    {
      URL fullRequestUrl = getFullRequestUrl();
      return extractServerUrl(fullRequestUrl);
    }
    catch (Exception ex)
    {
      throw new RuntimeException("Failed to resolve server uri", ex);
    }
  }

  private static String extractServerUrl(URL url)
  {
    String protocol = url.getProtocol();
    String host = url.getHost();
    int port = url.getPort();
    if (port == -1)
    {
      return String.format("%s://%s", protocol, host);
    }
    else
    {
      return String.format("%s://%s:%d", protocol, host, port);
    }
  }

  private static URL getFullRequestUrl() throws MalformedURLException
  {
    IHttpProcessModelVersionRequest request = (IHttpProcessModelVersionRequest) Ivy.request();
    String fullRequestURL = request.getHttpServletRequest().getRequestURL().toString();
    return new URL(fullRequestURL);
  }

}
