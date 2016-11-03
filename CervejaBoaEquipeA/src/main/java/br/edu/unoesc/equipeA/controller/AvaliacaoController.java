package br.edu.unoesc.equipeA.controller;

import java.sql.Date;
import java.time.LocalDate;

import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXDatePicker;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;

import br.edu.unoesc.equipeA.componente.ListCellBean;
import br.edu.unoesc.equipeA.componente.StringConverterBean;
import br.edu.unoesc.equipeA.dao.AvaliacaoDAO;
import br.edu.unoesc.equipeA.dao.CervejaDAO;
import br.edu.unoesc.equipeA.factory.DAOFactory;
import br.edu.unoesc.equipeA.model.Avaliacao;
import br.edu.unoesc.equipeA.model.Cerveja;
import br.edu.unoesc.equipeA.model.Estilo;
import br.edu.unoesc.equipeA.model.Nacionalidade;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;

public class AvaliacaoController {

	@FXML
	private JFXTextField tfPreco;

	@FXML
	private JFXTextArea txaDescricao;

	@FXML
	private JFXTextField tfNota;

	@FXML
	private JFXComboBox<Nacionalidade> cbNacionalidade;

	@FXML
	private JFXComboBox<Estilo> cbEstilo;

	@FXML
	private JFXDatePicker dpDataAvaliacao;

	@FXML
	private JFXComboBox<Cerveja> cbNome;

	private CervejaDAO cervejaDAO;
	private AvaliacaoDAO avaliacaoDAO;

	public AvaliacaoController() {
		cervejaDAO = DAOFactory.get().cervejaDAO();
		avaliacaoDAO = DAOFactory.get().avaliacaoDAO();
	}

	@FXML
	public void initialize() {
		montaComboCerveja();
	}

	private void montaComboCerveja() {
		cbNome.getItems().addAll(cervejaDAO.todos());
		cbNome.setCellFactory((comboBox) -> {
			return new ListCellBean<Cerveja>();
		});
		cbNome.setConverter(new StringConverterBean<>());
	}

	private void limparCampos() {
		cbNome.setValue(null);
		txaDescricao.setText("");
		tfPreco.setText("");
		tfNota.setText("");
		dpDataAvaliacao.setValue(null);
	}

	@FXML
	void onCancelar(ActionEvent event) {
		limparCampos();
	}

	@FXML
	void onLimpar(ActionEvent event) {
		limparCampos();
	}

	@FXML
	void onSalvar(ActionEvent event) {
		Avaliacao avaliacao = criaAvaliacao();
		avaliacaoDAO.salvar(avaliacao);
		limparCampos();
	}

	private Avaliacao criaAvaliacao() {
		Avaliacao avaliacao = new Avaliacao();
		String preco = tfPreco.getText();
		String nota = tfNota.getText();
		LocalDate data = dpDataAvaliacao.getValue();
		avaliacao.setDescricaoaval(txaDescricao.getText());
		avaliacao.setPreco(Double.valueOf(preco));
		avaliacao.setNota(Double.valueOf(nota));
		avaliacao.setData(Date.valueOf(data));
		avaliacao.setCerveja(cbNome.getValue());
		return avaliacao;

	}

}
