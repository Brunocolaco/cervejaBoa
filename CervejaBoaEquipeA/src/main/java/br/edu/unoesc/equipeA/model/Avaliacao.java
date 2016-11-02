package br.edu.unoesc.equipeA.model;

import java.sql.Date;

import br.edu.unoesc.equipeA.componente.RenderizaCombo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Avaliacao implements Entidade, RenderizaCombo {

	private Long codigo;
	private String descricaoaval;
	private Double nota;
	private Double preco;
	private Date data;

	public Cerveja cerveja;

	@Override
	public String getText() {
		// TODO Auto-generated method stub
		return getDescricaoaval();
	}

}