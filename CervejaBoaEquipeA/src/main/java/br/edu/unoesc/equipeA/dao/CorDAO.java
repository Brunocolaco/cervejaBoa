package br.edu.unoesc.equipeA.dao;

import java.util.Collection;
import br.edu.unoesc.equipeA.model.Cor;

public interface CorDAO extends CrudDAO<Cor> {
	
	Collection<Cor> getPorNome(String nome);

}
