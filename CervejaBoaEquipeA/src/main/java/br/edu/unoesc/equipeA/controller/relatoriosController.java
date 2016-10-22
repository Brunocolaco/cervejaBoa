package br.edu.unoesc.equipeA.controller;

import java.io.IOException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;

public class relatoriosController {

	@FXML
    void onAlcoolica(ActionEvent event) {

    }

    @FXML
    void onCadastradas(ActionEvent event) {

    }

    @FXML
    void onCadastradasUsuario(ActionEvent event) {

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
		loader.setLocation(getClass().getResource("/telas/" +tela));
		try {
			AnchorPane telaView = (AnchorPane) loader.load();
			panelSecundario.setTop(telaView);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}    
}	

