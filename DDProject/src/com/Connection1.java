package com;

import java.sql.DriverManager;
import java.sql.SQLException;

public class Connection1 {
	static String Driver = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/ddlibrary";
	static String userdb = "root";
	static String passdb = "";
	static java.sql.Connection con;
	public static  java.sql.Connection dbConnect() throws Exception {
	
		Class.forName(Driver);
		con=DriverManager.getConnection(url,userdb,passdb);
		if (con != null)
			System.out.println("DB CONNECTED");
		return con;
	}
	
}
