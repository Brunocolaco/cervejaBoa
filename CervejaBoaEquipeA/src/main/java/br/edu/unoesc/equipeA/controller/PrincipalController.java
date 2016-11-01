package br.edu.unoesc.equipeA.controller;

import java.io.IOException;

import br.edu.unoesc.equipeA.main.Main;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;

public class PrincipalController {
	@FXML
	private BorderPane principalTela;

	@FXML
	public void initialize() {
		onMenuBuscar(null);
	}

	@FXML
	void onMenuAvaliar(ActionEvent event) {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(getClass().getResource(Main.PATH_VIEW + "avaliacao.fxml"));
		try {
			AnchorPane avaliarView = (AnchorPane) loader.load();
			principalTela.setCenter(avaliarView);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	@FXML
	void onMenuBuscar(ActionEvent event) {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(getClass().getResource(Main.PATH_VIEW + "Buscar.fxml"));
		try {
			AnchorPane buscarView = (AnchorPane) loader.load();
			principalTela.setCenter(buscarView);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	@FXML
	void onMenuCerveja(ActionEvent event) {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(getClass().getResource(Main.PATH_VIEW + "cadastro.fxml"));
		try {
			AnchorPane cadastroView = (AnchorPane) loader.load();
			principalTela.setCenter(cadastroView);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	@FXML
	void onMenuRank(ActionEvent event) {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(getClass().getResource(Main.PATH_VIEW + "Relatorios.fxml"));
		try {
			AnchorPane relatorioView = (AnchorPane) loader.load();
			principalTela.setCenter(relatorioView);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
}
