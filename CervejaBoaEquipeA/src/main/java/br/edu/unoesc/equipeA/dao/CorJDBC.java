package br.edu.unoesc.equipeA.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import br.edu.unoesc.equipeA.conexao.Conexao;
import br.edu.unoesc.equipeA.model.Cor;

public class CorJDBC implements CorDAO {
	
	private Conexao conexao;
	
	/**
	 * Conexão com o banco de dados.
	 * 
	 * @param conexao.get()
	 */
	public CorJDBC(Conexao conexao) {
		this.conexao = conexao;
	}
	
	@Override
	public void inserir(Cor objeto) {
		String insert = "insert into cor (NomeCor) values(?)";
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
	public void alterar(Cor objeto) {
		String update = "update cor set NomeCor=? " + "where idCor = ?";
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
		String delete = "delete from cor " + "where idCor = ?";
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
	public Collection<Cor> todos() {
		String sql = "select * from Cor";
		List<Cor> cores = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			cores = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return cores;
	} 
	
	@Override
	public Cor get(Long codigo) {
		String sql = "select * from Cor where idCor = ?";
		Cor cor = null;
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setLong(1, codigo);
			ResultSet rs = ps.executeQuery();
			// Passa por todos os registros que vieram do banco.
			while (rs.next()) {
				cor = getCor(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return cor;
	}
	
	@Override
	public Collection<Cor> getPorNome(String nome) {
		String sql = "select * from Cor where NomeCor = ?";
		List<Cor> cores = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setString(1, nome);
			ResultSet rs = ps.executeQuery();
			cores = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return cores;
	}
	
	private List<Cor> getLista(ResultSet rs) throws SQLException {
		List<Cor> cores = new ArrayList<>();
		while (rs.next()) {
			cores.add(getCor(rs));
		}
		return cores;
	}
	
	private Cor getCor(ResultSet rs) throws SQLException {
		Cor cor = new Cor(rs.getLong("idCor"), rs.getString("NomeCor"));
		return cor;
	}
}
