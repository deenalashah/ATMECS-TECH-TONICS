package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DatabaseConnection;

public class AddTalkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String topic = request.getParameter("topic");
		String date = request.getParameter("date");
		String venue = request.getParameter("venue");
		String presentor = request.getParameter("presentor");
		String description = request.getParameter("description");

		Connection connection = DatabaseConnection.getConnection();
		try {
			Statement stmt = connection.createStatement();

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
			java.util.Date date_new = formatter.parse(date);
			Date newDate = new Date(date_new.getTime());

			String insert_query = "insert into tech_talks(tech_topic,tech_date,presentor,venue,description)values(?,?,?,?,?)";
			PreparedStatement ps = connection.prepareStatement(insert_query);
			ps.setString(1, topic);
			ps.setDate(2, newDate);
			ps.setString(3, presentor);
			ps.setString(4, venue);
			ps.setString(5, description);
			int i = ps.executeUpdate();
			if (i == 1) {
				RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
				rd.forward(request, response);

				out.println("TechTalk Added Succesfully");

			} else {
				RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
				rd.include(request, response);
				out.println("unsuccesful,please enter details properly");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
