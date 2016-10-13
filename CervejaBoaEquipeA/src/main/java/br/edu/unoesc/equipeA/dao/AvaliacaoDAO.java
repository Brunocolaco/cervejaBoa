package br.edu.unoesc.equipeA.dao;

import java.util.Collection;

import br.edu.unoesc.equipeA.model.Avaliacao;

public interface AvaliacaoDAO extends CrudDAO<Avaliacao> {

	Collection<Avaliacao> getMaiorNota(Long nota);

	Collection<Avaliacao> getMenorNota(Long nota);
}
