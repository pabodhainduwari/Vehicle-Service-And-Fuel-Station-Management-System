package model;

public class employeeModel extends userModel {
	
	private int empID;
	private String empType;
	private String mobile;
	private String address;
	private float salary;
	
	
	
	public employeeModel() {
		
	}
	
	

	

	public int getEmpID() {
		return empID;
	}

	public String getAddress() {
		return address;
	}

	public float getSalary() {
		return salary;
	}
	public String getMobile() {
		return mobile;
	}

	
	public String getEmpType() {
		return empType;
	}

	

	public void setEmpID(int empID) {
		this.empID = empID;
	}
	
	public void setEmpType(String empType) {
		this.empType = empType;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public void setSalary(float salary) {
		this.salary = salary;
	}

	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	
	

	@Override
	public float getDiscount() {
		// TODO Auto-generated method stub
		float discount = 5;
		return discount;
	}
	
	
	
}
	
	