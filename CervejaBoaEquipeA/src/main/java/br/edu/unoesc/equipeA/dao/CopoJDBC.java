package br.edu.unoesc.equipeA.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import br.edu.unoesc.equipeA.conexao.Conexao;
import br.edu.unoesc.equipeA.model.Copo;

public class CopoJDBC implements CopoDAO {

	private Conexao conexao;

	/**
	 * Conexão com o banco de dados.
	 * 
	 * @param conexao.get()
	 */
	public CopoJDBC(Conexao conexao) {
		this.conexao = conexao;
	}

	@Override
	public void inserir(Copo objeto) {
		String insert = "insert into copo (TipoCopo) values(?)";
		try {
			PreparedStatement ps = conexao.get().prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, objeto.getNome());
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
	public void alterar(Copo objeto) {
		String update = "update copo set TipoCopo=? " + "where idCopo = ?";
		try {
			PreparedStatement ps = conexao.get().prepareStatement(update);
			ps.setString(1, objeto.getNome());
			ps.setLong(2, objeto.getCodigo());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}

	}

	@Override
	public void excluir(Long codigo) {
		String delete = "delete from copo " + "where idCopo = ?";
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
	public Collection<Copo> todos() {
		String sql = "select * from Copo";
		List<Copo> copos = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			copos = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return copos;
	}

	@Override
	public Copo get(Long codigo) {
		String sql = "select * from Copo where idCopo = ?";
		Copo copo = null;
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setLong(1, codigo);
			ResultSet rs = ps.executeQuery();
			// Passa por todos os registros que vieram do banco.
			while (rs.next()) {
				copo = getCopo(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return copo;
	}

	@Override
	public Collection<Copo> getPorNome(String nome) {
		String sql = "select * from Copo where TipoCopo = ?";
		List<Copo> copos = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setString(1, nome);
			ResultSet rs = ps.executeQuery();
			copos = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return copos;
	}

	private List<Copo> getLista(ResultSet rs) throws SQLException {
		List<Copo> copos = new ArrayList<>();
		while (rs.next()) {
			copos.add(getCopo(rs));
		}
		return copos;
	}

	private Copo getCopo(ResultSet rs) throws SQLException {
		Copo copo = new Copo(rs.getLong("idCopo"), rs.getString("TipoCopo"));
		return copo;
	}

}
