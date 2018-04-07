package com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;
import com.sun.corba.se.spi.orbutil.fsm.Action;

/**
 * Servlet implementation class UpdateQuery
 */
public class UpdateQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");
		if(action.equals(null)){
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		String bname = request.getParameter("bname");
		String author = request.getParameter("author");
		String Sql = "Update book set author = '"+author+"' where bname = '"+bname+"';";
		System.out.println("Update Query");
		try {
			java.sql.Connection con = Connection1.dbConnect();
			Statement st = (Statement) con.createStatement();
			st.execute(Sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(bname+"\t"+author);
		request.getRequestDispatcher("updateQuery.jsp").forward(request, response);
		
		
		
		
		
		
	}

}
