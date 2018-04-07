package com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class UpdateUserQuery
 */
public class UpdateUserQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String balance = request.getParameter("balance");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String Sql1 = "Update user set balance = '"+balance+"' where uname = '"+name+"';";
		System.out.println("Update Query");
		try {
			java.sql.Connection con = Connection1.dbConnect();
			Statement st = (Statement) con.createStatement();
			st.execute(Sql1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(name+"\t"+balance);
		request.getRequestDispatcher("updateUserQuery.jsp").forward(request, response);
	}

}
