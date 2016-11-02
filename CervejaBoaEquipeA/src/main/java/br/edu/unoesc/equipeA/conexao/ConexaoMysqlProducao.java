package br.edu.unoesc.equipeA.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoMysqlProducao implements Conexao {
	private static Connection connection;

	static {
		createConnection();
	}

	// trocar usuario e senhar antes de ir pro git
	private static void createConnection() {
		String url = "jdbc:mysql://localhost:3306/cervejaBoa";
		String user = "root";
		String password = "";
		try {
			connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException ex) {
			ex.printStackTrace();
			System.out.println("Erro de conexão com o banco de dados");
		}
	}

	public Connection get() {
		try {
			if (connection.isClosed()) {
				createConnection();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public void close() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Erro ao fechar conexão");
		}
	}

}