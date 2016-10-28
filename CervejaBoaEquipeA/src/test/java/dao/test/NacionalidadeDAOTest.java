package dao.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.Collection;

import org.junit.Test;

import br.edu.unoesc.equipeA.dao.NacionalidadeDAO;
import br.edu.unoesc.equipeA.factory.DAOFactory;
import br.edu.unoesc.equipeA.model.Nacionalidade;

public class NacionalidadeDAOTest {

	@Test
	public void deveInserirNacionalidadeNovo() {
		Nacionalidade nacionalidade = new Nacionalidade();
		nacionalidade.setNome("Brasileiro");
		NacionalidadeDAO nacionalidadeDAO = DAOFactory.get().nacionalidadeDAO();
		nacionalidadeDAO.inserir(nacionalidade);
		assertNotNull(nacionalidade.getCodigo());
		nacionalidadeDAO.excluir(nacionalidade.getCodigo());
	}

	@Test
	public void deveAlterarNacionalidade() {
		Nacionalidade nacionalidade = new Nacionalidade();
		nacionalidade.setNome("Americano");
		NacionalidadeDAO nacionalidadeDAO = DAOFactory.get().nacionalidadeDAO();
		nacionalidadeDAO.inserir(nacionalidade);
		nacionalidade.setNome("Africano");
		nacionalidadeDAO.alterar(nacionalidade);
		Nacionalidade nacionalidadeBanco = nacionalidadeDAO.get(nacionalidade.getCodigo());
		assertEquals("Africano", nacionalidadeBanco.getNome());
		nacionalidadeDAO.excluir(nacionalidadeBanco.getCodigo());
	}

	@Test
	public void deveListaNacionalidadePorNome() {
		Nacionalidade nacionalidade = new Nacionalidade();
		nacionalidade.setNome("Outra nacionalidade");
		NacionalidadeDAO nacionalidadeDAO = DAOFactory.get().nacionalidadeDAO();
		nacionalidadeDAO.inserir(nacionalidade);
		Collection<Nacionalidade> nacionalidades = nacionalidadeDAO.getPorNome("Outra nacionalidade");
		assertEquals(1, nacionalidades.size());
		nacionalidadeDAO.excluir(nacionalidade.getCodigo());
	}

}
