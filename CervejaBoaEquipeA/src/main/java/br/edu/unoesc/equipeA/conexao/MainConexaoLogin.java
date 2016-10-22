package br.edu.unoesc.equipeA.conexao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MainConexaoLogin {

	public static void main(String[] args) {
		try {
			Connection connection = ConexaoLogin.get();
			System.out.println(connection.toString());
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from medico");
			while (rs.next()) {
				System.out.println("Nome: " + rs.getString("nommedico"));
				System.out.println("Código: " + rs.getInt("codmedico"));
			}
		} catch (SQLException e) {
			System.out.println("Erro de conexão ao banco de dados");
			e.printStackTrace();
		} finally {
			ConexaoLogin.close();
		}
	}

}
