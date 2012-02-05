package com.jamesoravec.sandbox;

import java.sql.*;
import javax.persistence.*;

public class PreparedStatementTest {
	public static void main(String[] args) {
		String dbUrl = "jdbc:mysql://localhost/echoTeam";
		String query = "";
		String user = "root";
		String password = "password";
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbUrl, user, password);

			query = "INSERT INTO echousers (userName, userPassword) Values (?, ?)";
			PreparedStatement p = con.prepareStatement(query);
			
			String username="username";
			String userPassword="userPassword";

			p.setString(1, username);
			p.setString(2, userPassword);
			
			System.out.println(p.toString());
			
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
