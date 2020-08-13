package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.Board;
import model.InsertList;
import model.Login;
import model.Logout;
import model.SignUp;
import model.View;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String cmd = request.getRequestURI().substring(request.getContextPath().length()); 
		
		Action action = null;
		
		switch (cmd) {
		case "/login.do":
			action = new Login();
			break;
		case "/logout.do":
			action = new Logout();
			break;
		case "/board.do":
			action = new Board();
			break;
		case "/signUp.do":
			action = new SignUp();
			break;
		case "/insert.do":
			action = new InsertList();
			break;
		case "/view.do":
			action = new View();
			break;
		}
		String path = action.command(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
