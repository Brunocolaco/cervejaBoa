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
			estilo.setNomeEstilo("drinks");
			EstiloDAO copoDAO = DAOFactory.get().estiloDAO();
			copoDAO.inserir(estilo);
			assertNotNull(estilo.getCodigoEstilo());
			copoDAO.excluir(estilo.getCodigoEstilo());
		}

		@Test
		public void deveAlterarEstilo() {
			Estilo estilo = new Estilo();
			estilo.setNomeEstilo("Americano");
			EstiloDAO copoDAO = DAOFactory.get().estiloDAO();
			copoDAO.inserir(estilo);
			estilo.setNomeEstilo("Pilsner");
			copoDAO.alterar(estilo);
			Estilo copoBanco = copoDAO.get(estilo.getCodigoEstilo());
			assertEquals("Pilsner", copoBanco.getNomeEstilo());
			copoDAO.excluir(copoBanco.getCodigoEstilo());
		}

		
	}

	

