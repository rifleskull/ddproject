package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class InsertQuery
 */
public class InsertQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 private PreparedStatement pstmt;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuery() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		
		String bname = request.getParameter("bname");
		String author = request.getParameter("author");
		String price="500";
		String stock="40";
		String cat_id="2";
		
		String Sql = "insert into book (bname,author,price,stock,category_cid) values('"+bname+"','"+author+"','"+price+"','"+stock+"','"+cat_id+"')";
		request.getSession().setAttribute("Sql", Sql);
		System.out.println("Insert Query");
		try {
			java.sql.Connection con = Connection1.dbConnect();
			Statement st = (Statement) con.createStatement();
			/*String sql="insert into book(bname,author,price,stock,cat_id) values (?,?,?,?,?)";
			st=(Statement) con.prepareStatement(sql);
			((PreparedStatement) st).setString(1, bname);
			((PreparedStatement) st).setString(2, author);
			((PreparedStatement) st).setString(3, price);
			((PreparedStatement) st).setString(4, stock);
			((PreparedStatement) st).setString(5, cat_id);
			*/
			st.executeUpdate(Sql);
			System.out.println("Insert success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		System.out.println(author+"\t"+bname);
		 request.getRequestDispatcher("insertQuery.jsp").forward(request, response);
		 
		 
		 
	}

}
