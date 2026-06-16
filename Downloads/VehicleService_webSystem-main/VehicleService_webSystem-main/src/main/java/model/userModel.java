package model;

public abstract class  userModel {
    private int userID;
    private String email;
    private String userName;
    private String password;
    private String name;
    private String royaltyType;
    private String NIC;
    private String userType;
    
   

	public userModel() {
		
		this.userID = 0;
		this.email = null;
		this.userName = null;
		this.password = null;
		this.name = null;
		this.royaltyType = null;
	}

	// getters
    public int getUserID() {
        return this.userID;
    }    

    public String getEmail() {
        return this.email;
    }    

    public String getUserName() {
        return this.userName;
    }    

    public String getPassword() {
        return this.password;
    }    

    public String getName() {
        return this.name;
    }

    public String getRoyaltyType() {
    	return this.royaltyType;
    }
    
    public String getNIC() {
		return NIC;
	}

    public String getUserType() {
		return userType;
	}

	
	public abstract float getDiscount();
	

	// setters
    public void setUserID(int userID) {
        this.userID = userID;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setName(String name) {
        this.name = name;
    }

    public void setRoyaltyType(String royaltyType) {
		this.royaltyType = royaltyType;
	}
    public void setNIC(String nIC) {
		NIC = nIC;
	}
    public void setUserType(String userType) {
		this.userType = userType;
	}

}
