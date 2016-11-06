package com.SanProject.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Connection conn = null;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Stude", "root", " ");
			System.out.print("Success");
			PreparedStatement state = conn.prepareStatement("SELECT * FROM Users WHERE userName = ? AND passWord= ?");
			
			state.setString(1, username);
			state.setString(2, password);
			ResultSet rs = state.executeQuery();
			if(rs.next()){
				HttpSession session = request.getSession(true);
				session.setAttribute("Welcome", username);
//				response.sendRedirect("Register.jsp");
				RequestDispatcher dispatcher = request.getRequestDispatcher("Register.jsp");
				dispatcher.forward(request, response);
			}
			else{
				response.sendRedirect("index.jsp");
				out.println("Wrong username and password combo");
				
			}
		} catch (SQLException | ClassNotFoundException e) {
			out.println("SQLException:"+e.getMessage());
		}
	}

}
