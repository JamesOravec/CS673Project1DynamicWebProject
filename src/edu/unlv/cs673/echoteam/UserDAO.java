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
	

	public List<UserHelper> selectAllComputers() {
		List<UserHelper> results = new ArrayList<UserHelper>();
		DAO myDao = new DAO();
		String query = "SELECT userId, userName, userPassword FROM users;";
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

					results.add(new UserHelper(userId, userName, userPassword));
				}
			}
		} catch (SQLException e) {
			System.err.println("Error in buildResultList");
			e.printStackTrace();
		}
		return results;
	}
	
	public void insertComputer(String userName, String userPassword) throws SQLException {
		@SuppressWarnings("unused")
		DAO myDao = new DAO();
		String query = "";
		query = "INSERT INTO users (userName, userPassword) Values (?, ?);";
		PreparedStatement p = null;
		p = DAO.con.prepareStatement(query);
		p.setString(1, userName);
		p.setString(2, userPassword);
		System.out.println(p.toString());
		p.execute();
		query = "commit;";
		p = DAO.con.prepareStatement(query);
		p.execute();
		DAO.close();
	}
	
	public void deleteComputerById() {
		// TODO Auto-generated method stub
	}
	
	public void updateComptuerById() {
		// TODO Auto-generated method stub
	}
}
