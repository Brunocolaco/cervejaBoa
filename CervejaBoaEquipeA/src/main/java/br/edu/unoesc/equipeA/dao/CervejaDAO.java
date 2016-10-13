package br.edu.unoesc.equipeA.dao;

import java.util.Collection;

import br.edu.unoesc.equipeA.model.Cerveja;

public interface CervejaDAO extends CrudDAO<Cerveja> {

	Collection<Cerveja> getPorNome(String nome);

	Collection<Cerveja> getPorEstilo(String nome);

	Collection<Cerveja> getPorCor(String nome);

	Collection<Cerveja> getPorNacionalidade(String nome);

	Collection<Cerveja> getPorCopo(String nome);
}
