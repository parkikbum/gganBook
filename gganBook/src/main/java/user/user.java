package user;

public class user {
	
	private String nickName;
	private String userID;
	private String userPassword;
	private String userLocation;
	private String userUniv;
	private String phoneNumber;
	private String quiz;
	
	public String getuserQuiz(){
		return quiz;
	}
	
	public void setuserQuiz(String quiz){
		this.quiz = quiz;
	}
	
	public String getuserPhoneNumber(){
		return phoneNumber;
	}
	
	public void setuserPhoneNumber(String phoneNumber){
		this.phoneNumber = phoneNumber;
	}
	
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
