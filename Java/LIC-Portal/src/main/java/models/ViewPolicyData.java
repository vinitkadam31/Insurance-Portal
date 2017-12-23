package models;

public class ViewPolicyData {
	private String applicationId;
	private String customerName;
	private String productName;
	private String stageDesc;
	private String isVerified;
	private String remarks;
	private String appStatus;
	
	public String getApplicationId() {
		return applicationId;
	}
	public void setApplicationId(String applicationId) {
		this.applicationId = applicationId;
	}
	
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public String getStageDesc() {
		return stageDesc;
	}
	public void setStageDesc(String stageDesc) {
		this.stageDesc = stageDesc;
	}
	
	public String getIsVerified() {
		return isVerified;
	}
	public void setIsVerified(String isVerified) {
		this.isVerified = isVerified;
	}
	
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public String getAppStatus() {
		return appStatus;
	}
	public void setAppStatus(String appStatus) {
		this.appStatus = appStatus;
	}
	
	@Override
	public String toString() {
		return "Policy [applicationId=" + applicationId + "]";
	}
}
