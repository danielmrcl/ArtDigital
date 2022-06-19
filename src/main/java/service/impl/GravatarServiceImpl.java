package service.impl;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import service.IProfilePictureService;

import java.io.IOException;

/** Serviço com implementção de métodos relacionados ao gravatar. */
public class GravatarServiceImpl implements IProfilePictureService {
  @Override
  public byte[] getImageBytes(String hash) throws IOException {
    var client = new OkHttpClient();
    var request = new Request.Builder()
        .url("https://www.gravatar.com/avatar/" + hash)
        .build();
    var response = client.newCall(request).execute();
    return response.body().bytes();
  }
}
