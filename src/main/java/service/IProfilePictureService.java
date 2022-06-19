package service;

import java.io.IOException;

/** Interface para métodos relacionados à imagem de perfil remota do usuário. */
public interface IProfilePictureService {
  /**
   * Busca os bytes da imagem por uma chave.
   */
  byte[] getImageBytes(String chave) throws IOException;
}
