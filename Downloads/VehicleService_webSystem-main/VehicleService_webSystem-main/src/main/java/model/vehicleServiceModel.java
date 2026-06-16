package model;

public class vehicleServiceModel {
		private int serviceID;
		private String serviceName;
		private String serviceType;
		private String description;
		private String price;
		
		public vehicleServiceModel()
		{
			
		}
		public vehicleServiceModel(int serviceID, String serviceName, String serviceType, String description,
			String price) {
			super();
			this.serviceID = serviceID;
			this.serviceName = serviceName;
			this.serviceType = serviceType;
			this.description = description;
			this.price = price;
		}
		public int getServiceID() {
			return serviceID;
		}
		public String getServiceName() {
			return serviceName;
		}
		public String getServiceType() {
			return serviceType;
		}
		public String getDescription() {
			return description;
		}
		public String getPrice() {
			return price;
		}
		
		public void setServiceID(int serviceID) {
			this.serviceID = serviceID;
		}
		public void setServiceName(String serviceName) {
			this.serviceName = serviceName;
		}
		public void setServiceType(String serviceType) {
			this.serviceType = serviceType;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public void setPrice(String price) {
			this.price = price;
		}
		

}
