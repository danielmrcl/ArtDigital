package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "usuario")
public class Usuario {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_usuario")
	private Long id;
	
	@Column(name = "nome_razao")
	private String nome;
	
	@Column(name = "telefone")
	private String telefone;
	
	@Column(name = "email", unique = true)
	private String email;
	
	@OneToOne
	@JoinColumn(name = "id_login")
	@Cascade(CascadeType.ALL)
	private Login login;

	@Column(name = "cep")
	private String cep;

	@Column(name = "bairro")
	private String bairro;
	
	@Column(name = "rua")
	private String rua;
	
	@Column(name = "numero")
	private int numero;
	
	@Column(name = "cidade")
	private String cidade;
	
	@Column(name = "uf")
	private String uf;
	
	@Column(name = "cpf", unique = true)
	private String cpf;
	
	@Column(name = "cnpj", unique = true)
	private String cnpj;
}
