package config;

import com.google.inject.Guice;
import com.google.inject.Injector;

/** Classe com propriedades do injetor Guice. */
public final class GuiceInjector {
  private static Injector defaultInjector;

  /** Retorna instância padrão do injetor. */
  public static Injector defaultInjector() {
    if (defaultInjector == null) {
      defaultInjector = Guice.createInjector(new BasicModule());
    }
    return defaultInjector;
  }
}
