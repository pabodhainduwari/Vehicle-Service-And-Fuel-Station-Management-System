package model;

public class vehicleModel {
	private int  id;
	private String owner;
	private String vType;
	private String reg_Num;
	private String chassis;
	private String engine;
	private String fuel;
	private String year;
	private String vMake;
	private String vModel;
	private int cusID;
	
	public vehicleModel(int vehicleID, String owner, String vType, String reg_Num, String chassis, String engine, String fuel,
			String year, String vMake, String vModel,int cusID) {
		super();
		this.id = vehicleID;
		this.owner = owner;
		this.vType = vType;
		this.reg_Num = reg_Num;
		this.chassis = chassis;
		this.engine = engine;
		this.fuel = fuel;
		this.year = year;
		this.vMake = vMake;
		this.vModel = vModel;
		this.cusID = cusID;
	}
	
	
	public vehicleModel() {
		
	}

	public int getId() {
		return id;
	}

	public String getOwner() {
		return owner;
	}

	public String getvType() {
		return vType;
	}

	public String getReg_Num() {
		return reg_Num;
	}

	public String getChassis() {
		return chassis;
	}

	public String getEngine() {
		return engine;
	}

	public String getFuel() {
		return fuel;
	}

	public String getYear() {
		return year;
	}

	public String getvMake() {
		return vMake;
	}

	public String getvModel() {
		return vModel;
	}
	
	public int getCusID() {
		return cusID;
	}


	public void setId(int id) {
		this.id = id;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public void setvType(String vType) {
		this.vType = vType;
	}

	public void setReg_Num(String reg_Num) {
		this.reg_Num = reg_Num;
	}

	public void setChassis(String chassis) {
		this.chassis = chassis;
	}

	public void setEngine(String engine) {
		this.engine = engine;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public void setvMake(String vMake) {
		this.vMake = vMake;
	}

	public void setvModel(String vModel) {
		this.vModel = vModel;
	}
	
	public void setCusID(int cusID) {
		this.cusID = cusID;
	}

}
