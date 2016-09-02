package br.edu.unoesc.equipeA.dao;

import java.util.Collection;

import br.edu.unoesc.equipeA.model.Copo;

public interface CopoDAO extends CrudDAO<Copo> {

	Collection<Copo> getPorNome(String nome);
}
