package dao.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collection;

import org.junit.Test;

import br.edu.unoesc.equipeA.dao.CopoDAO;
import br.edu.unoesc.equipeA.factory.DAOFactory;
import br.edu.unoesc.equipeA.model.Copo;

public class CopoDAOTest {

	@Test
	public void deveInserirCopoNovo() {
		Copo copo = new Copo();
		copo.setNome("Juca");
		try {
			byte[] imagem = Files.readAllBytes(Paths.get(
					new URI("file:///C:/Users/Bruno/Desktop/Faculdade/TrabalhoCerveja/Tipos_Copo/Copo_Calice.jpg")));
			copo.setTipocopo(imagem);
		} catch (IOException | URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		CopoDAO copoDAO = DAOFactory.get().copoDAO();
		copoDAO.inserir(copo);
		assertNotNull(copo.getCodigo());
		copoDAO.excluir(copo.getCodigo());
	}

	@Test
	public void deveAlterarCopo() {
		Copo copo = new Copo();
		copo.setNome("Caneca");
		CopoDAO copoDAO = DAOFactory.get().copoDAO();
		copoDAO.inserir(copo);
		copo.setNome("Canecao");
		copoDAO.alterar(copo);
		Copo copoBanco = copoDAO.get(copo.getCodigo());
		assertEquals("Canecao", copoBanco.getNome());
		copoDAO.excluir(copoBanco.getCodigo());
	}

	@Test
	public void deveListaCopoPorNome() {
		Copo copo = new Copo();
		copo.setNome("Groenjo");
		copo.setTipocopo(null);
		CopoDAO copoDAO = DAOFactory.get().copoDAO();
		copoDAO.inserir(copo);
		Collection<Copo> copos = copoDAO.getPorNome("Caneca");
		assertEquals(1, copos.size());
		copoDAO.excluir(copo.getCodigo());
	}

}
