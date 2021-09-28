package board.model.vo;

import java.sql.Date;

public class ProductOption {
	private int productOptionId;
	private String productOptionValue;
	private String productOptionStatus;
	private String productOptionDelete;
	private int productId;
	private int productOptionAmount;
	
	public ProductOption() {}

	public ProductOption(int productOptionId, String productOptionValue,
			String productOptionStatus, String productOptionDelete, int productId, int productOptionAmount) {
		super();
		this.productOptionId = productOptionId;
		this.productOptionValue = productOptionValue;
		this.productOptionStatus = productOptionStatus;
		this.productOptionDelete = productOptionDelete;
		this.productId = productId;
		this.productOptionAmount = productOptionAmount;
	}

	public int getProductOptionId() {
		return productOptionId;
	}

	public void setProductOptionId(int productOptionId) {
		this.productOptionId = productOptionId;
	}

	public String getProductOptionValue() {
		return productOptionValue;
	}

	public void setProductOptionValue(String productOptionValue) {
		this.productOptionValue = productOptionValue;
	}

	public String getProductOptionStatus() {
		return productOptionStatus;
	}

	public void setProductOptionStatus(String productOptionStatus) {
		this.productOptionStatus = productOptionStatus;
	}

	public String getProductOptionDelete() {
		return productOptionDelete;
	}

	public void setProductOptionDelete(String productOptionDelete) {
		this.productOptionDelete = productOptionDelete;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getProductOptionAmount() {
		return productOptionAmount;
	}

	public void setProductOptionAmount(int productOptionAmount) {
		this.productOptionAmount = productOptionAmount;
	}

	@Override
	public String toString() {
		return "ProductOption [productOptionId=" + productOptionId + ", productOptionValue=" + productOptionValue + ", productOptionStatus="
				+ productOptionStatus + ", productOptionDelete=" + productOptionDelete + ", productId=" + productId
				+ ", productOptionAmount=" + productOptionAmount + "]";
	}

	
}
