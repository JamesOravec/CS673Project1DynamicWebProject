// Reference: http://www.mkyong.com/java/java-properties-file-examples/

package com.jamesoravec.samplecode.examples.propertyfile;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class PropertyFileReader2 {
	public static void main(String[] args) {
		Properties prop = new Properties();

		try {
			// load a properties file
			prop.load(new FileInputStream("config.properties"));

			// get the property value and print it out
			System.out.println(prop.getProperty("dbUrl"));
			System.out.println(prop.getProperty("user"));
			System.out.println(prop.getProperty("password"));

		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}