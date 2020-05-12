package ca.justfriends.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 
 * @author martha czerwik
 * TO DO: create db table for friendslist, join tables, create
 * queries to pull up friend lists (all or most recently added 4),
 * to add/remove/block users
 *
 */


public class DAO {
	private String dbURL= "jdbc:mysql://localhost:3306/jsfr";  
	private String user = "root";
	private String password = "m_ART_ysheridan"; //private pw
	
//set up database driver
	public Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return DriverManager.getConnection(dbURL, user, password);
	}
	
//establish a connection, create prepared statements, execute SQL update or query
	
//verify user exists upon login
	public ResultSet checkUser(String username, String password) throws SQLException {
		String selectSQL = "select * from jsfrusers where userID = (select userID from jsfrusers where (username like ?) and (userPassword like ?))";
		Connection conn = getConnection();
		PreparedStatement ps = conn.prepareStatement(selectSQL);
		ps.setString(1, username);
		ps.setString(2, password);
		System.out.println(ps);
		return ps.executeQuery();
	}
		
//add user into the system - removed birthday
	public int createUser(String firstName, String lastName, String email, String username,
			String userPassword, String city, String provOrState, String country,
			String gender, String photo) throws SQLException {
		String insertSQL = "INSERT INTO jsfrusers (firstName, lastName, email, username, "
				+ "userPassword, city, provOrState, country, gender, photo) "
				+ "VALUES (?,?,?,?,?,?,?,?,?,?)"; 
		Connection conn = getConnection();
		PreparedStatement ps = conn.prepareStatement(insertSQL);
		ps.setString(1, firstName);
		ps.setString(2, lastName);
		ps.setString(3, email);
		ps.setString(4, username);
		ps.setString(5, userPassword);
		ps.setString(6, city);
		ps.setString(7, provOrState);
		ps.setString(8, country);
		ps.setString(9, gender);
		ps.setString(10, photo);
		System.out.println(ps);
		return ps.executeUpdate();	
	}

//remove user from the system? needed?

//update user profile
	public int updateUser(String firstName, String lastName, String email, String city, String provOrState, String country,
			String gender, String photo) throws SQLException {
		String insertSQL = "UPDATE jsfrusers\r\n" + 
				"	SET firstName = ? , lastName= ?, email = ?, city = ?, provOrState = ?, country = ?,gender = ?, photo = ? \r\n" + 
				"	WHERE userID= (select userID where username like ? and userPassword like ?)";
		Connection conn = getConnection();
		PreparedStatement ps = conn.prepareStatement(insertSQL);
		ps.setString(1, firstName);
		ps.setString(2, lastName);
		ps.setString(3, email);
		ps.setString(6, city);
		ps.setString(7, provOrState);
		ps.setString(8, country);
		ps.setString(9, gender);
		ps.setString(10, photo);
		System.out.println(ps);
		return ps.executeUpdate();	
	}

//pull friends of the user	- not complete - create table and join
//	public ResultSet getFriends(String username) throws SQLException {
//		String selectSQL = "select * from jsfrusers where userID = (select userID from jsfrusers where username like ?";
//		Connection conn = getConnection();
//		PreparedStatement ps = conn.prepareStatement(selectSQL);
//		ps.setString(1, username);
//		System.out.println(ps);
//		return ps.executeQuery();
//	}
	

//pull 4 most recently addedd friends
//	public ResultSet getFour(String username) throws SQLException {
//	String selectSQL = "";
//	Connection conn = getConnection();
//	PreparedStatement ps = conn.prepareStatement(selectSQL);
//	ps.setString(1, username);
//	System.out.println(ps);
//	return ps.executeQuery();
//}
	
//add friend to friendslist
	
	
//remove friend from friends list
	
	
//block a user - add user to blacklist table linked to user(create column/table)

	
}
