package models;

public class PolicyData {
	private String policyName;
	
	public String getPolicyName() {
		return policyName;
	}
	public void setPolicyName(String policyName) {
		this.policyName = policyName;
	}
	@Override
	public String toString() {
		return "Policy [policyName=" + policyName + "]";
	}
}
