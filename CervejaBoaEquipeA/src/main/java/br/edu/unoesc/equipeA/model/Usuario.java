package br.edu.unoesc.equipeA.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Usuario {

	private Long codigo;
	private String nome;
	private String login;
	private String senha;
	private String email;
}
