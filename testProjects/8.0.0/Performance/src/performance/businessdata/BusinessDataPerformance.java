package performance.businessdata;

import ch.ivyteam.di.restricted.DiCore;
import ch.ivyteam.ivy.business.data.store.restricted.IBusinessDataManager;
import ch.ivyteam.ivy.business.data.store.search.internal.BusinessDataSearchReindexer;
import ch.ivyteam.ivy.business.data.store.search.internal.elasticsearch.JestIndex;
import ch.ivyteam.ivy.environment.Ivy;
import performance.businessdata.model.Dossier;
import performance.businessdata.model.gen.RandomDossier;

@SuppressWarnings("restriction")
public class BusinessDataPerformance {

  private static final int COUNT = 1_000;
  private static String ID_TO_READ;

  public static void fill() {
    var repo = Ivy.repo();

    JestIndex.enabled = false;
    try {
      for (var i = 0; i < COUNT; i++) {
        var dossier = RandomDossier.generate();
        repo.save(dossier);
      }
      var indexName = IBusinessDataManager.get().getBusinessDataIndex(Dossier.class);
      DiCore.getGlobalInjector().getInstance(BusinessDataSearchReindexer.class).startSync(indexName);
    } finally {
      JestIndex.enabled = true;
    }

    var results = repo.search(Dossier.class).limit(1).execute();
    var info = results.getAllInfos().get(0);
    ID_TO_READ = info.getId();
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
