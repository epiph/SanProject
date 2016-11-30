package com.SanProject.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddPatient
 */
@WebServlet("/AddPatient")
public class AddPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPatient() {
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
		String first_name, last_name, faculty, department, doctor, gender, regNumber;
		first_name = request.getParameter("firstName");
		last_name = request.getParameter("lastName");
		faculty = request.getParameter("faculty");
		department = request.getParameter("department");
		doctor = request.getParameter("doctor");
		gender = request.getParameter("gender");
		regNumber = request.getParameter("regNumber");
		Calendar calendar = Calendar.getInstance();
		java.sql.Timestamp time = new java.sql.Timestamp(calendar.getTime()
				.getTime());

		Connection conn = null;
		try {
			// HttpSession session = request.getSession(false);
			Cookie[] cookie = request.getCookies();

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Stude",
					"root", " ");
			out.print("Connected to DB Successfully \n");
			PreparedStatement state = conn
					.prepareStatement("insert into ReceptionistQueue values(?,?,?,?,?,?)");
			state.setString(1, regNumber);
			state.setString(2, first_name);
			state.setString(3, last_name);
			state.setString(4, gender);
			state.setString(5, doctor);
			state.setTimestamp(6, time);
			state.executeUpdate();
			// response.sendRedirect("AddPatient.jsp");
			if (cookie != null) {
				String name = cookie[0].getValue();
				if (!name.equals("") || name != null) {
					RequestDispatcher dispatcher = request
							.getRequestDispatcher("ReceptionistHome.jsp");
//					response.sendRedirect("ReceptionistHome.jsp");
					dispatcher.forward(request, response);
					out.println("Patient added Successfully");
					
				}
			} else {
				out.println("Login first");
				response.sendRedirect("index.jsp");
			}

		} catch (SQLException | ClassNotFoundException e) {
			out.println("SQLException:" + e.getMessage());
		}

	}

}
