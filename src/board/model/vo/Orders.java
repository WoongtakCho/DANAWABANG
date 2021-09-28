package board.model.vo;

import java.sql.Date;

public class Orders {
	private String orderId;
	private String ordererName;
	private String ordererPhone;
	private String ordererEmail;
	private String ordererAddress;
	private String ordererRequest;
	private String orderProductName;
	private int productId;
	private int orderPrice;
	private Date orderDate;
	private String impUid;
	private String memberId;
	private String applyNum;
	
	public Orders() {}

	public Orders(String orderId, String ordererName, String ordererPhone, String ordererEmail, String ordererAddress,
			String ordererRequest, String orderProductName, int productId, int orderPrice, Date orderDate,
			String impUid, String memberId, String applyNum) {
		super();
		this.orderId = orderId;
		this.ordererName = ordererName;
		this.ordererPhone = ordererPhone;
		this.ordererEmail = ordererEmail;
		this.ordererAddress = ordererAddress;
		this.ordererRequest = ordererRequest;
		this.orderProductName = orderProductName;
		this.productId = productId;
		this.orderPrice = orderPrice;
		this.orderDate = orderDate;
		this.impUid = impUid;
		this.memberId = memberId;
		this.applyNum = applyNum;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getOrdererName() {
		return ordererName;
	}

	public void setOrdererName(String ordererName) {
		this.ordererName = ordererName;
	}

	public String getOrdererPhone() {
		return ordererPhone;
	}

	public void setOrdererPhone(String ordererPhone) {
		this.ordererPhone = ordererPhone;
	}

	public String getOrdererEmail() {
		return ordererEmail;
	}

	public void setOrdererEmail(String ordererEmail) {
		this.ordererEmail = ordererEmail;
	}

	public String getOrdererAddress() {
		return ordererAddress;
	}

	public void setOrdererAddress(String ordererAddress) {
		this.ordererAddress = ordererAddress;
	}

	public String getOrdererRequest() {
		return ordererRequest;
	}

	public void setOrdererRequest(String ordererRequest) {
		this.ordererRequest = ordererRequest;
	}

	public String getOrderProductName() {
		return orderProductName;
	}

	public void setOrderProductName(String orderProductName) {
		this.orderProductName = orderProductName;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getApplyNum() {
		return applyNum;
	}

	public void setApplyNum(String applyNum) {
		this.applyNum = applyNum;
	}

	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", ordererName=" + ordererName + ", ordererPhone=" + ordererPhone
				+ ", ordererEmail=" + ordererEmail + ", ordererAddress=" + ordererAddress + ", ordererRequest="
				+ ordererRequest + ", orderProductName=" + orderProductName + ", productId=" + productId
				+ ", orderPrice=" + orderPrice + ", orderDate=" + orderDate + ", impUid=" + impUid + ", memberId="
				+ memberId + ", applyNum=" + applyNum + "]";
	}
	
}