package br.edu.unoesc.equipeA.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import br.edu.unoesc.equipeA.conexao.Conexao;
import br.edu.unoesc.equipeA.model.Cerveja;
import br.edu.unoesc.equipeA.model.Copo;
import br.edu.unoesc.equipeA.model.Cor;
import br.edu.unoesc.equipeA.model.Estilo;
import br.edu.unoesc.equipeA.model.Nacionalidade;

public class CervejaJBDC implements CervejaDAO {

	private Conexao conexao;

	public CervejaJBDC(Conexao conexao) {
		this.conexao = conexao;
	}

	@Override
	public void inserir(Cerveja objeto) {
		String insert = "insert into cerveja (Nome,DescricaoCerveja,TeorAlcoolico,ProporcaoodemaltedeCevada,Preco,Imagem,idcopo,idcor,idnacionalidade,idestilo) values(?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conexao.get().prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, objeto.getNome());
			ps.setString(2, objeto.getDescricao());
			ps.setDouble(3, objeto.getTeoralc());
			ps.setDouble(4, objeto.getPropmalte());
			ps.setDouble(5, objeto.getPreco());
			ps.setBytes(6, objeto.getImagem());
			ps.setLong(7, objeto.getCopo().getCodigo());
			ps.setLong(8, objeto.getCor().getCodigo());
			ps.setLong(9, objeto.getNacionalidade().getCodigo());
			ps.setLong(10, objeto.getEstilo().getCodigo());
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
	public void alterar(Cerveja objeto) {
		String update = "update cerveja set Nome = ?, DescricaoCerveja =?, TeorAlcoolico =?, ProporcaoodemaltedeCevada =? ,Preco =? ,Imagem = ?, idcopo=? ,idcor=? ,idnacionalidade=? ,idestilo=? "
				+ "where idCerveja = ?";
		try {
			PreparedStatement ps = conexao.get().prepareStatement(update);
			ps.setString(1, objeto.getNome());
			ps.setString(2, objeto.getDescricao());
			ps.setDouble(3, objeto.getTeoralc());
			ps.setDouble(4, objeto.getPropmalte());
			ps.setDouble(5, objeto.getPreco());
			ps.setBytes(6, objeto.getImagem());
			ps.setLong(7, objeto.getCopo().getCodigo());
			ps.setLong(8, objeto.getCor().getCodigo());
			ps.setLong(9, objeto.getNacionalidade().getCodigo());
			ps.setLong(10, objeto.getEstilo().getCodigo());
			ps.setLong(11, objeto.getCodigo());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}

	}

	@Override
	public void excluir(Long codigo) {
		String delete = "delete from cerveja " + "where idCerveja = ?";
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

	private Cerveja getCerveja(ResultSet rs) throws SQLException {
		Cerveja cerveja = new Cerveja(rs.getLong("idCerveja"), rs.getString("nome"), rs.getString("DescricaoCerveja"),
				rs.getDouble("TeorAlcolico"), rs.getDouble("TemperaturaIdeal"),
				rs.getDouble("ProporcaoodemaltedeCevada"), rs.getDouble("Preco"), rs.getBytes("Imagem"),
				new Copo(rs.getLong("idCopo")), new Cor(rs.getLong("idCor")),
				new Nacionalidade(rs.getLong("idNacionalidade")), new Estilo(rs.getLong("idEstilo")));
		return cerveja;
	}

	private List<Cerveja> getLista(ResultSet rs) throws SQLException {
		List<Cerveja> cervejas = new ArrayList<>();
		while (rs.next()) {
			cervejas.add(getCerveja(rs));
		}
		return cervejas;
	}

	@Override
	public Collection<Cerveja> todos() {
		String sql = "select * from Cerveja";
		List<Cerveja> cervejas = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			cervejas = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return cervejas;
	}

	@Override
	public Cerveja get(Long codigo) {
		String sql = "select * from Cerveja where idCerveja = ?";
		Cerveja cerveja = null;
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setLong(1, codigo);
			ResultSet rs = ps.executeQuery();
			// Passa por todos os registros que vieram do banco.
			while (rs.next()) {
				cerveja = getCerveja(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return cerveja;
	}

	@Override
	public Collection<Cerveja> getPorNome(String nome) {
		String sql = "select * from Cerveja where nome = ?";
		List<Cerveja> cervejas = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setString(1, nome);
			ResultSet rs = ps.executeQuery();
			cervejas = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return cervejas;
	}

	@Override
	public Collection<Cerveja> getPorEstilo(String nome) {
		String sql = "select * from cerveja join estilo on cerveja.idEstilo = estilo.idEstilo where estilo.Nome like '%%'";
		List<Cerveja> cervejas = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setString(1, nome);
			ResultSet rs = ps.executeQuery();
			cervejas = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return cervejas;
	}

	@Override
	public Collection<Cerveja> getPorCor(String nome) {
		String sql = "select * from cerveja join cor on cerveja.idCor = cor.idCor where cor.NomeCor like '%%';";
		List<Cerveja> cervejas = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setString(1, nome);
			ResultSet rs = ps.executeQuery();
			cervejas = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return cervejas;
	}

	@Override
	public Collection<Cerveja> getPorNacionalidade(String nome) {
		String sql = "select * from cerveja join nacionalidade on cerveja.idNacionalidade = nacionalidade.idNacionalidade where Nacionalidade.NomePais like '%%';";
		List<Cerveja> cervejas = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setString(1, nome);
			ResultSet rs = ps.executeQuery();
			cervejas = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return cervejas;
	}

	@Override
	public Collection<Cerveja> getPorCopo(String nome) {
		String sql = "select * from cerveja join copo on cerveja.idcopo = copo.idcopo where copo.tipocopo = ?";
		List<Cerveja> cervejas = new ArrayList<>();
		try {
			PreparedStatement ps = conexao.get().prepareStatement(sql);
			ps.setString(1, nome);
			ResultSet rs = ps.executeQuery();
			cervejas = getLista(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conexao.close();
		}
		return cervejas;
	}

}
