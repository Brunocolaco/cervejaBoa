package br.edu.unoesc.equipeA.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXCheckBox;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;
import com.mysql.jdbc.Connection;

import br.edu.unoesc.equipeA.conexao.Conexao;
import br.edu.unoesc.equipeA.conexao.ConexaoMysqlProducao;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Hyperlink;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class LoginController {

	@FXML
	private JFXPasswordField tfSenha;

	@FXML
	private JFXTextField tfUsuario;

	@FXML
	private JFXCheckBox cbLembrar;

	@FXML
	private JFXTextField tfEmail;

	@FXML
	private JFXButton btnLogin;

	@FXML
	private Hyperlink lbEsqueceu;

	@FXML
	private AnchorPane buscarPrincipal;

	private Conexao conexao;

	public LoginController() {
		conexao = new ConexaoMysqlProducao();
	}

	@FXML
	void onLogar(ActionEvent event) {
		try {
			Connection connection = (Connection) conexao.get();
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("select Login, Senha from usuario");
			rs.first();
			if (tfUsuario.getText().equals("") || (tfSenha.getText().equals(""))) {
				JOptionPane.showMessageDialog(null, "Campos não podem ser nulos.");
			}
			if (tfUsuario.getText().equals(rs.getString("Login"))
					&& (tfSenha.getText().equals(rs.getString("Senha")))) {
				Node node = (Node) event.getSource();
				Stage stage = (Stage) node.getScene().getWindow();
				Parent root = null;
				try {
					root = FXMLLoader.load(getClass().getResource("../view/principal.fxml"));
				} catch (IOException ex) {
				}
				Scene scene = new Scene(root);
				stage.setScene(scene);
				stage.show();

			} else {
				JOptionPane.showMessageDialog(null, "Usário ou senha incorretos!");
				tfSenha.setText("");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
