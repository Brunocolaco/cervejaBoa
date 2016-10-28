package br.edu.unoesc.equipeA.controller;

import com.jfoenix.controls.JFXTextField;

import br.edu.unoesc.equipeA.model.Avaliacao;
import br.edu.unoesc.equipeA.model.Cerveja;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;

public class buscarController {

	@FXML
	private JFXTextField tfBuscar;

	@FXML
	private TableView<Cerveja> tvCerveja;

	@FXML
	private TableColumn<Cerveja, String> tcNome;

	@FXML
	private TableColumn<Cerveja, String> tcNacionalidade;

	@FXML
	private TableColumn<Cerveja, Number> tcValor;

	@FXML
	private TableColumn<Avaliacao, String> tcAvaliacao;

	@FXML
	void onAlterar(ActionEvent event) {

	}

	@FXML
	void onAvaliar(ActionEvent event) {

	}

	@FXML
	void onBuscar(ActionEvent event) {

	}

	@FXML
	void onExcluir(ActionEvent event) {

	}

	@FXML
	void onNovo(ActionEvent event) {
	}

}
