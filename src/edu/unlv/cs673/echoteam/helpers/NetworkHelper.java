package edu.unlv.cs673.echoteam.helpers;

public class NetworkHelper {
	private int networkId;
	private int userId;		
	private String networkGPS;
	
	public NetworkHelper(int networkId, int userId, String networkGPS) {
		this.networkId= networkId;
		this.userId= userId;
		this.networkGPS= networkGPS;
	}

	public int getNetworkId() {
		return networkId;
	}

	public void setNetworkId(int networkId) {
		this.networkId = networkId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getNetworkGPS() {
		return networkGPS;
	}

	public void setNetworkGPS(String networkGPS) {
		this.networkGPS = networkGPS;
	}
}
