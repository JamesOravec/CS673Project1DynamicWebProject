/**
 * Base example from:
 * 		http://stackoverflow.com/questions/1776457/java-client-server-application-with-sockets
 * 
 * Modified so can send command, which will be used to make a computer sleep.
 * 
 * Note that the naming convention for this might be a bit goofy when you start thinking about it.
 * The following should help you understand how this is to be implemented:
 * 
 * Java Client will run on the webserver. As when we notify the webserver we want to a system to put itself
 * to sleep, the webserver will use it's Java Client to connect to the machine that needs to sleep. That
 * machine will need to be running the Java Server, so that it can receive the input from the Java Client.
 * 
 * In the example below the provider runs on the client machines.
 * In the example below the requester runs on the web server.
 * 
 */

package com.jamesoravec.samplecode.examples.hibernate;


import com.jamesoravec.samplecode.examples.hibernate.ClientServerConstants;	// In case we change the package when integrating

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Properties;


public class Provider{
	ServerSocket providerSocket;
	Socket connection = null;
	ObjectOutputStream out;
	ObjectInputStream in;
	String message;
	/**
	 * The port that we'll listen to. Populated from properties file.
	 */
	static int port;
	
	Provider(int port){
		Provider.port = port;
	}

	void run() {
		try{
			//1. creating a server socket
			providerSocket = new ServerSocket(port, 10);
			//2. Wait for connection
			System.out.println("Waiting for connection");
			connection = providerSocket.accept();
			System.out.println("Connection received from " + connection.getInetAddress().getHostName());
			//3. get Input and Output streams
			out = new ObjectOutputStream(connection.getOutputStream());
			out.flush();
			in = new ObjectInputStream(connection.getInputStream());
			sendMessage("Connection successful");
			//4. The two parts communicate via the input and output streams
			
			while(true){
				try {
					// Receive message from requestor
					message = (String) in.readObject();
					System.out.println("client>" + message);
					if (message.equals(ClientServerConstants.SLEEP_COMMAND)){
						// Sleep command received. Issue command to hibernate the machine
						// TODO: Receive additional authentication messages, such as username/password from server.
						//			This can be compared to the store values in the hibernate.properties file.
						// TODO: Can also make logic more robust as far as verifying ordering of messages is correct.
						
						// The following sends the command to sleep:
						//Process p = Runtime.getRuntime().exec("shutdown -h");
						// Use notepad.exe for initial testing purposes.
						Process p = Runtime.getRuntime().exec("notepad.exe");
						p.waitFor();
					}
				} catch (ClassNotFoundException e) {
					System.err.println("Data received in unknown format");
					e.printStackTrace();
				} catch (InterruptedException e) {
					System.err.println("Error issuing windows command to hibernate");
					e.printStackTrace();
				}
			}
		} catch (IOException ioException) {
			ioException.printStackTrace();
		} finally {
			//4: Closing connection
			try {
				in.close();
				out.close();
				providerSocket.close();
			} catch (IOException ioException) {
				ioException.printStackTrace();
			}
		}
	}

	void sendMessage(String msg) {
		try {
			out.writeObject(msg);
			out.flush();
			System.out.println("server>" + msg);
		} catch (IOException ioException) {
			ioException.printStackTrace();
		}
	}

	public static void main(String args[]) {
		getPropertyValuesFromFile();
		Provider server = new Provider(port);
		while (true) {
			server.run();
		}
	}

	private static void getPropertyValuesFromFile() {
		// get the port we'll be listening to from the property file.
		Properties prop = new Properties();
		port = -1;
		String sPort = "";
		
		try {
			prop.load(new FileInputStream(ClientServerConstants.PROPERTY_FILE_NAME));
			sPort = prop.getProperty("providerport");
			port = Integer.parseInt(sPort);
			// TODO: Other properties can be read here, such as username/password combination used to 
			// 		authenticate that the hibernate request is valid.
		} catch (NumberFormatException e) {
			System.out.println("Port value from property file is not a valid integer value.");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("Error reading property file.");
			e.printStackTrace();
		}
	}
}