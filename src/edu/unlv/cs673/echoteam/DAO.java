package edu.unlv.cs673.echoteam;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DAO{
	static private String dbUrl = "";
	public static String query = "";
	static private String user = "";
	static private String password = "";
	public static Connection con = null;
	
	/**
	 * Creates DB connection
	 */
	public DAO() {
		// Get db connection info from property file.
		Properties prop = new Properties();
		try {
			// load a properties file
			InputStream in = getClass().getResourceAsStream("/config.properties");
			prop.load(in);

			// get the property value and print it out
			dbUrl = prop.getProperty("dbUrl");
			user = prop.getProperty("user");
			password = prop.getProperty("password");

			// Connect to DB
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbUrl, user, password);
		} catch (IOException ex) {
			ex.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Closes DB connection
	 */
	public static void close(){
		try{
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * Executes a query against the db and returns the record set to the caller.
	 * 
	 * @param query SQL that includes a select statement
	 * @return
	 */
	public ResultSet readQuery(String query) {
		// TODO: Add code verifying sql is of select type.
		DAO.query = query;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(DAO.query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	/**
	 * Executes a query against the db. This is indented for "inserts"
	 * 
	 * @param query The SQL query that contains the insert command.
	 */
	public void insertQuery(String query){
		// TODO: Add checks that query is of "insert" type.
		try {
			Statement stmt = null;
			DAO.query = query;
			stmt.executeQuery(DAO.query);
			DAO.query = "commit;";
			stmt.executeQuery(DAO.query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Executes a query against the db. This is indented for "updates"
	 * 
	 * @param query The SQL query that contains the update command.
	 */
	public void updateQuery(String query){
		// TODO: Add checks that query is of "udpdate" type.
		DAO.query = query;
	}

	/**
	 * Executes a query against the db. This is indented for "deletes"
	 * 
	 * @param query The SQL query that contains the delete command.
	 */
	public void deleteQuery(String query){
		// TODO: Add checks that query is of "delete" type.
		DAO.query = query;
	}
	
	/**
	 * General method for executing other queries against the db. 
	 * 
	 * @param query General executable query.
	 */
	public void executeQuery(String query){
		// TODO: Add checks to make sure no table drop commands, or other "bad" code.
		DAO.query = query;
	}
	
}
