package br.com.voxus.dao;
import java.util.ArrayList;
import java.util.List;

import br.com.voxus.beans.Tasks;

public class TasksDAO {
	
	static List<Tasks> lstTasks = new ArrayList<>();
	
	public String cadastrar(String nome, String descricao, int prioridade, String usuario) {
		Tasks tasks = new Tasks();
		tasks.setCodigo(lstTasks.size()+1);
		tasks.setNome(nome);
		tasks.setDescricao(descricao);
		tasks.setPrioridade(prioridade);
		tasks.setStatus(true);
		tasks.setUsuario(usuario);
		tasks.setDone(false);
		lstTasks.add(tasks);
		return "Cadastrado com sucesso!";
	}
	
	public String alterar(String nome, String descricao, int prioridade, String usuario, boolean done) {
		String msg = "";
		for(Tasks t : lstTasks) {
			if(t.getNome() == nome)
			{
				t.setNome(nome);
				t.setDescricao(descricao);
				t.setPrioridade(prioridade);
				t.setStatus(false);
				t.setUsuario(usuario);
				t.setDone(false);
				msg = "Alterado com sucesso!";
			} else {
				msg = "Task não encontrada!;";
			}
		}
		return msg;
	}
	
	public String remover(String nome) {
		String msg = "";
		for(Tasks t : lstTasks) {
			if(t.getNome() == nome)
			{
				t.setStatus(false);
				msg = "Removido com sucesso!";
			} else {
				msg = "Task não encontrada!;";
			}
		}
		return msg;
	}
	
	public String retituir(String nome) {
		String msg = "";
		for(Tasks t : lstTasks) {
			if(t.getNome() == nome)
			{
				t.setStatus(true);
				msg = "Restituido com sucesso!"; 
			} else {
				msg = "Task não encontrada!;";
			}
		}
		return msg;
	}
	
	public Tasks listarPorNome(String nome) {
		Tasks tasks = new Tasks();
		String msg = "";
		for(Tasks t : lstTasks) {
			if(nome == t.getNome())
			{
				t.getCodigo();
				t.getNome();
				t.getDescricao();
				t.getPrioridade();
				t.getUsuario();
				t.isDone();
				t.isStatus();
			}
		}
		return tasks;
	}
	
	public List<Tasks> listarPorUsuario(String usuario) {
		List<Tasks> busca = null;
		for(Tasks t : lstTasks) {
			while(t.getUsuario() == usuario)
			{
				busca = new ArrayList<>();
				t.getCodigo();
				t.getNome();
				t.getDescricao();
				t.getPrioridade();
				t.getUsuario();
				t.isDone();
				t.isStatus();
				busca.add(t);
			}
		}
		return busca;
	}
}
