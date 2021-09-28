package board.model.vo;

import java.sql.Date;

public class Product {
	private int productId;
	private String productName;
	private int productCategoryId;
	private int productAmount;
	private String productBrand;
	private int productPrice;
	private double productDiscountRate;
	private int productDeliveryFee;
	private String productContent;
	private String productTip;
	private Date productEnrollDate;
	private String productStatus;
	private String productDelete;
	private String productSize;
	
	public Product() {}

	public Product(int productId, String productName, int productCategoryId, int productAmount, String productBrand,
			int productPrice, double productDiscountRate, int productDeliveryFee, String productContent,
			String productTip, Date productEnrollDate, String productStatus, String productDelete, String productSize) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productCategoryId = productCategoryId;
		this.productAmount = productAmount;
		this.productBrand = productBrand;
		this.productPrice = productPrice;
		this.productDiscountRate = productDiscountRate;
		this.productDeliveryFee = productDeliveryFee;
		this.productContent = productContent;
		this.productTip = productTip;
		this.productEnrollDate = productEnrollDate;
		this.productStatus = productStatus;
		this.productDelete = productDelete;
		this.productSize = productSize;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	public String getProductBrand() {
		return productBrand;
	}

	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public double getProductDiscountRate() {
		return productDiscountRate;
	}

	public void setProductDiscountRate(double productDiscountRate) {
		this.productDiscountRate = productDiscountRate;
	}

	public int getProductDeliveryFee() {
		return productDeliveryFee;
	}

	public void setProductDeliveryFee(int productDeliveryFee) {
		this.productDeliveryFee = productDeliveryFee;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public String getProductTip() {
		return productTip;
	}

	public void setProductTip(String productTip) {
		this.productTip = productTip;
	}

	public Date getProductEnrollDate() {
		return productEnrollDate;
	}

	public void setProductEnrollDate(Date productEnrollDate) {
		this.productEnrollDate = productEnrollDate;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public String getProductDelete() {
		return productDelete;
	}

	public void setProductDelete(String productDelete) {
		this.productDelete = productDelete;
	}

	public String getProductSize() {
		return productSize;
	}

	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productCategoryId="
				+ productCategoryId + ", productAmount=" + productAmount + ", productBrand=" + productBrand
				+ ", productPrice=" + productPrice + ", productDiscountRate=" + productDiscountRate
				+ ", productDeliveryFee=" + productDeliveryFee + ", productContent=" + productContent + ", productTip="
				+ productTip + ", productEnrollDate=" + productEnrollDate + ", productStatus=" + productStatus
				+ ", productDelete=" + productDelete + ", productSize=" + productSize + "]";
	}
	
	
}
