package com.SanProject.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		String first_name, last_name, faculty, department, doctor, gender,regNumber;
		first_name = request.getParameter("firstName").toString();
		last_name = request.getParameter("lastName").toString();
		faculty = request.getParameter("faculty").toString();
		department = request.getParameter("department").toString();
		doctor = request.getParameter("doctor").toString();
		gender = request.getParameter("gender").toString();
		regNumber = request.getParameter("regNumber").toString();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Stude", "root", " ");
			out.print("Success");
			Statement sqlState = conn.createStatement();
			String queryStatement = "insert into StudeDetails values('"+regNumber+"','"+first_name+"','"+last_name+"','"+gender+"','"+faculty+"','"+department+"','"+doctor+"')";
			sqlState.executeUpdate(queryStatement);
//			response.sendRedirect("Register.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("Register.jsp");
			dispatcher.forward(request, response);
			System.out.println("Registered Successfully");
			
			
		} catch (SQLException | ClassNotFoundException e) {
			out.println("SQLException:"+e.getMessage());
		}
		
		
	}

}
