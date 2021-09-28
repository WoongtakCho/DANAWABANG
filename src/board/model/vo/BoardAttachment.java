package board.model.vo;

import java.sql.Date;

public class BoardAttachment {
	private int fileId;
	private int fileLevel;		
	private String originName;	
	private String changeName;	
	private int boardId;	
	private String filePath;
	private Date uploadDate;	
	private String fileDelete;
	
	public BoardAttachment() {}
	
	public BoardAttachment(String changeName, int boardId) {
		super();
		this.changeName = changeName;
		this.boardId = boardId;
	}

	public BoardAttachment(int fileId, int fileLevel, String originName, String changeName, int boardId,
			String filePath, Date uploadDate, String fileDelete) {
		super();
		this.fileId = fileId;
		this.fileLevel = fileLevel;
		this.originName = originName;
		this.changeName = changeName;
		this.boardId = boardId;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileDelete = fileDelete;
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getFileDelete() {
		return fileDelete;
	}

	public void setFileDelete(String fileDelete) {
		this.fileDelete = fileDelete;
	}

	@Override
	public String toString() {
		return "BoardAttachment [fileId=" + fileId + ", fileLevel=" + fileLevel + ", originName=" + originName
				+ ", changeName=" + changeName + ", boardId=" + boardId + ", filePath=" + filePath + ", uploadDate="
				+ uploadDate + ", fileDelete=" + fileDelete + "]";
	}
	
	
	
}
