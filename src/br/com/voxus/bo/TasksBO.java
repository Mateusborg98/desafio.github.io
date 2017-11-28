package br.com.voxus.bo;
import java.util.List;
import br.com.voxus.beans.Tasks;
import br.com.voxus.dao.TasksDAO;

public class TasksBO {
	static TasksDAO dao = null;
	
	public static String cadastrar(String nome, String descricao, int prioridade, String usuario) {
		dao = new TasksDAO();
		return  dao.cadastrar(nome, descricao, prioridade, usuario);
	}
	
	public static String alterar(String nome, String descricao, int prioridade, String usuario, boolean done) {
		dao = new TasksDAO();
		return dao.alterar(nome, descricao, prioridade, usuario, done);
	}
	
	public static String remover(String nome) {
		dao = new TasksDAO();
		return dao.remover(nome);
	}
	
	public static String retituir(String nome) {
		dao = new TasksDAO();
		return dao.retituir(nome);
	}
	
	public static Tasks listarPorNome(String nome){
		dao = new TasksDAO();
		return dao.listarPorNome(nome);
	}
	
	public static List<Tasks> listarPorUsuario(String usuario){
		dao = new TasksDAO();
		return dao.listarPorUsuario(usuario);
	}
}
