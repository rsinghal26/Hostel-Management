package com.hostelManagement.doa;

import java.sql.*;

public class DatabaseConnection {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost:3306/isd";
	static final String USER = "root";
	static final String PASS = "Raja@123";
	
	Connection conn = null;
	Statement stmt = null;
	
	public void connect() throws SQLException, ClassNotFoundException{
		   Class.forName("com.mysql.jdbc.Driver");
		   conn = DriverManager.getConnection(DB_URL,USER,PASS);
		   stmt = conn.createStatement();
	}
	
	public int update(String sql) throws SQLException, ClassNotFoundException{
		int count = stmt.executeUpdate(sql);
		return count;
	}
	
	public ResultSet Query(String sql) throws SQLException{
		ResultSet rs = stmt.executeQuery(sql);
		return rs;
	}
	
	public void close() throws SQLException{
		stmt.close();
	    conn.close();
	}
		
}
