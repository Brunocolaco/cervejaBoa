package br.edu.unoesc.equipeA.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import br.edu.unoesc.equipeA.conexao.Conexao;
import br.edu.unoesc.equipeA.model.Usuario;

public class UsuarioJDBC implements UsuarioDAO {

	private Conexao conexao;

	public UsuarioJDBC(Conexao conexao) {
		this.conexao = conexao;
	}

	@Override
	public void inserir(Usuario objeto) {
		String insert = "insert into Usuario (Nome, Login, Senha, Email) values(?,?,?,?)";
		try {
			PreparedStatement ps = conexao.get().prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, objeto.getNome());
			ps.setString(2, objeto.getLogin());
			ps.setString(3, objeto.getSenha());
			ps.setString(4, objeto.getEmail());
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
	public void alterar(Usuario objeto) {
		String update = "update usuario set nome=?, login=? senha=?, email=? " + "where idUsuario = ?";
		try {
			PreparedStatement ps = conexao.get().prepareStatement(update);
			ps.setString(1, objeto.getNome());
			ps.setString(2, objeto.getLogin());
			ps.setString(3, objeto.getSenha());
			ps.setString(4, objeto.getEmail());
			ps.setLong(5, objeto.getCodigo());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}

	}

	@Override
	public void excluir(Long codigo) {
		String delete = "delete from usuario " + "where idUsuario = ?";
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
	public Collection<Usuario> todos() {
		String sql = "select * from Usuario";
		List<Usuario> usuarios = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			usuarios = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return usuarios;
	}

	private List<Usuario> getLista(ResultSet rs) throws SQLException {
		List<Usuario> usuarios = new ArrayList<>();
		while (rs.next()) {
			usuarios.add(getUsuario(rs));
		}
		return usuarios;
	}

	@Override
	public Usuario get(Long codigo) {
		String sql = "select * from Usuario where idUsuario = ?";
		Usuario usuario = null;
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setLong(1, codigo);
			ResultSet rs = ps.executeQuery();
			// Passa por todos os registros que vieram do banco.
			while (rs.next()) {
				usuario = getUsuario(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return usuario;
	}

	private Usuario getUsuario(ResultSet rs) throws SQLException {
		Usuario usuario = new Usuario(rs.getLong("idUsuario"), rs.getString("Nome"), rs.getString("Login"),
				rs.getString("Senha"), rs.getString("Email"));
		return usuario;
	}

}
