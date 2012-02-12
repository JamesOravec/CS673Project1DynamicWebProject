package edu.unlv.cs673.echoteam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import edu.unlv.cs673.echoteam.helpers.ComputerHelper;

public class ComputerDAO {
	// Use DAO for the connection, but do db selects here. Return RecordSet results as a 
	// collection of ComputerHelper objects

	public List<ComputerHelper> selectAllComputers() {
		List<ComputerHelper> results = new ArrayList<ComputerHelper>();
		DAO myDao = new DAO();
		String query = "SELECT computerId, userId, networkId, computerIP, computerPort, computerMAC FROM computers;";
		ResultSet rs = myDao.readQuery(query);
		results = buildResultList(rs);
		DAO.close();	// Clean up, close the db connection		

		return results;
	}

	@SuppressWarnings({ "unchecked" })
	private List<ComputerHelper> buildResultList(ResultSet rs) {
		List<ComputerHelper> results = new ArrayList<ComputerHelper>();
		try {
			if (rs != null) {
				// Build results
				while (rs.next()) {
					int computerId = Integer.parseInt(rs.getString(1));
					int userId = Integer.parseInt(rs.getString(2));
					int networkId = Integer.parseInt(rs.getString(3));
					String computerIP = rs.getString(4);
					int computerPort = Integer.parseInt(rs.getString(5));
					String computerMAC = rs.getString(6);

					results.add(new ComputerHelper(computerId, userId, networkId, computerIP, computerPort, computerMAC));
				}
			}
		} catch (SQLException e) {
			System.err.println("Error in buildResultList");
			e.printStackTrace();
		}
		return results;
	}
	
	@SuppressWarnings({ "rawtypes" })
	public List selectAllComputersForUser(int userId) {
		List results = new ArrayList<ComputerHelper>();
		@SuppressWarnings("unused")
		DAO myDao = new DAO();
		String query = "SELECT computerId, userId, networkId, computerIP, computerPort, computerMAC FROM computers WHERE userId=?;";
		PreparedStatement p = null;
		ResultSet rs = null;
		try {
			p = DAO.con.prepareStatement(query);
			p.setString(1, "" + userId);
			rs = p.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		results = buildResultList(rs);
		DAO.close();	// Clean up, close the db connection		

		return results;
	}
	
	public void insertComputer(String userId, String systemIP, String systemDNS, String systemPort, String systemMAC) throws SQLException {
		@SuppressWarnings("unused")
		DAO myDao = new DAO();
		String query = "";
		query = "INSERT INTO computers (userId, computerIP, computerPort, computerMAC) Values (?, ?, ?, ?, ?);";
		PreparedStatement p = null;
		p = DAO.con.prepareStatement(query);
		p.setString(1, userId);
		p.setString(2, systemIP);
		p.setString(3, systemDNS);
		p.setString(4, systemPort);
		p.setString(5, systemMAC);
		System.out.println(p.toString());
		p.execute();
		query = "commit;";
		p = DAO.con.prepareStatement(query);
		p.execute();
		DAO.close();
	}
	
	public void deleteComputerById(int computerId) throws SQLException {
		@SuppressWarnings("unused")
		DAO myDao = new DAO();
		String query = "DELETE FROM computers WHERE computerId = ?";
		PreparedStatement p = DAO.con.prepareStatement(query);
		p.setInt(1, computerId);
		p.execute();
		DAO.close();
	}
	
	public void updateComptuerById() {
		// TODO Auto-generated method stub
	}
	
}
