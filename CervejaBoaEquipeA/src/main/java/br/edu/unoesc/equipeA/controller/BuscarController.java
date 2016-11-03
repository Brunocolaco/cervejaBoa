package br.edu.unoesc.equipeA.controller;

import java.util.Collection;

import com.jfoenix.controls.JFXTextField;

import br.edu.unoesc.equipeA.dao.CervejaDAO;
import br.edu.unoesc.equipeA.factory.DAOFactory;
import br.edu.unoesc.equipeA.model.Cerveja;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.KeyEvent;

public class BuscarController {

	@FXML
	private JFXTextField tfBuscar;

	@FXML
	private TableView<Cerveja> tvCerveja;

	@FXML
	private TableColumn<Cerveja, String> tcNome;

	@FXML
	private TableColumn<Cerveja, Double> tcTeor;

	@FXML
	private TableColumn<Cerveja, Double> tcPreco;

	@FXML
	private TableColumn<Cerveja, Double> tcMalte;

	private CervejaDAO cervejaDAO;

	public BuscarController() {
		cervejaDAO = DAOFactory.get().cervejaDAO();
	}

	@FXML
	public void initialize() {

		tcNome.setCellValueFactory(new PropertyValueFactory<>("nome"));
		tcTeor.setCellValueFactory(new PropertyValueFactory<>("teoralc"));
		tcPreco.setCellValueFactory(new PropertyValueFactory<>("preco"));
		tcMalte.setCellValueFactory(new PropertyValueFactory<>("propmalte"));
		atualizaTabela();
	}

	private void atualizaTabela() {
		Collection<Cerveja> cervejas = cervejaDAO.todos();
		tvCerveja.setItems(FXCollections.observableArrayList(cervejas));
	}

	@FXML
	void onPesquisar(KeyEvent event) {
		String pesquisa = tfBuscar.getText() + event.getText();
		if (pesquisa.length() > 2) {
			Collection<Cerveja> cervejas = cervejaDAO.getPorNome(pesquisa);
			tvCerveja.setItems(FXCollections.observableArrayList(cervejas));
		}
		if (pesquisa.length() < 2) {
			atualizaTabela();
		}
	}

	@FXML
	void onAvaliar(ActionEvent event) {

	}

}
