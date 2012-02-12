package edu.unlv.cs673.echoteam.magicpacket;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

public class MagicPacketer {
	// Creates a Wake on Lan magic packet for the specified MAC address
	// MAC Address is in byte format
	private byte[] ConstructMagicPacket(byte[] bytesMacAddress) {
		byte[] sendData = new byte[6 + 16 * 6 + 32];
		final int repeatData = 6; // Times to repeat each data block

		int sendDataIndex = 0;
		for (int i = 0; i < repeatData; ++i) {
			sendData[sendDataIndex++] = (byte) 0xFF;
		}

		for (int i = 0; i < repeatData * bytesMacAddress.length; ++i) {
			sendData[sendDataIndex++] = bytesMacAddress[i % 6];
		}

		return sendData;
	}

	// Sends a Wake on Lan magicPacket to the specified host and MAC address
	// MAC Address is of the form "00:00:00:00:00:00"
	public void Wake(String host, String macAddress) throws SocketException {
		try {
			// Prepare a socket and target to send data
			DatagramSocket serverSocket = new DatagramSocket();

			InetAddress ipAddress = InetAddress.getByName(host);
			int port = 9;

			// Get bytes from macAddress string
			byte[] bytesMacAddress = new byte[6];
			for (int macAddressIndex = 0; macAddressIndex < 6; macAddressIndex++) {
				String[] hex = macAddress.split("(\\:|\\-)");
				bytesMacAddress[macAddressIndex] = (byte) Integer.parseInt(hex[macAddressIndex], 16);
			}

			// Construct the Magic Packet for Wake on Lan
			byte[] sendData = ConstructMagicPacket(bytesMacAddress);

			// Send the packet
			DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, ipAddress, port);
			serverSocket.send(sendPacket);

			serverSocket.close();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}