package br.edu.unoesc.equipeA.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Avaliacao {

	private Long codigo;
	private String descricaoaval;
	private Long nota;
	private Double preco;
	private Date data;

	public Usuario usuario;
	public Cerveja cerveja;
}
