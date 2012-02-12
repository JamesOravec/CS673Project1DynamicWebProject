package edu.unlv.cs673.echoteam;

import java.sql.Connection;
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
	public List selectAllComputersForUser() {
		List results = new ArrayList<ComputerHelper>();
		DAO myDao = new DAO();
		ResultSet rs = myDao.readQuery("SELECT computerId, userId, networkId, computerIP, computerPort, computerMAC FROM echosystems WHERE userId=?;");
		
		results = buildResultList(rs);
		DAO.close();	// Clean up, close the db connection		

		return results;
	}
	
	public void insertComputer() {
		// TODO Auto-generated method stub
	}
	
	public void deleteComputerById() {
		// TODO Auto-generated method stub
	}
	
	public void updateComptuerById() {
		// TODO Auto-generated method stub
	}
	
}
