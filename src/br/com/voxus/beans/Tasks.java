package br.com.voxus.beans;

import java.io.Serializable;

public class Tasks implements Serializable, Comparable<Tasks> {

	private static final long serialVersionUID = 1L;
	private int codigo;
	private String nome;
	private String descricao;
	private int prioridade;
	private String usuario;
	private boolean done;
	private boolean status;

	public Tasks() {
		super();
	}
	
	public Tasks(String nome, String descricao, int prioridade, String usuario, boolean done, boolean status) {
		super();
		this.nome = nome;
		this.descricao = descricao;
		this.prioridade = prioridade;
		this.usuario = usuario;
		this.done = done;
		this.status = status;
	}

	public Tasks(int codigo, String nome, String descricao, int prioridade, String usuario, boolean done,
			boolean status) {
		super();
		this.codigo = codigo;
		this.nome = nome;
		this.descricao = descricao;
		this.prioridade = prioridade;
		this.usuario = usuario;
		this.done = done;
		this.status = status;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public int getPrioridade() {
		return prioridade;
	}

	public void setPrioridade(int prioridade) {
		this.prioridade = prioridade;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public boolean isDone() {
		return done;
	}

	public void setDone(boolean done) {
		this.done = done;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public int compareTo(Tasks outro) {
		if(getCodigo() < outro.getCodigo()) {
			return -1;
		} else if(getCodigo() > outro.getCodigo()) {
			return 1;
		} else {
			return 0;
		}
	}
}
