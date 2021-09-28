package board.model.vo;

import java.sql.Date;

public class Board {

   private int boardId;
   private int boardType;      
   private int boardCategoryId;   
   private String boardTitle;
   private String boardContent;
   private int boardCount;
   private Date enrollDate;
   private String boardDelete;
   private String isFirst;
   private String writer;
   private String boardCategoryName;
   private int productId;
   private int replyCount;
   
   public Board() {}

   public Board(int boardId, int boardType, int boardCategoryId, String boardTitle, String boardContent, int boardCount,
      Date enrollDate, String boardDelete, String isFirst, String writer, String boardCategoryName, int productId) {
   super();
   this.boardId = boardId;
   this.boardType = boardType;
   this.boardCategoryId = boardCategoryId;
   this.boardTitle = boardTitle;
   this.boardContent = boardContent;
   this.boardCount = boardCount;
   this.enrollDate = enrollDate;
   this.boardDelete = boardDelete;
   this.isFirst = isFirst;
   this.writer = writer;
   this.boardCategoryName = boardCategoryName;
   this.productId = productId;
   }

   public Board(int boardId, int boardType, int boardCategoryId, String boardTitle, String boardContent, int boardCount,
         Date enrollDate, String boardDelete, String isFirst, String writer, String boardCategoryName) {
      super();
      this.boardId = boardId;
      this.boardType = boardType;
      this.boardCategoryId = boardCategoryId;
      this.boardTitle = boardTitle;
      this.boardContent = boardContent;
      this.boardCount = boardCount;
      this.enrollDate = enrollDate;
      this.boardDelete = boardDelete;
      this.isFirst = isFirst;
      this.writer = writer;
      this.boardCategoryName = boardCategoryName;
      
   }
   
   

   public Board(int boardId, int boardType, int boardCategoryId, String boardTitle, String boardContent, int boardCount,
		Date enrollDate, String boardDelete, String writer, int replyCount) {
	super();
	this.boardId = boardId;
	this.boardType = boardType;
	this.boardCategoryId = boardCategoryId;
	this.boardTitle = boardTitle;
	this.boardContent = boardContent;
	this.boardCount = boardCount;
	this.enrollDate = enrollDate;
	this.boardDelete = boardDelete;
	this.writer = writer;
	this.replyCount = replyCount;
}

public Board(String boardTitle, String boardContent, String writer) {
      super();
      this.boardTitle = boardTitle;
      this.boardContent = boardContent;
      this.writer = writer;
   }

public int getBoardId() {
	return boardId;
}

public void setBoardId(int boardId) {
	this.boardId = boardId;
}

public int getBoardType() {
	return boardType;
}

public void setBoardType(int boardType) {
	this.boardType = boardType;
}

public int getBoardCategoryId() {
	return boardCategoryId;
}

public void setBoardCategoryId(int boardCategoryId) {
	this.boardCategoryId = boardCategoryId;
}

public String getBoardTitle() {
	return boardTitle;
}

public void setBoardTitle(String boardTitle) {
	this.boardTitle = boardTitle;
}

public String getBoardContent() {
	return boardContent;
}

public void setBoardContent(String boardContent) {
	this.boardContent = boardContent;
}

public int getBoardCount() {
	return boardCount;
}

public void setBoardCount(int boardCount) {
	this.boardCount = boardCount;
}

public Date getEnrollDate() {
	return enrollDate;
}

public void setEnrollDate(Date enrollDate) {
	this.enrollDate = enrollDate;
}

public String getBoardDelete() {
	return boardDelete;
}

public void setBoardDelete(String boardDelete) {
	this.boardDelete = boardDelete;
}

public String getIsFirst() {
	return isFirst;
}

public void setIsFirst(String isFirst) {
	this.isFirst = isFirst;
}

public String getWriter() {
	return writer;
}

public void setWriter(String writer) {
	this.writer = writer;
}

public String getBoardCategoryName() {
	return boardCategoryName;
}

public void setBoardCategoryName(String boardCategoryName) {
	this.boardCategoryName = boardCategoryName;
}

public int getProductId() {
	return productId;
}

public void setProductId(int productId) {
	this.productId = productId;
}

public int getReplyCount() {
	return replyCount;
}

public void setReplyCount(int replyCount) {
	this.replyCount = replyCount;
}

@Override
public String toString() {
	return "Board [boardId=" + boardId + ", boardType=" + boardType + ", boardCategoryId=" + boardCategoryId
			+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardCount=" + boardCount
			+ ", enrollDate=" + enrollDate + ", boardDelete=" + boardDelete + ", isFirst=" + isFirst + ", writer="
			+ writer + ", boardCategoryName=" + boardCategoryName + ", productId=" + productId + ", replyCount="
			+ replyCount + "]";
}


   
}






