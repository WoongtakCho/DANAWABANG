package board.model.vo;

import java.sql.Date;

public class MyReply {
	private int boardId;
	private String boardDelete; 
	private String boardCategoryName;
	private int replyId;
	private String replyContent;
	private Date enrollDate;
	private String replyDelete;
	private int productId;
	private int productReplyId;
	private String productReplyContent;
	private String productCategoryReplyName;
	private Date productReplyEnrollDate;
	private String productReplyDelete;
	
	public MyReply() {}

	public MyReply(int boardId, String boardDelete, String boardCategoryName, int replyId, String replyContent,
			Date enrollDate, String replyDelete, int productId, int productReplyId, String productReplyContent,
			String productCategoryReplyName, Date productReplyEnrollDate, String productReplyDelete) {
		super();
		this.boardId = boardId;
		this.boardDelete = boardDelete;
		this.boardCategoryName = boardCategoryName;
		this.replyId = replyId;
		this.replyContent = replyContent;
		this.enrollDate = enrollDate;
		this.replyDelete = replyDelete;
		this.productId = productId;
		this.productReplyId = productReplyId;
		this.productReplyContent = productReplyContent;
		this.productCategoryReplyName = productCategoryReplyName;
		this.productReplyEnrollDate = productReplyEnrollDate;
		this.productReplyDelete = productReplyDelete;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getBoardDelete() {
		return boardDelete;
	}

	public void setBoardDelete(String boardDelete) {
		this.boardDelete = boardDelete;
	}

	public String getBoardCategoryName() {
		return boardCategoryName;
	}

	public void setBoardCategoryName(String boardCategoryName) {
		this.boardCategoryName = boardCategoryName;
	}

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getReplyDelete() {
		return replyDelete;
	}

	public void setReplyDelete(String replyDelete) {
		this.replyDelete = replyDelete;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
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

	public String getProductCategoryReplyName() {
		return productCategoryReplyName;
	}

	public void setProductCategoryReplyName(String productCategoryReplyName) {
		this.productCategoryReplyName = productCategoryReplyName;
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

	@Override
	public String toString() {
		return "MyReply [boardId=" + boardId + ", boardDelete=" + boardDelete + ", boardCategoryName="
				+ boardCategoryName + ", replyId=" + replyId + ", replyContent=" + replyContent + ", enrollDate="
				+ enrollDate + ", replyDelete=" + replyDelete + ", productId=" + productId + ", productReplyId="
				+ productReplyId + ", productReplyContent=" + productReplyContent + ", productCategoryReplyName="
				+ productCategoryReplyName + ", productReplyEnrollDate=" + productReplyEnrollDate
				+ ", productReplyDelete=" + productReplyDelete + "]";
	}

	

	
	
	
	

}
