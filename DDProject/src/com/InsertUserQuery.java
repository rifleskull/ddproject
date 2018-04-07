package com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class InsertUserQuery
 */
public class InsertUserQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUserQuery() {
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
		String name = request.getParameter("name");
		String balance = request.getParameter("balance");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		String Sql1 = "insert into user (uname,email,password,balance) values('"+name+"','"+email+"','"+password+"','"+balance+"')";
		request.getSession().setAttribute("Sql", Sql1);
		System.out.println("Insert User Query");
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
			st.executeUpdate(Sql1);
			System.out.println("Insert User success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(name+"\t"+balance);
		 request.getRequestDispatcher("insertUserQuery.jsp").forward(request, response);
 }

	}


