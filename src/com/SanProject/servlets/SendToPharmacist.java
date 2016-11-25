package com.SanProject.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendToPharmacist
 */
@WebServlet("/SendToPharmacist")
public class SendToPharmacist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendToPharmacist() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String diagnosis = request.getParameter("diagnosis");
		String prescription = request.getParameter("prescription");
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Stude",
					"root", " ");
			System.out.println("Connected successfully to DB");
			PreparedStatement state = conn
					.prepareStatement("insert into DoctorToPharmacist values(?,?)");
			state.setString(1, diagnosis);
			state.setString(2, prescription);
			state.executeUpdate();
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("History.jsp");
			dispatcher.forward(request, response);
			out.println("Registered Successfully");

		} catch (SQLException | ClassNotFoundException e) {
			out.println("SQLException :" + e.getMessage());
		}

	}

}