package board.model.vo;

import java.sql.Date;

public class ProductReply {
	private int productReplyId;
	private String productReplyContent;
	private int productId;
	private String memberId;
	private Date productReplyEnrollDate;
	private String productReplyDelete;
	private String productCategoryReplyName;
	
	public ProductReply() {}

	public ProductReply(int productReplyId, String productReplyContent, int productId, String memberId,
			Date productReplyEnrollDate, String productReplyDelete, String productCategoryReplyName) {
		super();
		this.productReplyId = productReplyId;
		this.productReplyContent = productReplyContent;
		this.productId = productId;
		this.memberId = memberId;
		this.productReplyEnrollDate = productReplyEnrollDate;
		this.productReplyDelete = productReplyDelete;
		this.productCategoryReplyName = productCategoryReplyName;
	}

	public int getProductReplyId() {
		return productReplyId;
	}

	public void setProductReplyId(int productReplyId) {
		this.productReplyId = productReplyId;
	}

	public String getProductReplyContent() {
		return productReplyContent;
	}

	public void setProductReplyContent(String productReplyContent) {
		this.productReplyContent = productReplyContent;
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

	public Date getProductReplyEnrollDate() {
		return productReplyEnrollDate;
	}

	public void setProductReplyEnrollDate(Date productReplyEnrollDate) {
		this.productReplyEnrollDate = productReplyEnrollDate;
	}

	public String getProductReplyDelete() {
		return productReplyDelete;
	}

	public void setProductReplyDelete(String productReplyDelete) {
		this.productReplyDelete = productReplyDelete;
	}

	public String getProductCategoryReplyName() {
		return productCategoryReplyName;
	}

	public void setProductCategoryReplyName(String productCategoryReplyName) {
		this.productCategoryReplyName = productCategoryReplyName;
	}

	@Override
	public String toString() {
		return "ProductReply [productReplyId=" + productReplyId + ", productReplyContent=" + productReplyContent
				+ ", productId=" + productId + ", memberId=" + memberId + ", productReplyEnrollDate="
				+ productReplyEnrollDate + ", productReplyDelete=" + productReplyDelete + ", productCategoryReplyName="
				+ productCategoryReplyName + "]";
	}

	

	
	

	
	

}
