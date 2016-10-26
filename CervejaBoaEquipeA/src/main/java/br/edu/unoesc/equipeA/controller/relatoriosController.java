package br.edu.unoesc.equipeA.controller;

import java.io.IOException;
import java.net.URL;

import br.edu.unoesc.equipeA.dao.CervejaDAO;
import br.edu.unoesc.equipeA.factory.DAOFactory;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.view.JasperViewer;

public class relatoriosController {

	private CervejaDAO cervejaDAO;

	public relatoriosController() {
		cervejaDAO = DAOFactory.get().cervejaDAO();
	}

	@FXML
	void onAlcoolica(ActionEvent event) {
		URL url = getClass().getResource("C:\\Users\\Marcos Policeno\\git\\cervejaBoa\\CervejaBoaEquipeA\\src\\main\\resources\\relatorio\\GraduacaoAlcoolica.jasper");
		// try {
		// JasperPrint jasperPrint = JasperFillManager.fillReport(
		// url.getPath(),
		// null, new ConexaoMysqlProducao().get());
		// JasperViewer.viewReport(jasperPrint);
		//// JasperExportManager.exportReportToPdfFile(jasperPrint,
		//// "relatorio.pdf");
		// } catch (JRException e) {
		// e.printStackTrace();
		// }
		try {

			JRDataSource dataSource = new JRBeanCollectionDataSource(cervejaDAO.todos()); // dados
																							// do
																							// relatório

			JasperPrint jasperPrint = JasperFillManager.fillReport(url.getPath(), null, dataSource);
			JasperViewer.viewReport(jasperPrint);
		} catch (JRException e) {
			e.printStackTrace();
		}

	}

	@FXML
	void onCadastradas(ActionEvent event) {

	}

	@FXML
	void onEstilo(ActionEvent event) {

	}

	@FXML
	void onMaiorNota(ActionEvent event) {

	}

	@FXML
	void onMaiorValor(ActionEvent event) {

	}

	@FXML
	void onMaisProvadas(ActionEvent event) {

	}

	@FXML
	void onMalteCevada(ActionEvent event) {

	}

	@FXML
	void onMenorNota(ActionEvent event) {

	}

	@FXML
	void onMenorValor(ActionEvent event) {

	}

	@FXML
	void onMenosProvadas(ActionEvent event) {

	}

	@FXML
	void onNacionalidade(ActionEvent event) {

	}

	@FXML
	void onNaoAvaliadas(ActionEvent event) {

	}

	@FXML
	void onProximaCerveja(ActionEvent event) {

	}

	@FXML
	void BuscaAvancada(ActionEvent event) {
		AbreTela("BuscaAvancada.fxml");
	}

	@FXML
	private BorderPane panelSecundario;

	public void AbreTela(String tela) {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(getClass().getResource("/telas/" + tela));
		try {
			AnchorPane telaView = (AnchorPane) loader.load();
			panelSecundario.setTop(telaView);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

}
