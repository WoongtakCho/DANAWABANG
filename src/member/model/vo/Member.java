package member.model.vo;

import java.sql.Date;

public class Member {
	private String name;
	private String id;
	private String pwd;
	private String email;
	private String phone;
	private String address;
	private String isAdmin;
	private String adminCode;
	private String memberDelete;
	private Date enrollDate;

	public Member() {
	}
	
	public Member(String name, String id, String pwd, String email, String phone, String address,
			String isAdmin, String adminCode, String memberDelete, Date enrollDate) {
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.isAdmin = isAdmin;
		this.adminCode = adminCode;
		this.memberDelete = memberDelete;
		this.enrollDate = enrollDate;
	}
	
	public Member(String name, String id, String email, String phone, String address, Date enrollDate) {
		this.name = name;
		this.id = id;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.enrollDate = enrollDate;
	}
	
	public Member(String name, String id, String pwd, String email, String phone, String address) {
		super();
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}

	public Member(String name, String id, String pwd, String email) {
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
	}
	
	public Member(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getAdminCode() {
		return adminCode;
	}

	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
	}

	public String getMemberDelete() {
		return memberDelete;
	}

	public void setMemberDelete(String memberDelete) {
		this.memberDelete = memberDelete;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Member [name=" + name + ", id=" + id + ", pwd=" + pwd + ", email=" + email
				+ ", phone=" + phone + ", address=" + address + ", isAdmin=" + isAdmin + ", adminCode=" + adminCode
				+ ", memberDelete=" + memberDelete + ", enrollDate=" + enrollDate + "]";
	}

}