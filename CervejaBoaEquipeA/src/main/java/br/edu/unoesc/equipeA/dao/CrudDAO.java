package br.edu.unoesc.equipeA.dao;

import java.util.Collection;

import br.edu.unoesc.equipeA.model.Entidade;

public interface CrudDAO<T extends Entidade> {

	void inserir(T objeto);

	void alterar(T objeto);

	void excluir(Long codigo);

	Collection<T> todos();

	T get(Long codigo);

	default void salvar(T objeto) {
		if (objeto.getCodigo() == null) {
			inserir(objeto);
		} else {
			alterar(objeto);
		}
	}
}
