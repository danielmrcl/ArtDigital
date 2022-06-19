package config;

import com.google.inject.AbstractModule;
import service.IProfilePictureService;
import service.impl.GravatarServiceImpl;

/** Classe para bindar implementações para injeção de dependencias. */
public class BasicModule extends AbstractModule {
  @Override
  protected void configure() {
    bind(IProfilePictureService.class).to(GravatarServiceImpl.class);
  }
}
