package br.edu.unoesc.equipeA.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cerveja {

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

}
