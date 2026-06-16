package model;

public class bookingModel {
	
	private int  bookingId;
	private String name;
	private int cusID;
	private String phone;
	private String email;
	private String vType;
	private String v_Model;
	private String numberPlate;
	private String sType;
	private String lastService;
	private String sDate;
	private String sTime;
	private String answer;
	private String issues;
	private String mechStatus;
	
	public bookingModel(int bookingId, String name, int cusID, String phone, String email, String vType,
			String v_Model, String numberPlate, String sType, String lastService, String sDate, String sTime,
			String answer, String issues,String mechStatus ) {
		super();
		this.bookingId = bookingId;
		this.name = name;
		this.cusID = cusID;
		this.phone = phone;
		this.email = email;
		this.vType = vType;
		this.v_Model = v_Model;
		this.numberPlate = numberPlate;
		this.sType = sType;
		this.lastService = lastService;
		this.sDate = sDate;
		this.sTime = sTime;
		this.answer = answer;
		this.issues = issues;
		this.mechStatus = mechStatus;
	}
	
	public bookingModel() {
		
	}

	public int getBookingId() {
		return bookingId;
	}

	public String getName() {
		return name;
	}

	public int getCusID() {
		return cusID;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getvType() {
		return vType;
	}

	public String getV_Model() {
		return v_Model;
	}

	public String getNumberPlate() {
		return numberPlate;
	}

	public String getsType() {
		return sType;
	}

	public String getLastService() {
		return lastService;
	}

	public String getsDate() {
		return sDate;
	}

	public String getsTime() {
		return sTime;
	}

	public String getAnswer() {
		return answer;
	}

	public String getIssues() {
		return issues;
	}

	
	
	public String getMechStatus() {
		return mechStatus;
	}

	
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setCusID(int cusID) {
		this.cusID = cusID;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setvType(String vType) {
		this.vType = vType;
	}

	public void setV_Model(String v_Model) {
		this.v_Model = v_Model;
	}

	public void setNumberPlate(String numberPlate) {
		this.numberPlate = numberPlate;
	}

	public void setsType(String sType) {
		this.sType = sType;
	}

	public void setLastService(String lastService) {
		this.lastService = lastService;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public void setsTime(String sTime) {
		this.sTime = sTime;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public void setIssues(String issues) {
		this.issues = issues;
	}
	
	public void setMechStatus(String mechStatus) {
		this.mechStatus = mechStatus;
	}

}
