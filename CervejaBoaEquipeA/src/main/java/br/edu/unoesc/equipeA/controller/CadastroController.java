package br.edu.unoesc.equipeA.controller;

import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;

import br.edu.unoesc.equipeA.componente.ListCellBean;
import br.edu.unoesc.equipeA.componente.StringConverterBean;
import br.edu.unoesc.equipeA.dao.CervejaDAO;
import br.edu.unoesc.equipeA.dao.CopoDAO;
import br.edu.unoesc.equipeA.dao.CorDAO;
import br.edu.unoesc.equipeA.dao.EstiloDAO;
import br.edu.unoesc.equipeA.dao.NacionalidadeDAO;
import br.edu.unoesc.equipeA.factory.DAOFactory;
import br.edu.unoesc.equipeA.model.Cerveja;
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
	private CorDAO corDAO;
	private EstiloDAO estiloDAO;
	private NacionalidadeDAO nacionalidadeDAO;

	public CadastroController() {
		cervejaDAO = DAOFactory.get().cervejaDAO();
		copoDAO = DAOFactory.get().copoDAO();
		corDAO = DAOFactory.get().corDAO();
		estiloDAO = DAOFactory.get().estiloDAO();
		nacionalidadeDAO = DAOFactory.get().nacionalidadeDAO();
	}

	@FXML
	public void initialize() {
		montaComboCopo();
		montaComboCor();
		montaComboEstilo();
		montaComboNacionalidade();
	}

	private void montaComboNacionalidade() {
		cbNacionalidade.getItems().addAll(nacionalidadeDAO.todos());
		cbNacionalidade.setCellFactory((comboBox) -> {
			return new ListCellBean<Nacionalidade>();
		});
		cbNacionalidade.setConverter(new StringConverterBean<>());
	}

	private void montaComboCopo() {
		cbCopo.getItems().addAll(copoDAO.todos());
		cbCopo.setCellFactory((comboBox) -> {
			return new ListCellBean<Copo>();
		});
		cbCopo.setConverter(new StringConverterBean<>());
	}

	private void montaComboCor() {
		cbCor.getItems().addAll(corDAO.todos());
		cbCor.setCellFactory((comboBox) -> {
			return new ListCellBean<Cor>();
		});
		cbCor.setConverter(new StringConverterBean<>());
	}

	private void montaComboEstilo() {
		cbEstilo.getItems().addAll(estiloDAO.todos());
		cbEstilo.setCellFactory((comboBox) -> {
			return new ListCellBean<Estilo>();
		});
		cbEstilo.setConverter(new StringConverterBean<>());
	}

	private void limparCampos() {
		taDescricao.setText("");
		tfNome.setText("");
		tfTemperatura.setText("");
		tfGradAlcool.setText("");
		tfPreco.setText("");
		tfPropMalte.setText("");
	}

	@FXML
	void onBuscar(ActionEvent event) {

	}

	@FXML
	void onExcluir(ActionEvent event) {
		limparCampos();

	}

	@FXML
	void onNovo(ActionEvent event) {
		limparCampos();
	}

	@FXML
	void onSalvar(ActionEvent event) {
		Cerveja cerveja = criaCerveja();
		cervejaDAO.salvar(cerveja);
	}

	private Cerveja criaCerveja() {
		Cerveja cerveja = new Cerveja();
		String preco = tfPreco.getText();
		String propmalte = tfPropMalte.getText();
		String teoralc = tfGradAlcool.getText();
		String temperatura = tfTemperatura.getText();
		cerveja.setNome(tfNome.getText());
		cerveja.setDescricao(taDescricao.getText());
		cerveja.setPreco(Double.valueOf(preco));
		cerveja.setPropmalte(Double.valueOf(propmalte));
		cerveja.setTeoralc(Double.valueOf(teoralc));
		cerveja.setTemperatura(Double.valueOf(temperatura));
		cerveja.setNacionalidade(cbNacionalidade.getValue());
		cerveja.setCopo(cbCopo.getValue());
		cerveja.setCor(cbCor.getValue());
		cerveja.setEstilo(cbEstilo.getValue());
		return cerveja;

	}

}
