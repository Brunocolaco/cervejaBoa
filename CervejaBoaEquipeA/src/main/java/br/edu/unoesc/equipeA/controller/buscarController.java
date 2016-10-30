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

	private CervejaDAO cervejaDAO;
	// private AvaliacaoDAO avaliacaoDAO;
	// private NacionalidadeDAO nacionalidadeDAO;

	public buscarController() {
		cervejaDAO = DAOFactory.get().cervejaDAO();
		// avaliacaoDAO = DAOFactory.get().avaliacaoDAO();
		// nacionalidadeDAO = DAOFactory.get().nacionalidadeDAO();
	}

	@FXML
	public void initialize() {
		tcNome.setCellValueFactory(new PropertyValueFactory<>("nome"));
		tcNacionalidade.setCellValueFactory(new PropertyValueFactory<>("nome"));
		tcValor.setCellValueFactory(new PropertyValueFactory<>("preco"));
		atualizaTabela();
		//ouvirSelecaoTabela();
	}

	/*private void ouvirSelecaoTabela() {
		tvCerveja.getSelectionModel().selectedItemProperty().addListener((observable, cvVelha, cvSelecionada) -> {
			if (cvSelecionada != null) {
				populaTela(cvSelecionada);
			}
		});
	}*/

	private void atualizaTabela() {
		Collection<Cerveja> cervejas = cervejaDAO.todos();
		tvCerveja.setItems(FXCollections.observableArrayList(cervejas));
	}

	/*private void populaTela(Cerveja cvSelecionada) {

	}*/

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
