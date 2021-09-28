package board.model.vo;

import java.sql.Date;

public class Reply {
	private int replyId;
	private String replyContent;
	private int boardId;
	private String memberId;
	private Date enrollDate;
	private String replyDelete;
	private String boardCategoryName;
	
	
	public Reply() {}


	public Reply(int replyId, String replyContent, int boardId, String memberId, Date enrollDate, String replyDelete,
			String boardCategoryName) {
		super();
		this.replyId = replyId;
		this.replyContent = replyContent;
		this.boardId = boardId;
		this.memberId = memberId;
		this.enrollDate = enrollDate;
		this.replyDelete = replyDelete;
		this.boardCategoryName = boardCategoryName;
	}


	public Reply(int replyId, String replyContent, int boardId, String memberId, Date enrollDate, String replyDelete) {
		super();
		this.replyId = replyId;
		this.replyContent = replyContent;
		this.boardId = boardId;
		this.memberId = memberId;
		this.enrollDate = enrollDate;
		this.replyDelete = replyDelete;
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


	public int getBoardId() {
		return boardId;
	}


	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
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


	public String getBoardCategoryName() {
		return boardCategoryName;
	}


	public void setBoardCategoryName(String boardCategoryName) {
		this.boardCategoryName = boardCategoryName;
	}


	@Override
	public String toString() {
		return "Reply [replyId=" + replyId + ", replyContent=" + replyContent + ", boardId=" + boardId + ", memberId="
				+ memberId + ", enrollDate=" + enrollDate + ", replyDelete=" + replyDelete + ", boardCategoryName="
				+ boardCategoryName + "]";
	}

	
	
	
}
