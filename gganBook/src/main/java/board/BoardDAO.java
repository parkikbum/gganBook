package board;

import java.sql.Connection;
import java.util.ArrayList;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class BoardDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	
	private ResultSet rs;
	
	public BoardDAO() {
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "데이터 베이스 오류";
	}
	
	public int getNext() {
		String SQL = "SELECT boardID FROM board ORDER BY boardID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; //첫번재 게시글
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //db오류
	}
	
	public int write(String boardTitle, String userID, String boardContent, String boardUniv, String boardLocation, String boardImage, String boardPrice) {
		String SQL = "INSERT INTO board VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext());
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, 1);
			pstmt.setString(7, boardImage);
			pstmt.setString(8, boardUniv);
			pstmt.setString(9, boardLocation);
			pstmt.setString(10, boardPrice);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; // db오류
	}
	
	public ArrayList<Board> getList(int pageNumber){
		//특정한 숫자보다 작은것.
		String SQL = "SELECT * FROM board WHERE boardID < ? and boardAvailable = 1 ORDER BY boardID DESC LIMIT 5";
		ArrayList<Board> list = new ArrayList<Board>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				board.setBoardImage(rs.getString(7));
				board.setBoardUniv(rs.getString(8));
				board.setBoardLocation(rs.getString(9));
				board.setBoardPrice(rs.getString(10));
				list.add(board);
				System.out.println(rs.getString(2));

			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM board WHERE boardID < ? and boardAvailable = 1 ORDER BY boardID DESC LIMIT 5";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, getNext() - (pageNumber -1) * 5);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Board getBoard(int boardID) {
		
		String SQL = "SELECT * FROM board WHERE boardID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				board.setBoardImage(rs.getString(7));
				board.setBoardUniv(rs.getString(8));
				board.setBoardLocation(rs.getString(9));
				board.setBoardPrice(rs.getString(10));
				System.out.println(rs.getString(2));
				return board;

			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int getMypage(String userID) {
			String SQL = "SELECT COUNT(*) FROM board WHERE userID = ?";
			int count = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
				return count;

			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	

	public ArrayList<Board> getMyList(int pageNumber, String userID){
		//특정한 숫자보다 작은것.
		String SQL = "SELECT * FROM board WHERE boardID < ? and boardAvailable = 1 and userID = ? ORDER BY boardID DESC LIMIT 5";
		ArrayList<Board> list = new ArrayList<Board>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			pstmt.setString(2, userID);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				board.setBoardImage(rs.getString(7));
				board.setBoardUniv(rs.getString(8));
				board.setBoardLocation(rs.getString(9));
				board.setBoardPrice(rs.getString(10));
				list.add(board);

			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}

