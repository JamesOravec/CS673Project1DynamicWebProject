/**
 * @author James Oravec
 * CS673 - Project 1 - Echo Team
 * 
 * In order to use the following code, you need to add the mysql-connector-java.5.1.18-bin.jar file to your project class path.
 * You can get the zip file, which contains the jar from: http://www.mysql.com/downloads/connector/j/
 * 
 * In order to use add the jar to your class path, do the following:
 * 1) download the zip file.
 * 2) Extract the zip into a folder
 * 3) Create a "lib" directory under your Eclipse project
 * 4) Copy the .jar file into the lib directory
 * 5) Right click on your project -> Build Path -> Configure build path
 * 6) Libraries Tab
 * 7) Add Jars
 * 8) Select the jar from you lib directory.
 * 
 * I got the base of the code below from: http://www.java-samples.com/showtutorial.php?tutorialid=9
 * 
 * I modified it to supply the username and password of the db. In order for this code to work, you'll need to of installed
 * mysql and created the database and tables, as specified in a previous email.
 * 
 * Since we can get this working in java, we should be able to make it work easily with a servlet/jsp.
 */

package com.jamesoravec.samplecode.examples.jdbc;

import java.sql.*;

public class JdbcDemo{
	static String dbUrl = "jdbc:mysql://localhost/echoTeam";
	static String query = "Select * FROM echousers";
	static String user = "root";
	static String password = "password";
	static Connection con = null;

	public static void main(String args[]){
		System.out.println("Start");
		JdbcDemo jd = new JdbcDemo();
		String result = jd.outputAllEchoUserRecords();
		System.out.println("result: " + result);
		System.out.println("End");
	}
	
	/**
	 * @author James Oravec
	 * The following will connect to the MySQL db, query the user table
	 * and output all of the information in the table.
	 * 
	 * @return
	 */
	public String outputAllEchoUserRecords(){
		StringBuilder sb = new StringBuilder();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbUrl, user, password);
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				sb.append("(");
				sb.append(rs.getString(1));
				sb.append(",");
				sb.append(rs.getString(2));
				sb.append(",");
				sb.append(rs.getString(3));
				sb.append(") ");
			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally{
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return sb.toString();
	}
}
