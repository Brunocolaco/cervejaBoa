package br.edu.unoesc.equipeA.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import br.edu.unoesc.equipeA.conexao.Conexao;
import br.edu.unoesc.equipeA.model.Avaliacao;
import br.edu.unoesc.equipeA.model.Cerveja;

public class AvaliacaoJDBC implements AvaliacaoDAO {

	private Conexao conexao;

	public AvaliacaoJDBC(Conexao conexao) {
		this.conexao = conexao;
	}

	@Override
	public void inserir(Avaliacao objeto) {

		String insert = "insert into Avaliacao (DescricaoAvaliacao, Nota, Preco, DataAvaliacao, idCerveja) values(?,?,?,?,?)";
		try {
			PreparedStatement ps = conexao.get().prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, objeto.getDescricaoaval());
			ps.setDouble(2, objeto.getNota());
			ps.setDouble(3, objeto.getPreco());
			ps.setDate(4, objeto.getData());
			ps.setLong(5, objeto.getCerveja().getCodigo());
			ps.executeUpdate();
			// Popular o objeto com o código gerado.
			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
			objeto.setCodigo(rs.getLong(1));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
	}

	@Override
	public void alterar(Avaliacao objeto) {
		String update = "update avaliacao set Descricao =?, AvaliacaoNota=?, Preco=?, DataAvaliacao=?, idCerveja=?"
				+ "where idAvaliacao = ?";
		try {
			PreparedStatement ps = conexao.get().prepareStatement(update);
			ps.setString(1, objeto.getDescricaoaval());
			ps.setDouble(2, objeto.getNota());
			ps.setDouble(3, objeto.getPreco());
			ps.setDate(4, objeto.getData());
			ps.setLong(5, objeto.getCerveja().getCodigo());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
	}

	@Override
	public void excluir(Long codigo) {
		String delete = "delete from avaliacao " + "where idAvaliacao = ?";
		try {
			PreparedStatement ps = conexao.get().prepareStatement(delete);
			ps.setLong(1, codigo);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
	}

	@Override
	public Collection<Avaliacao> todos() {
		String sql = "select * from Avaliacao";
		List<Avaliacao> avaliacoes = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			avaliacoes = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return avaliacoes;
	}

	@Override
	public Avaliacao get(Long codigo) {
		String sql = "select * from Avaliacao where idAvaliacao = ?";
		Avaliacao avaliacao = null;
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setLong(1, codigo);
			ResultSet rs = ps.executeQuery();
			// Passa por todos os registros que vieram do banco.
			while (rs.next()) {
				avaliacao = getAvaliacao(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return avaliacao;
	}

	@Override
	public Collection<Avaliacao> getMaiorNota(Long nota) {
		String sql = "select max(nota) from avaliacao";
		List<Avaliacao> copos = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setLong(1, nota);
			ResultSet rs = ps.executeQuery();
			copos = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return copos;
	}

	private List<Avaliacao> getLista(ResultSet rs) throws SQLException {
		List<Avaliacao> avaliacoes = new ArrayList<>();
		while (rs.next()) {
			avaliacoes.add(getAvaliacao(rs));
		}
		return avaliacoes;
	}

	private Avaliacao getAvaliacao(ResultSet rs) throws SQLException {
		Avaliacao avaliacao = new Avaliacao(rs.getLong("idAvaliacao"), rs.getString("DescricaoAvaliacao"),
				rs.getDouble("Nota"), rs.getDouble("Preco"), rs.getDate("DataAvaliacao"),
				new Cerveja(rs.getLong("idCerveja")));
		return avaliacao;
	}

	@Override
	public Collection<Avaliacao> getMenorNota(Long nota) {
		String sql = "select min(nota) from avaliacao;";
		List<Avaliacao> avaliacoes = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setLong(1, nota);
			ResultSet rs = ps.executeQuery();
			avaliacoes = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return avaliacoes;
	}

}
