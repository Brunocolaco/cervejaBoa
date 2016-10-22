package br.edu.unoesc.equipeA.controller;

import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;

import br.edu.unoesc.equipeA.dao.CervejaDAO;
import br.edu.unoesc.equipeA.dao.CopoDAO;
import br.edu.unoesc.equipeA.model.Copo;
import br.edu.unoesc.equipeA.model.Cor;
import br.edu.unoesc.equipeA.model.Estilo;
import br.edu.unoesc.equipeA.model.Nacionalidade;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.image.ImageView;

public class CadastroController {

	@FXML
	private JFXTextField tfNome;

	@FXML
	private JFXTextField tfGradAlcool;

	@FXML
	private JFXTextField tfTemperatura;

	@FXML
	private JFXTextField tfPropMalte;

	@FXML
	private JFXTextField tfPreco;

	@FXML
	private JFXTextArea taDescricao;

	@FXML
	private JFXComboBox<Nacionalidade> cbNacionalidade;

	@FXML
	private JFXComboBox<Estilo> cbEstilo;

	@FXML
	private JFXComboBox<Cor> cbCor;

	@FXML
	private JFXComboBox<Copo> cbCopo;

	@FXML
	private ImageView imgFoto;

	private CervejaDAO cervejaDAO;
	private CopoDAO copoDAO;

	public CadastroController() {

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

	@FXML
	void onSalvar(ActionEvent event) {

	}

}
