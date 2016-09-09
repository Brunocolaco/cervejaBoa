package br.edu.unoesc.equipeA.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import br.edu.unoesc.equipeA.conexao.Conexao;
import br.edu.unoesc.equipeA.model.Nacionalidade;

public class NacionalidadeJDBC implements NacionalidadeDAO {
	
	private Conexao conexao;
	
	public NacionalidadeJDBC(Conexao conexao) {
		this.conexao = conexao;
	}
	
	@Override
	public void inserir(Nacionalidade objeto) {
		String insert = "insert into nacionalidade (NomePais) values(?)";
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
	public void alterar(Nacionalidade objeto) {
		String update = "update nacionalidade set NomePais=? where idNacionalidade=?";
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
		String delete = "delete from nacionalidade where idNacionalidade=?";
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
	public Collection<Nacionalidade> todos() {
		String sql = "select * from nacionalidade";
		List<Nacionalidade> nacionalidades = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			nacionalidades = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return nacionalidades;
	} 
	
	@Override
	public Nacionalidade get(Long codigo) {
		String sql = "select * from nacionalidade where idNacionalidade=?";
		Nacionalidade nacionalidade = null;
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setLong(1, codigo);
			ResultSet rs = ps.executeQuery();
			// Passa por todos os registros que vieram do banco.
			while (rs.next()) {
				nacionalidade = getNacionalidade(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return nacionalidade;
	}
	
	@Override
	public Collection<Nacionalidade> getPorNome(String nome) {
		String sql = "select * from nacionalidade where NomePais=?";
		List<Nacionalidade> nacionalidades = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setString(1, nome);
			ResultSet rs = ps.executeQuery();
			nacionalidades = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return nacionalidades;
	}
	
	private List<Nacionalidade> getLista(ResultSet rs) throws SQLException {
		List<Nacionalidade> nacionalidades = new ArrayList<>();
		while (rs.next()) {
			nacionalidades.add(getNacionalidade(rs));
		}
		return nacionalidades;
	}
	
	private Nacionalidade getNacionalidade(ResultSet rs) throws SQLException {
		Nacionalidade nacionalidade = new Nacionalidade(rs.getLong("idNacionalidade"), rs.getString("NomePais"));
		return nacionalidade;
	}

}
