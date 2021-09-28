package board.model.vo;

import java.sql.Date;

public class ProductAttachment {
	private int productFileId;
	private int productFileLevel;		
	private String productOriginName;	
	private String productChangeName;	
	private int productId;	
	private String productFilePath;
	private Date productUploadDate;	
	private String productFileDelete;
	
	public ProductAttachment() {}

	public ProductAttachment(int productFileId, int productFileLevel, String productOriginName,
			String productChangeName, int productId, String productFilePath, Date productUploadDate,
			String productFileDelete) {
		super();
		this.productFileId = productFileId;
		this.productFileLevel = productFileLevel;
		this.productOriginName = productOriginName;
		this.productChangeName = productChangeName;
		this.productId = productId;
		this.productFilePath = productFilePath;
		this.productUploadDate = productUploadDate;
		this.productFileDelete = productFileDelete;
	}

	public int getProductFileId() {
		return productFileId;
	}

	public void setProductFileId(int productFileId) {
		this.productFileId = productFileId;
	}

	public int getProductFileLevel() {
		return productFileLevel;
	}

	public void setProductFileLevel(int productFileLevel) {
		this.productFileLevel = productFileLevel;
	}

	public String getProductOriginName() {
		return productOriginName;
	}

	public void setProductOriginName(String productOriginName) {
		this.productOriginName = productOriginName;
	}

	public String getProductChangeName() {
		return productChangeName;
	}

	public void setProductChangeName(String productChangeName) {
		this.productChangeName = productChangeName;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductFilePath() {
		return productFilePath;
	}

	public void setProductFilePath(String productFilePath) {
		this.productFilePath = productFilePath;
	}

	public Date getProductUploadDate() {
		return productUploadDate;
	}

	public void setProductUploadDate(Date productUploadDate) {
		this.productUploadDate = productUploadDate;
	}

	public String getProductFileDelete() {
		return productFileDelete;
	}

	public void setProductFileDelete(String productFileDelete) {
		this.productFileDelete = productFileDelete;
	}

	@Override
	public String toString() {
		return "ProductAttachment [productFileId=" + productFileId + ", productFileLevel=" + productFileLevel
				+ ", productOriginName=" + productOriginName + ", productChangeName=" + productChangeName
				+ ", productId=" + productId + ", productFilePath=" + productFilePath + ", productUploadDate="
				+ productUploadDate + ", productFileDelete=" + productFileDelete + "]";
	}
	
	
}
