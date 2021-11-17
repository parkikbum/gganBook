package user;

public class user {
	
	private String nickName;
	private String userID;
	private String userPassword;
	private String userLocation;
	private String userUniv;
	
	
	public String getNickname() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getuserID() {
		return userID;
	}
	public void setuserID(String userID) {
		this.userID = userID;
	}
	
	public String getuserPassword() {
		return userPassword;
	}
	public void setuserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	public String getuserLocation() {
		return userLocation;
	}
	public void setuserLocation(String userLocation) {
		this.userLocation = userLocation;
	}
	
	public String getuserUniv() {
		return userUniv;
	}
	public void setuserUniv(String userUniv) {
		this.userUniv = userUniv;
	}
}
