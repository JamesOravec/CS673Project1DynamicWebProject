// Reference: http://www.zparacha.com/how-to-read-properties-file-in-java/

// This reader is not working. Check PropertyFileReader2.java for a working example.

package com.jamesoravec.samplecode.examples.propertyfile;

import java.util.Properties;  
import java.io.*;  

public class PropertyFileReader {

	private static final String PROP_FILE = "config.properties";

	public void readPropertiesFile() {
		String database = "";
		String dbuser = "";
		String dbpassword = "";

		try {
			InputStream is = PropertyFileReader.class.getResourceAsStream(PROP_FILE);
			Properties prop = new Properties();
			prop.load(is);
			database = prop.getProperty("database");
			dbuser = prop.getProperty("dbuser");
			dbpassword = prop.getProperty("dbpassword");
			is.close();
			/* code to use values read from the file */
		} catch (Exception e) {
			System.out.println("Failed to read from " + PROP_FILE + " file.");
		}
		
		System.out.println("database: " + database); 
		System.out.println("dbuser: " + dbuser); 
		System.out.println("dbpassword: " + dbpassword); 
	}
	
	public static void main(String[] args) {
		PropertyFileReader pfr = new PropertyFileReader();
		pfr.readPropertiesFile();
	}
	
}