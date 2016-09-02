package br.edu.unoesc.equipeA.conexao;

import java.sql.Connection;

public interface Conexao {
	Connection get();

	void close();
}
