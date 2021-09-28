package board.model.vo;

import java.sql.Date;

public class CartWhole {
	private int cartId;
	private int cartProductAmount;
	private int productId;
	private String memberId;
	private String cartDelete;
	private Date cartEnrollDate;
	private int productOptionId;
	private String productBrand;
	private String productName;
	private String productOptionValue;
	private int productOptionAmount;
	private int productPrice;
	private int productDeliveryFee;
	
	public CartWhole() {}

	public CartWhole(int cartId, int cartProductAmount, int productId, String memberId, String cartDelete,
			Date cartEnrollDate, int productOptionId, String productBrand, String productName,
			String productOptionValue, int productOptionAmount, int productPrice, int productDeliveryFee) {
		super();
		this.cartId = cartId;
		this.cartProductAmount = cartProductAmount;
		this.productId = productId;
		this.memberId = memberId;
		this.cartDelete = cartDelete;
		this.cartEnrollDate = cartEnrollDate;
		this.productOptionId = productOptionId;
		this.productBrand = productBrand;
		this.productName = productName;
		this.productOptionValue = productOptionValue;
		this.productOptionAmount = productOptionAmount;
		this.productPrice = productPrice;
		this.productDeliveryFee = productDeliveryFee;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getCartProductAmount() {
		return cartProductAmount;
	}

	public void setCartProductAmount(int cartProductAmount) {
		this.cartProductAmount = cartProductAmount;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getCartDelete() {
		return cartDelete;
	}

	public void setCartDelete(String cartDelete) {
		this.cartDelete = cartDelete;
	}

	public Date getCartEnrollDate() {
		return cartEnrollDate;
	}

	public void setCartEnrollDate(Date cartEnrollDate) {
		this.cartEnrollDate = cartEnrollDate;
	}

	public int getProductOptionId() {
		return productOptionId;
	}

	public void setProductOptionId(int productOptionId) {
		this.productOptionId = productOptionId;
	}

	public String getProductBrand() {
		return productBrand;
	}

	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductOptionValue() {
		return productOptionValue;
	}

	public void setProductOptionValue(String productOptionValue) {
		this.productOptionValue = productOptionValue;
	}

	public int getProductOptionAmount() {
		return productOptionAmount;
	}

	public void setProductOptionAmount(int productOptionAmount) {
		this.productOptionAmount = productOptionAmount;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductDeliveryFee() {
		return productDeliveryFee;
	}

	public void setProductDeliveryFee(int productDeliveryFee) {
		this.productDeliveryFee = productDeliveryFee;
	}

	@Override
	public String toString() {
		return "CartWhole [cartId=" + cartId + ", cartProductAmount=" + cartProductAmount + ", productId=" + productId
				+ ", memberId=" + memberId + ", cartDelete=" + cartDelete + ", cartEnrollDate=" + cartEnrollDate
				+ ", productOptionId=" + productOptionId + ", productBrand=" + productBrand + ", productName="
				+ productName + ", productOptionValue=" + productOptionValue + ", productOptionAmount="
				+ productOptionAmount + ", productPrice=" + productPrice + ", productDeliveryFee=" + productDeliveryFee
				+ "]";
	}
	
	
	
}
