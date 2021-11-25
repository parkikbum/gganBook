package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import board.Board;


public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://database-1-user.coimq8nymisd.us-east-2.rds.amazonaws.com/gganbook";
			String dbID = "admin";
			String dbPassword = "12345678";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1;
				else
					return 0;
			}
			return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(user user) {
		String SQL = "INSERT INTO user VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getNickname());
			pstmt.setString(2, user.getuserID());
			pstmt.setString(3, user.getuserPassword());
			pstmt.setString(4, user.getuserLocation());
			pstmt.setString(5, user.getuserUniv());
			pstmt.setString(6, user.getuserPhoneNumber());
			pstmt.setString(7, user.getuserQuiz());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public user userInfo(String userID) {
		String SQL = "SELECT * FROM user WHERE userID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user use = new user();
				use.setuserLocation(rs.getString(4));
				use.setuserUniv(rs.getString(5));
				return use;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public user findUserID(String nickName, String userUniv, String userLocation) {
				String SQL = "select userID,nickName from user where nickName = '" + nickName + "' and userLocation = '"+ userLocation +"' and userUniv ='"+ userUniv +"'";
		System.out.print(nickName+userUniv+userLocation);
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user use = new user();
				use.setuserID(rs.getString(1));
				use.setNickName(rs.getString(2));
				return use;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
		public user findUserPW(String userID, String nickName, String userUniv, String userLocation) {
			String SQL = "select nickName,userPassword from user where userID = '" + userID + "' and nickName = '"+ nickName+ "'and userLocation = '"+ userLocation +"' and userUniv ='"+ userUniv +"'";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
		
				if(rs.next()) {
					user use = new user();
					use.setNickName(rs.getString(1));
					use.setuserPassword(rs.getString(2));
					return use;
				}
		
			}catch(Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		
}

