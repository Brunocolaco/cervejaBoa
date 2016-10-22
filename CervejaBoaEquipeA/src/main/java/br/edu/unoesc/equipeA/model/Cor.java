package br.edu.unoesc.equipeA.model;

import br.edu.unoesc.equipeA.componente.RenderizaCombo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Cor implements Entidade, RenderizaCombo {

	private Long codigo;
	private String nome;

	public Cor(Long codigo) {
		this.codigo = codigo;
	}

	@Override
	public String getText() {
		// TODO Auto-generated method stub
		return getNome();
	}

}
