package br.edu.unoesc.equipeA.model;

import br.edu.unoesc.equipeA.componente.RenderizaCombo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cerveja implements Entidade, RenderizaCombo {

	private Long codigo;
	private String nome;
	private String descricao;
	private Double teoralc;
	private Double temperatura;
	private Double propmalte;
	private Double preco;
	private byte[] imagem;

	private Copo copo;
	private Cor cor;
	private Nacionalidade nacionalidade;
	private Estilo estilo;

	public Cerveja(Long codigo) {
		this.codigo = codigo;
	}

	public String getNomeCopo() {
		if (copo != null) {
			return copo.getNome();
		}
		return "";
	}

	public String getNomeCor() {
		if (cor != null) {
			return cor.getNome();
		}
		return "";
	}

	public String getNomeEstilo() {
		if (estilo != null) {
			return estilo.getNome();
		}
		return "";
	}

	public String getNomeNacionalidade() {
		if (nacionalidade != null) {
			return nacionalidade.getNome();
		}
		return "";
	}

	@Override
	public String getText() {
		// TODO Auto-generated method stub
		return getNome();
	}

}
