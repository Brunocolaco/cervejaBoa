package dao.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Date;

import org.junit.Test;

import br.edu.unoesc.equipeA.dao.AvaliacaoDAO;
import br.edu.unoesc.equipeA.factory.DAOFactory;
import br.edu.unoesc.equipeA.model.Avaliacao;
import br.edu.unoesc.equipeA.model.Cerveja;

public class AvaliacaoDAOTest {

	@Test
	public void deveInserirAvaliacaoNova() {
		Avaliacao avaliacao = new Avaliacao();
		avaliacao.setDescricaoaval(
				"Cerveja boa daquelas de tomar na zona pagando 20 pila e ganhando um carinho das querida");
		avaliacao.setNota(10.0);
		avaliacao.setPreco(10.0);
		avaliacao.setData(new Date(2016 - 01 - 01));
		avaliacao.setCerveja(new Cerveja(1L));
		AvaliacaoDAO avaliacaoDAO = DAOFactory.get().avaliacaoDAO();
		avaliacaoDAO.inserir(avaliacao);
		assertNotNull(avaliacao.getCodigo());
		avaliacaoDAO.excluir(avaliacao.getCodigo());
	}

	public void deveAlterarAvaliacao() {
		Avaliacao avaliacao = new Avaliacao();
		avaliacao.setDescricaoaval(
				"Cerveja boa daquelas de tomar na zona pagando 20 pila e ganhando um carinho das querida");
		avaliacao.setNota(10.0);
		avaliacao.setPreco(10.0);
		avaliacao.setData(new Date(2016 - 01 - 01));
		avaliacao.setCerveja(new Cerveja(1L));
		AvaliacaoDAO avaliacaoDAO = DAOFactory.get().avaliacaoDAO();
		avaliacaoDAO.inserir(avaliacao);
		avaliacao.setDescricaoaval("Cerveja ruim e quente o diabo do garçom me trouxe quente ainda por cima");
		avaliacao.setNota(1.0);
		avaliacao.setPreco(10.0);
		avaliacao.setData(new Date(2017 - 01 - 01));
		avaliacao.setCerveja(new Cerveja(1L));
		avaliacaoDAO.alterar(avaliacao);
		Avaliacao avaliacaoBanco = avaliacaoDAO.get(avaliacao.getCodigo());
		assertEquals("Cerveja boa daquelas de tomar na zona pagando 20 pila e ganhando um carinho das querida",
				avaliacaoBanco.getDescricaoaval());
		assertEquals(new Long(10), avaliacaoBanco.getNota());
		assertEquals((Double) 10.0, avaliacaoBanco.getPreco());
		assertEquals(new Date(1969 - 12 - 31), avaliacaoBanco.getData());
		assertEquals(new Cerveja(1L), avaliacaoBanco.getCerveja());
	}

}