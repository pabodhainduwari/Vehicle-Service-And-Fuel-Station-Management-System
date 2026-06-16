package model;

public class serviceManagerDashboardModel {
	private int bookingID;
	private int customerID;
	private String customerName;
	private String contactNumber;
	private String service;
	private String serviceDate;
	private String serviceTime;
	private int mechanicID;
	
	public serviceManagerDashboardModel() {
		
	}
	public serviceManagerDashboardModel(int bookingID, int customerID, String customerName, String contactNumber,
			String service, String serviceDate, String serviceTime, int mechanicID) {
		super();
		this.bookingID = bookingID;
		this.customerID = customerID;
		this.customerName = customerName;
		this.contactNumber = contactNumber;
		this.service = service;
		this.serviceDate = serviceDate;
		this.serviceTime = serviceTime;
		this.mechanicID = mechanicID;
	}
	
	public int getBookingID() {
		return bookingID;
	}

	public void setBookingID(int bookingID) {
		this.bookingID = bookingID;
	}

	public int getCustomerID() {
		return customerID;
	}

	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getServiceDate() {
		return serviceDate;
	}

	public void setServiceDate(String serviceDate) {
		this.serviceDate = serviceDate;
	}

	public String getServiceTime() {
		return serviceTime;
	}

	public void setServiceTime(String serviceTime) {
		this.serviceTime = serviceTime;
	}

	public int getMechanicID() {
		return mechanicID;
	}

	public void setMechanicID(int mechanicID) {
		this.mechanicID = mechanicID;
	}

	
	
	
	
	
}
