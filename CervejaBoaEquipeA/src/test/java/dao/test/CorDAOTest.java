package dao.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import java.util.Collection;

import org.junit.Test;

import br.edu.unoesc.equipeA.dao.CorDAO;
import br.edu.unoesc.equipeA.factory.DAOFactory;
import br.edu.unoesc.equipeA.model.Cor;

public class CorDAOTest {
	
	@Test
	public void deveInserirCorNovo() {
		Cor cor = new Cor();
		cor.setNome("Azul");
		CorDAO corDAO = DAOFactory.get().corDAO();
		corDAO.inserir(cor);
		assertNotNull(cor.getCodigo());
		corDAO.excluir(cor.getCodigo());
	}
	
	@Test
	public void deveAlterarCor() {
		Cor cor = new Cor();
		cor.setNome("Verde");
		CorDAO corDAO = DAOFactory.get().corDAO();
		corDAO.inserir(cor);
		cor.setNome("Outra");
		corDAO.alterar(cor);
		Cor corBanco = corDAO.get(cor.getCodigo());
		assertEquals("Outra", corBanco.getNome());
		corDAO.excluir(corBanco.getCodigo());
	}
	
	@Test
	public void deveListaCorPorNome() {
		Cor cor = new Cor();
		cor.setNome("Corzinha");
		CorDAO corDAO = DAOFactory.get().corDAO();
		corDAO.inserir(cor);
		Collection<Cor> cores = corDAO.getPorNome("Corzinha");
		assertEquals(1, cores.size());
		corDAO.excluir(cor.getCodigo());
	}


}
