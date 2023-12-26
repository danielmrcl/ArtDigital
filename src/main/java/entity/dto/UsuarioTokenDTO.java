package entity.dto;

import entity.Usuario;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UsuarioTokenDTO {
	private String nome;
	private String telefone;
	private String email;
	public String exp;

	public UsuarioTokenDTO(Usuario usuario) {
		this.nome = usuario.getNome();
		this.telefone = usuario.getTelefone();
		this.email = usuario.getEmail();
	}
}
