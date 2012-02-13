package edu.unlv.cs673.echoteam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.unlv.cs673.echoteam.helpers.ComputerHelper;
import edu.unlv.cs673.echoteam.helpers.UserHelper;

public class UserDAO {
	// Use DAO for the connection, but do db selects here. Return RecordSet results as a 
	// collection of ComputerHelper objects
	

	public List<UserHelper> selectAllUsers() {
		List<UserHelper> results = new ArrayList<UserHelper>();
		DAO myDao = new DAO();
		String query = "SELECT userId, userName, userPassword, userEmail FROM users;";
		ResultSet rs = myDao.readQuery(query);
		results = buildResultList(rs);
		DAO.close();	// Clean up, close the db connection		

		return results;
	}

	@SuppressWarnings({ "unchecked" })
	private List<UserHelper> buildResultList(ResultSet rs) {
		List<UserHelper> results = new ArrayList<UserHelper>();
		try {
			if (rs != null) {
				// Build results
				while (rs.next()) {
					int userId = Integer.parseInt(rs.getString(1));
					String userName = rs.getString(2);
					String userPassword = rs.getString(3);
					String userEmail = rs.getString(4);

					results.add(new UserHelper(userId, userName, userPassword, userEmail));
				}
			}
		} catch (SQLException e) {
			System.err.println("Error in buildResultList");
			e.printStackTrace();
		}
		return results;
	}
	
	public void insertUser(String userName, String userPassword, String userEmail) throws SQLException {
		@SuppressWarnings("unused")
		DAO myDao = new DAO();
		String query = "";
		query = "INSERT INTO users (userName, userPassword, userEmail) Values (?, ?, ?);";
		PreparedStatement p = null;
		p = DAO.con.prepareStatement(query);
		p.setString(1, userName);
		p.setString(2, userPassword);
		p.setString(3, userEmail);
		p.execute();
		query = "commit;";
		p = DAO.con.prepareStatement(query);
		p.execute();
		DAO.close();
	}
	
	public void deleteUserById(int userId) throws SQLException {
		@SuppressWarnings("unused")
		DAO myDao = new DAO();
		String query = "DELETE FROM users WHERE userId = ?";
		PreparedStatement p = DAO.con.prepareStatement(query);
		p.setInt(1, userId);
		p.execute();
		DAO.close();
	}
	
	public void updateComptuerById() {
		// TODO Auto-generated method stub
	}
	
	public String validUserPassword(String userName, String userPassword){
		@SuppressWarnings("unused")
		DAO myDao = new DAO();
		String query = "";
		query = "SELECT userId FROM users WHERE userName=? AND userPassword = ?;";
		PreparedStatement p = null;
		try {
			p = DAO.con.prepareStatement(query);
			p.setString(1, userName);
			p.setString(2, userPassword);
			ResultSet rs;
			rs = p.executeQuery();
			
			if(rs.next()){
				String id = rs.getString(1);
				return id;	// has matching record
			} else {
				return "";	// empty record set.
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "";		// empty record set.
		} finally {
			DAO.close();
		}
	}
}
