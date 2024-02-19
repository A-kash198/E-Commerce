package com.tech.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//import com.mysql.cj.jdbc.Driver;

public class DBCon {
	private static Connection connection=null;
	
	public static Connection getConnection()throws ClassNotFoundException, SQLException {
		
		if(connection==null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
		connection=	DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_cart","root","Akash198@");
		System.out.print("connected");
		}
		return connection;
	}
	
}
