package performance.businessdata;

import ch.ivyteam.ivy.business.data.store.restricted.IBusinessDataManager;
import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.searchengine.ISearchEngineManager;
import ch.ivyteam.ivy.security.ISecurityContext;
import performance.businessdata.model.Dossier;
import performance.businessdata.model.gen.RandomDossier;

public class BusinessDataPerformance {

  private static final int COUNT = 1_000;
  private static String ID_TO_READ;

  public static void fill() {
    var repo = Ivy.repo();
    var es = ISearchEngineManager.instance();

    es.indexing(false);
    try {
      for (var i = 0; i < COUNT; i++) {
        var dossier = RandomDossier.generate();
        repo.save(dossier);
      }
      var index = IBusinessDataManager.instance().getBusinessDataIndex(ISecurityContext.current().getName(), Dossier.class);
      es.reindex(index.toIndexName());
    } finally {
      es.indexing(true);
    }

    while (ID_TO_READ == null) {
      var results = repo.search(Dossier.class)
              .limit(1)
              .execute()
              .getAllInfos();
      if (!results.isEmpty()) {
        ID_TO_READ = results.get(0).getId();
      }
    }
  }

  public static void search() {
    var repo = Ivy.repo();
    var results = repo.search(Dossier.class)
            .limit(COUNT)
            .execute();
    if (results.count() != COUNT) {
      throw new RuntimeException("not all in indexed");
    }
  }

  public static void find() {
    var repo = Ivy.repo();
    var dossier = repo.find(ID_TO_READ, Dossier.class);
    if (dossier == null) {
      throw new RuntimeException("dossier not found");
    }
  }
}
