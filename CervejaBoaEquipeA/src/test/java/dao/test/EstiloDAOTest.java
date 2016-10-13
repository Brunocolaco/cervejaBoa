package dao.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import br.edu.unoesc.equipeA.dao.EstiloDAO;
import br.edu.unoesc.equipeA.factory.DAOFactory;
import br.edu.unoesc.equipeA.model.Estilo;

public class EstiloDAOTest {

	@Test
	public void deveInserirNovoEstilo() {
		Estilo estilo = new Estilo();
		estilo.setNome("drinks");
		EstiloDAO copoDAO = DAOFactory.get().estiloDAO();
		copoDAO.inserir(estilo);
		assertNotNull(estilo.getCodigo());
		copoDAO.excluir(estilo.getCodigo());
	}

	@Test
	public void deveAlterarEstilo() {
		Estilo estilo = new Estilo();
		estilo.setNome("Americano");
		EstiloDAO copoDAO = DAOFactory.get().estiloDAO();
		copoDAO.inserir(estilo);
		estilo.setNome("Pilsner");
		copoDAO.alterar(estilo);
		Estilo copoBanco = copoDAO.get(estilo.getCodigo());
		assertEquals("Pilsner", copoBanco.getNome());
		copoDAO.excluir(copoBanco.getCodigo());
	}

}
