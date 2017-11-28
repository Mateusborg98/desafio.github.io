package br.com.voxus.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.voxus.beans.Tasks;
import br.com.voxus.bo.TasksBO;


@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		String retorno = "";
		
		switch (acao) {
		case "cadastrar":
			cadastrar(request);
			retorno = "view.jsp";
			break;
			
		case "alterar":
			alterar(request);
			retorno = "view.jsp";
			break;
		
		case "enviandoAlt":
			alterar(request);
			retorno = "update.jsp";
			break;
			
		case "remover":
			remover(request);
			retorno = "view.jsp";
		break;
		
		case "listarPorNome":
			listarPorNome(request);
			retorno = "viewName.jsp";
		break;
		
		case "listarPorUser":
			listarPorUser(request);
			retorno = "viewUser.jsp";
		break;
		
		case "login":
			try {
				login(request);
				retorno = "create.jsp";
			}catch (Exception e) {
				request.setAttribute("msg", "Usuário não cadastrado!");
				retorno = "index.jsp";
			}
			
		default:
			break;
		}
		
		request.getRequestDispatcher(retorno).forward(request, response);
	}

	private void login(HttpServletRequest request) {
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		if (nome.equals("root") && email.equals("admin@user.com") && senha.equalsIgnoreCase("root123")) {
			request.setAttribute("nome", nome);
		}
	}

	private void listarPorUser(HttpServletRequest request) {
		String usuario = request.getParameter("usuario");
		List<Tasks> tasks = TasksBO.listarPorUsuario(usuario);
		request.setAttribute("tasks", tasks);
	}

	private void listarPorNome(HttpServletRequest request) {
		String nome = request.getParameter("nome");
		Tasks tasks = TasksBO.listarPorNome(nome);
		request.setAttribute("tasks", tasks);
	}

	private void remover(HttpServletRequest request) {
		String nome = request.getParameter("nome");
		boolean status = Boolean.parseBoolean(request.getParameter("status"));
		status = false;
		String tasks = TasksBO.remover(nome);
		request.setAttribute("tasks", tasks);
	}

	private void alterar(HttpServletRequest request) {
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		int prioridade = Integer.parseInt(request.getParameter("prioridade"));
		String usuario = request.getParameter("usuario");
		String done = request.getParameter("done");
		TasksBO.listarPorNome(nome);
		Tasks tasks = null;
		if(done.equalsIgnoreCase("done")) {
			tasks = new Tasks(nome, descricao, prioridade, usuario, true, true);
		}else {
			tasks = new Tasks(nome, descricao, prioridade, usuario, false, true);
		}
		
		String 	x = TasksBO.alterar(nome, descricao, prioridade, usuario, true);
		request.setAttribute("tasks", tasks);
		request.setAttribute("msg", x);
	}

	private void cadastrar(HttpServletRequest request) {
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		int prioridade = Integer.parseInt(request.getParameter("prioridade"));
		String usuario = request.getParameter("usuario");
		Tasks tasks = new Tasks(nome, descricao, prioridade, usuario, false, true);
		String x = TasksBO.cadastrar(nome, descricao, prioridade, usuario);
		request.setAttribute("tasks", tasks);
		request.setAttribute("msg", x);
	}
}
