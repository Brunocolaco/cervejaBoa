package dao.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.junit.Test;

import br.edu.unoesc.equipeA.dao.CervejaDAO;
import br.edu.unoesc.equipeA.factory.DAOFactory;
import br.edu.unoesc.equipeA.model.Cerveja;
import br.edu.unoesc.equipeA.model.Copo;
import br.edu.unoesc.equipeA.model.Cor;
import br.edu.unoesc.equipeA.model.Estilo;
import br.edu.unoesc.equipeA.model.Nacionalidade;

public class CervejaDAOTest {

	@Test
	public void deveInserirCervejaNova() {
		Cerveja cerveja = new Cerveja();
		cerveja.setNome("Heineken");
		cerveja.setDescricao("Forte e deixa bem louco");
		cerveja.setTeoralc(12.0);
		cerveja.setTemperatura(6.0);
		cerveja.setPropmalte(8.0);
		cerveja.setPreco(6.0);
		cerveja.setCopo(new Copo(1L));
		cerveja.setCor(new Cor(1L));
		cerveja.setNacionalidade(new Nacionalidade(1L));
		cerveja.setEstilo(new Estilo(1L));

		try {
			byte[] imagem = Files.readAllBytes(Paths.get(
					new URI("file:///C:/Users/Bruno/Desktop/Faculdade/TrabalhoCerveja/Tipos_Copo/Copo_Calice.jpg")));
			cerveja.setImagem(imagem);
		} catch (IOException | URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		CervejaDAO cervejaDAO = DAOFactory.get().cervejaDAO();
		cervejaDAO.inserir(cerveja);
		assertNotNull(cerveja.getCodigo());
		cervejaDAO.excluir(cerveja.getCodigo());

	}

	@Test
	public void deveAlterarCerveja() {
		Cerveja cerveja = new Cerveja();
		cerveja.setNome("Heineken");
		cerveja.setDescricao("Forte e deixa bem louco");
		cerveja.setTeoralc(12.0);
		cerveja.setTemperatura(-6.0);
		cerveja.setPropmalte(8.0);
		cerveja.setPreco(6.0);
		cerveja.setCopo(new Copo(1L));
		cerveja.setCor(new Cor(1L));
		cerveja.setNacionalidade(new Nacionalidade(1L));
		cerveja.setEstilo(new Estilo(1L));
		CervejaDAO cervejaDAO = DAOFactory.get().cervejaDAO();
		cervejaDAO.inserir(cerveja);
		cerveja.setNome("Hasaki");
		cerveja.setDescricao("Forte e deixa bem louco");
		cerveja.setTeoralc(12.0);
		cerveja.setTemperatura(6.0);
		cerveja.setPropmalte(8.0);
		cerveja.setPreco(6.0);
		cerveja.setCopo(new Copo(1L));
		cerveja.setCor(new Cor(1L));
		cerveja.setNacionalidade(new Nacionalidade(1L));
		cerveja.setEstilo(new Estilo(1L));
		cervejaDAO.alterar(cerveja);
		Cerveja cervejaBanco = cervejaDAO.get(cerveja.getCodigo());
		assertEquals("Hasaki", cervejaBanco.getNome());
		assertEquals("Forte e deixa bem louco", cervejaBanco.getDescricao());
		assertEquals((Double) 12.0, cervejaBanco.getTeoralc());
		assertEquals((Double) 0.0, cervejaBanco.getTemperatura());
		assertEquals((Double) 8.0, cervejaBanco.getPropmalte());
		assertEquals((Double) 6.0, cervejaBanco.getPreco());
		assertEquals(new Copo(1L), cervejaBanco.getCopo());
		assertEquals(new Cor(1L), cervejaBanco.getCor());
		assertEquals(new Nacionalidade(1L), cervejaBanco.getNacionalidade());
		assertEquals(new Estilo(1L), cervejaBanco.getEstilo());
	}

}
