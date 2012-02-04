/**
 * Base Client/Server example from:
 * 		http://stackoverflow.com/questions/1776457/java-client-server-application-with-sockets
 * 
 * Base property read file from:
 * 		http://www.zparacha.com/how-to-read-properties-file-in-java/ 
 * 
 * Modified so can send command, which will be used to make a computer sleep.
 * 
 * This is requestor or client code (in our case the webserver is the client), 
 * so we'll integrate with with servlet stuff. Please read the comments in "Provider.java"
 */

package com.jamesoravec.samplecode.examples.hibernate;

import java.io.*;
import java.net.*;
import com.jamesoravec.samplecode.examples.hibernate.ClientServerConstants;	// In case we change the package when integrating
import com.sun.xml.internal.bind.v2.TODO;


public class Requestor{
	Socket requestSocket = null;
	ObjectOutputStream out = null;
	ObjectInputStream in = null;
	String message = null;
	// TODO: The following two lines will need to be pulled from the db.
	static String serverUrl = "";
	static int port = -1;
	
	/**
	 * Constructor. 
	 * 		Gets the server and port info from a property file.
	 */
	Requestor(){
		
	}

	/**
	 * This is the logic which will connect to the provider to
	 * request that it hibernate itself.
	 */
	void run(String serverUrl, int port) {
		try{
			//1. creating a socket to connect to the server
			// TODO: Pull computer
			
			requestSocket = new Socket(serverUrl, port);
			System.out.println("Connected to localhost in port 2004");
			//2. get Input and Output streams
			out = new ObjectOutputStream(requestSocket.getOutputStream());
			out.flush();
			in = new ObjectInputStream(requestSocket.getInputStream());
			//3: Communicating with the server
			do {
				try {
					message = (String) in.readObject();
					System.out.println("server>" + message);

					sendMessage(ClientServerConstants.SLEEP_COMMAND);
					// TODO: Send additional info to help authenticate the request is valid.
						//sendMessage(UserId);
						//sendMessage(Password);
				} catch (ClassNotFoundException classNot) {
					System.err.println("data received in unknown format");
				}
			} while (!message.equals("bye"));
		} catch (UnknownHostException unknownHost) {
			System.err.println("You are trying to connect to an unknown host!");
		} catch (IOException ioException) {
			ioException.printStackTrace();
		} finally {
			//4: Closing connection
			try {
				in.close();
				out.close();
				requestSocket.close();
			} catch (IOException ioException) {
				ioException.printStackTrace();
			}
		}
	}

	/**
	 * This method sends a message from the requestor to the provider.
	 * 
	 * @param msg
	 */
	void sendMessage(String msg) {
		try {
			out.writeObject(msg);
			out.flush();
			System.out.println("client>" + msg);
		} catch (IOException ioException) {
			ioException.printStackTrace();
		}
	}

	public static void main(String args[]) {

		// TODO: Pull user info from db, and interate through each system that needs to sleep.
		// TODO: The following two lines will need to be pulled from the db.
		serverUrl = "localhost";
		port = 2004;
		Requestor client = new Requestor();
		client.run(serverUrl, port);
	}
}