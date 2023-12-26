package utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;

import java.time.Instant;
import java.util.Base64;
import java.io.IOException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import entity.Login;
import entity.dto.UsuarioTokenDTO;

public class JWTUtil {

	private static final ObjectMapper mapper =
		new ObjectMapper().registerModule(new JavaTimeModule());
	private static final String secret = System.getenv("JWT_SECRET");

	public static String generate(UsuarioTokenDTO usuario) {
		try {
			var algorithm = Algorithm.HMAC512(secret);
			return JWT.create()
				.withPayload(mapper.writeValueAsString(usuario))
				.withExpiresAt(Instant.now().plusSeconds(60))
				.sign(algorithm);
		} catch (JWTCreationException | JsonProcessingException exception){
			exception.printStackTrace();
			return null;
		}
	}

	public static UsuarioTokenDTO verify(String token) {
		try {
			var algorithm = Algorithm.HMAC512(secret);
			var verifier = JWT.require(algorithm)
				.build();
			byte[] payload = Base64.getDecoder().decode(verifier.verify(token).getPayload());
			return mapper.readValue(payload, UsuarioTokenDTO.class);
		} catch (Exception e){
			e.printStackTrace();
			return null;
		}
	}
}
