package model;
public class fuelInventoryModel {
	private int fuelID ;
	private int fuelNumber;
	private String fuelName;
    private int stockAmount;
    private float pricePerUnit;
    private String lastUpdated;
    
    
	public fuelInventoryModel() {
		this.fuelNumber = 0;
		this.fuelID = 0;
		this.fuelName = null;
		this.stockAmount = 0;
		this.pricePerUnit = 0;
		this.lastUpdated = null;
	}

	

	public int getFuelID() {
		return fuelID;
	}

	public int getFuelNumber() {
		return fuelNumber;
	}

	public String getFuelName() {
		return fuelName;
	}


	public int getStockAmount() {
		return stockAmount;
	}


	public float getPricePerUnit() {
		return pricePerUnit;
	}


	public String getLastUpdated() {
		return lastUpdated;
	}

	public void setFuelID(int fuelID) {
		this.fuelID = fuelID;
	}
	
	public void setFuelNumber(int fuelNumber) {
		this.fuelNumber = fuelNumber;
	}
	
	public void setFuelName(String fuelName) {
		this.fuelName = fuelName;
	}


	public void setStockAmount(int stockAmount) {
		this.stockAmount = stockAmount;
	}

	public void setPricePerUnit(float pricePerUnit) {
		this.pricePerUnit = pricePerUnit;
	}
	
	public void setLastUpdated(String lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
    
    
}
