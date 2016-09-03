package dao.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

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
		CopoDAO copoDAO = DAOFactory.get().copoDAO();
		copoDAO.inserir(copo);
		assertNotNull(copo.getCodigo());
		copoDAO.excluir(copo.getCodigo());
	}

	@Test
	public void deveAlterarCopo() {
		Copo copo = new Copo();
		copo.setNome("Americano");
		CopoDAO copoDAO = DAOFactory.get().copoDAO();
		copoDAO.inserir(copo);
		copo.setNome("Pilsner");
		copoDAO.alterar(copo);
		Copo copoBanco = copoDAO.get(copo.getCodigo());
		assertEquals("Pilsner", copoBanco.getNome());
		copoDAO.excluir(copoBanco.getCodigo());
	}

	@Test
	public void deveListaCopoPorNome() {
		Copo copo = new Copo();
		copo.setNome("Groenjo");
		CopoDAO copoDAO = DAOFactory.get().copoDAO();
		copoDAO.inserir(copo);
		Collection<Copo> copos = copoDAO.getPorNome("Groenjo");
		assertEquals(1, copos.size());
		copoDAO.excluir(copo.getCodigo());
	}

}
