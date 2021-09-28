package board.model.vo;

import java.sql.Date;

public class Cart {
	private int cartId;
	private int cartProductAmount;
	private int productId;
	private String memberId;
	private String cartDelete;
	private Date cartEnrollDate;
	private int productOptionId;
	
	public Cart() {}

	public Cart(int cartId, int cartProductAmount, int productId, String memberId, String cartDelete,
			Date cartEnrollDate, int productOptionId) {
		super();
		this.cartId = cartId;
		this.cartProductAmount = cartProductAmount;
		this.productId = productId;
		this.memberId = memberId;
		this.cartDelete = cartDelete;
		this.cartEnrollDate = cartEnrollDate;
		this.productOptionId = productOptionId;
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

	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", cartProductAmount=" + cartProductAmount + ", productId=" + productId
				+ ", memberId=" + memberId + ", cartDelete=" + cartDelete + ", cartEnrollDate=" + cartEnrollDate
				+ ", productOptionId=" + productOptionId + "]";
	}
	
	 

}
