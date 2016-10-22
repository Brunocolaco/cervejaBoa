package dao.test;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import br.edu.unoesc.equipeA.dao.UsuarioDAO;
import br.edu.unoesc.equipeA.factory.DAOFactory;
import br.edu.unoesc.equipeA.model.Usuario;

public class UsuarioDAOTest {

	@Test
	public void deveInserirUsuarioNovo() {
		Usuario usuario = new Usuario();
		usuario.setNome("Juca");
		usuario.setLogin("Bebidemais");
		usuario.setSenha("1245");
		UsuarioDAO usuarioDAO = DAOFactory.get().usuarioDAO();
		usuarioDAO.inserir(usuario);
		assertNotNull(usuario.getCodigo());
		usuarioDAO.excluir(usuario.getCodigo());
	}

	@Test
	public void deveAlterarUsuario() {
		Usuario usuario = new Usuario();
		usuario.setNome("Juca");
		usuario.setLogin("Bebidemais");
		usuario.setSenha("1245");
		UsuarioDAO usuarioDAO = DAOFactory.get().usuarioDAO();
		usuarioDAO.inserir(usuario);
	}

}
