package edu.unlv.cs673.echoteam.helpers;

public class ComputerHelper {
	private int computerId;
	private int userId;		
	private int networkId;	
	private String computerIP;
	private int computerPort;
	private String computerMAC;

	public ComputerHelper(int computerId, int userId, int networkId, String computerIP, int computerPort, String computerMAC) {
		this.computerId = computerId;
		this.userId = userId;
		this.networkId = networkId;
		this.computerIP = computerIP;
		this.computerPort = computerPort;
		this.computerMAC = computerMAC;
	}
	
	public int getComputerId() {
		return computerId;
	}

	public void setComputerId(int computerId) {
		this.computerId = computerId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getNetworkId() {
		return networkId;
	}

	public void setNetworkId(int networkId) {
		this.networkId = networkId;
	}

	public String getComputerIP() {
		return computerIP;
	}

	public void setComputerIP(String computerIP) {
		this.computerIP = computerIP;
	}

	public int getComputerPort() {
		return computerPort;
	}

	public void setComputerPort(int computerPort) {
		this.computerPort = computerPort;
	}

	public String getComputerMAC() {
		return computerMAC;
	}

	public void setComputerMAC(String computerMAC) {
		this.computerMAC = computerMAC;
	}
}
