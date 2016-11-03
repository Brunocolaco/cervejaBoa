package br.edu.unoesc.equipeA.controller;

import br.edu.unoesc.equipeA.conexao.ConexaoMysqlProducao;
import br.edu.unoesc.equipeA.dao.CervejaDAO;
import br.edu.unoesc.equipeA.factory.DAOFactory;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

public class relatoriosController {

	public CervejaDAO cervejaDAO;

	public relatoriosController() {
		cervejaDAO = DAOFactory.get().cervejaDAO();
	}

	@FXML
	void onAlcoolica(ActionEvent event) {
		try {
			JasperPrint jasperPrint = JasperFillManager.fillReport(
					"C:\\Users\\Bruno\\git\\cervejaBoa\\CervejaBoaEquipeA\\src\\main\\resources\\relatorio\\GraduacaoAlcoolica.jasper",
					null, new ConexaoMysqlProducao().get());
			JasperViewer.viewReport(jasperPrint, false);// false=serve para nao
														// fechar a tela após
														// finalizar a
														// visualizacao do
														// relatorio
		} catch (JRException e) {
			e.printStackTrace();
		}
	}

	@FXML
	void onCadastradas(ActionEvent event) {
		try {
			JasperPrint jasperPrint = JasperFillManager.fillReport(
					"C:\\Users\\Bruno\\git\\cervejaBoa\\CervejaBoaEquipeA\\src\\main\\resources\\relatorio\\todasCadastradas.jasper",
					null, new ConexaoMysqlProducao().get());
			JasperViewer.viewReport(jasperPrint, false);// false=serve para nao
														// fechar a tela após
														// finalizar a
														// visualizacao do
														// relatorio
		} catch (JRException e) {
			e.printStackTrace();
		}

	}

	@FXML
	void onEstilo(ActionEvent event) {
		try {
			JasperPrint jasperPrint = JasperFillManager.fillReport(
					"C:\\Users\\Bruno\\git\\cervejaBoa\\CervejaBoaEquipeA\\src\\main\\resources\\relatorio\\estilo.jasper",
					null, new ConexaoMysqlProducao().get());
			JasperViewer.viewReport(jasperPrint, false);// false=serve para nao
														// fechar a tela após
														// finalizar a
														// visualizacao do
														// relatorio
		} catch (JRException e) {
			e.printStackTrace();
		}

	}

	@FXML
	void onMaiorNota(ActionEvent event) {
		try {
			JasperPrint jasperPrint = JasperFillManager.fillReport(
					"C:\\Users\\Bruno\\git\\cervejaBoa\\CervejaBoaEquipeA\\src\\main\\resources\\relatorio\\maiorNota.jasper",
					null, new ConexaoMysqlProducao().get());
			JasperViewer.viewReport(jasperPrint, false);// false=serve para nao
														// fechar a tela após
														// finalizar a
														// visualizacao do
														// relatorio
		} catch (JRException e) {
			e.printStackTrace();
		}

	}

	@FXML
	void onMaiorValor(ActionEvent event) {
		try {
			JasperPrint jasperPrint = JasperFillManager.fillReport(
					"C:\\Users\\Bruno\\git\\cervejaBoa\\CervejaBoaEquipeA\\src\\main\\resources\\relatorio\\maiorValor.jasper",
					null, new ConexaoMysqlProducao().get());
			JasperViewer.viewReport(jasperPrint, false);// false=serve para nao
														// fechar a tela após
														// finalizar a
														// visualizacao do
														// relatorio
		} catch (JRException e) {
			e.printStackTrace();
		}

	}

	@FXML
	void onMalteCevada(ActionEvent event) {
		try {
			JasperPrint jasperPrint = JasperFillManager.fillReport(
					"C:\\Users\\Bruno\\git\\cervejaBoa\\CervejaBoaEquipeA\\src\\main\\resources\\relatorio\\proporcaoMalteCevada.jasper",
					null, new ConexaoMysqlProducao().get());
			JasperViewer.viewReport(jasperPrint, false);// false=serve para nao
														// fechar a tela após
														// finalizar a
														// visualizacao do
														// relatorio
		} catch (JRException e) {
			e.printStackTrace();
		}

	}

	@FXML
	void onMenorNota(ActionEvent event) {
		try {
			JasperPrint jasperPrint = JasperFillManager.fillReport(
					"C:\\Users\\Bruno\\git\\cervejaBoa\\CervejaBoaEquipeA\\src\\main\\resources\\relatorio\\MenorNota.jasper",
					null, new ConexaoMysqlProducao().get());
			JasperViewer.viewReport(jasperPrint, false);// false=serve para nao
														// fechar a tela após
														// finalizar a
														// visualizacao do
														// relatorio
		} catch (JRException e) {
			e.printStackTrace();
		}

	}

	@FXML
	void onMenorValor(ActionEvent event) {
		try {
			JasperPrint jasperPrint = JasperFillManager.fillReport(
					"C:\\Users\\Bruno\\git\\cervejaBoa\\CervejaBoaEquipeA\\src\\main\\resources\\relatorio\\menorValor.jasper",
					null, new ConexaoMysqlProducao().get());
			JasperViewer.viewReport(jasperPrint, false);// false=serve para nao
														// fechar a tela após
														// finalizar a
														// visualizacao do
														// relatorio
		} catch (JRException e) {
			e.printStackTrace();
		}

	}

	@FXML
	void onNacionalidade(ActionEvent event) {
		try {
			JasperPrint jasperPrint = JasperFillManager.fillReport(
					"C:\\Users\\Bruno\\git\\cervejaBoa\\CervejaBoaEquipeA\\src\\main\\resources\\relatorio\\nacionalidade.jasper",
					null, new ConexaoMysqlProducao().get());
			JasperViewer.viewReport(jasperPrint, false);// false=serve para nao
														// fechar a tela após
														// finalizar a
														// visualizacao do
														// relatorio
			// JasperExportManager.exportReportToPdfFile(jasperPrint,
			// "relatorio.pdf");
		} catch (JRException e) {
			e.printStackTrace();
		}

	}

}
