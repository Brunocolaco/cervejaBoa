package br.edu.unoesc.equipeA.dao;

import java.util.Collection;
import br.edu.unoesc.equipeA.model.Nacionalidade;

public interface NacionalidadeDAO extends CrudDAO<Nacionalidade> {
	
	Collection<Nacionalidade> getPorNome(String nome);
}
