package br.edu.unoesc.equipeA.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import br.edu.unoesc.equipeA.conexao.Conexao;

import br.edu.unoesc.equipeA.model.Estilo;

public class EstiloJDBC implements EstiloDAO {

	
	
	private Conexao conexao;

	/**
	 * Conexão com o banco de dados.
	 * 
	 * @param conexao.get()
	 */
	public EstiloJDBC(Conexao conexao) {
		this.conexao = conexao;
	}

	@Override
	public void inserir(Estilo objeto) {
		String insert = "insert into estilo (nome) values(?)";
		try {
			PreparedStatement ps = conexao.get().prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, objeto.getNomeEstilo());
			ps.executeUpdate();
			// Popular o objeto com o código gerado.
			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
			objeto.setCodigoEstilo(rs.getLong(1));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
	}

	@Override
	public void alterar(Estilo objeto) {
		String update = "update estilo set Nome=? " + "where idEstilo = ?";
		try {
			PreparedStatement ps = conexao.get().prepareStatement(update);
			ps.setString(1, objeto.getNomeEstilo());
			ps.setLong(2, objeto.getCodigoEstilo());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}

	}

	@Override
	public void excluir(Long codigo) {
		String delete = "delete from estilo " + "where idEstilo = ?";
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
	public Collection<Estilo> todos() {
		String sql = "select * from estilo";
		List<Estilo> estilo = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			estilo = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return estilo;
	}

	@Override
	public Estilo get(Long codigo) {
		String sql = "select * from estilo where idEstilo = ?";
		Estilo estilo = null;
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setLong(1, codigo);
			ResultSet rs = ps.executeQuery();
			// Passa por todos os registros que vieram do banco.
			while (rs.next()) {
				estilo = getEstilo(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return estilo;
	}

	

	private List<Estilo> getLista(ResultSet rs) throws SQLException {
		List<Estilo> estilos = new ArrayList<>();
		while (rs.next()) {
			estilos.add(getEstilo(rs));
		}
		return estilos;
	}

	private Estilo getEstilo(ResultSet rs) throws SQLException {
		Estilo estilo = new Estilo(rs.getLong("idEstilo"), rs.getString("Nome"));
		return estilo;
	}

}

