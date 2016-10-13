package br.edu.unoesc.equipeA.factory;

import br.edu.unoesc.equipeA.conexao.ConexaoMysqlProducao;
import br.edu.unoesc.equipeA.dao.AvaliacaoDAO;
import br.edu.unoesc.equipeA.dao.AvaliacaoJDBC;
import br.edu.unoesc.equipeA.dao.CervejaDAO;
import br.edu.unoesc.equipeA.dao.CervejaJBDC;
import br.edu.unoesc.equipeA.dao.CopoDAO;
import br.edu.unoesc.equipeA.dao.CopoJDBC;
import br.edu.unoesc.equipeA.dao.CorDAO;
import br.edu.unoesc.equipeA.dao.CorJDBC;
import br.edu.unoesc.equipeA.dao.EstiloDAO;
import br.edu.unoesc.equipeA.dao.EstiloJDBC;
import br.edu.unoesc.equipeA.dao.NacionalidadeDAO;
import br.edu.unoesc.equipeA.dao.NacionalidadeJDBC;
import br.edu.unoesc.equipeA.dao.UsuarioDAO;
import br.edu.unoesc.equipeA.dao.UsuarioJDBC;

public class DAOFactory {

	private static DAOFactory factory;

	/**
	 * Pega a fabrica de DAO, instância única para todo mundo. Padrão
	 * Singleton simples.
	 * 
	 * @return
	 */
	public static DAOFactory get() {
		if (factory == null) {
			factory = new DAOFactory();
		}
		return factory;
	}

	public CopoDAO copoDAO() {
		return new CopoJDBC(new ConexaoMysqlProducao());
	}

	public CorDAO corDAO() {
		return new CorJDBC(new ConexaoMysqlProducao());
	}

	public EstiloDAO estiloDAO() {
		return new EstiloJDBC(new ConexaoMysqlProducao());
	}

	public NacionalidadeDAO nacionalidadeDAO() {
		return new NacionalidadeJDBC(new ConexaoMysqlProducao());
	}

	public CervejaDAO cervejaDAO() {
		return new CervejaJBDC(new ConexaoMysqlProducao());
	}

	public AvaliacaoDAO avaliacaoDAO() {
		return new AvaliacaoJDBC(new ConexaoMysqlProducao());
	}

	public UsuarioDAO usuarioDAO() {
		return new UsuarioJDBC(new ConexaoMysqlProducao());
	}
}
