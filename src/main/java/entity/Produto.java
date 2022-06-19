package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "produto")
public class Produto {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_prod")
	private Long id;

	@Column(name = "descricao_prod")
	private String descricao;

	@Column(name = "nome_prod")
	private String nome;

	@Column(name = "quantidade")
	private int quantidade;

	@Column(name = "valor_unit")
	private Double valorUnit;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "cod_img", nullable = false)
	private Imagem imagem;

	@ManyToOne
	@JoinColumn(name = "cod_categ", nullable = false)
	private Categoria categoria;

	@ManyToOne
	@JoinColumn(name = "cod_usuario", nullable = false)
	private Usuario usuario;
}
