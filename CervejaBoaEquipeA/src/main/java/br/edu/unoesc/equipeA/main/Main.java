package br.edu.unoesc.equipeA.main;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class Main extends Application {

	public final static String PATH_VIEW = "../view/";

	@Override
	public void start(Stage primaryStage) {
		try {
			AnchorPane root = (AnchorPane) FXMLLoader.load(getClass().getResource(PATH_VIEW + "login.fxml"));
			Scene scene = new Scene(root);
			scene.getStylesheets().add("/css/style.css");
			primaryStage.getIcons().add(new Image("/icon/beer-icon.png"));
			primaryStage.setTitle("Cerveja Boa - Equipe A");
			primaryStage.setScene(scene);
			primaryStage.show();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		launch(args);
	}

}
