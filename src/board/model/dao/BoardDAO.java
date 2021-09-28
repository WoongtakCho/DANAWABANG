package board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Board;
import board.model.vo.BoardAttachment;
import board.model.vo.Cart;
import board.model.vo.CartWhole;
import board.model.vo.Orders;
import board.model.vo.PageInfo;
import board.model.vo.Product;
import board.model.vo.ProductAttachment;
import board.model.vo.ProductOption;
import board.model.vo.ProductReply;
import board.model.vo.Reply;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class BoardDAO {
   
   private Properties prop = new Properties();
   public BoardDAO() {
      String fileName = MemberDAO.class.getResource("/sql/board/board-query.properties").getPath();
      try {
         prop.load(new FileReader(fileName));
      } catch (IOException e) {
         e.printStackTrace();
      }
   }
   
   ////////////////// 일반게시판 전체///////////////////// 
  public int getBListCount(Connection conn, Board board) {
     PreparedStatement pstmt = null;
     ResultSet rset = null;
     int listCount = 0;

     String query = prop.getProperty("getBListCount");
     try {
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, board.getBoardCategoryId());
        pstmt.setInt(2, board.getBoardType());
        rset = pstmt.executeQuery();

        if (rset.next()) {
           listCount = rset.getInt(1);
        }

     } catch (SQLException e) {
        e.printStackTrace();
     } finally {
        close(rset);
        close(pstmt);
     }

     return listCount;
  }

  public int getBsListCount(Connection conn, Board board, Board board2) {
     PreparedStatement pstmt = null;
     ResultSet rset = null;
     int listCount = 0;

     String query = prop.getProperty("getBsListCount");
     try {
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, board.getBoardCategoryId());
        pstmt.setInt(2, board2.getBoardCategoryId());
        pstmt.setInt(3, board.getBoardType());
        rset = pstmt.executeQuery();
        if (rset.next()) {
           listCount = rset.getInt(1);
        }
     } catch (SQLException e) {
        e.printStackTrace();
     } finally {
        close(rset);
        close(pstmt);
     }
     return listCount;
  }
  
     public int insertBoard(Connection conn, Board b) {
           PreparedStatement pstmt = null;
           int result = 0;

           String query = prop.getProperty("insertBoard");
           try {
              pstmt = conn.prepareStatement(query);
              pstmt.setInt(1, b.getBoardType());
              pstmt.setInt(2, b.getBoardCategoryId());
              pstmt.setString(3, b.getBoardTitle());
              pstmt.setString(4, b.getBoardContent());
              pstmt.setString(5, b.getIsFirst());
              pstmt.setString(6, b.getBoardCategoryName());
              pstmt.setString(7, b.getWriter());
              
              result = pstmt.executeUpdate();
           } catch (SQLException e) {
              e.printStackTrace();
           } finally {
              close(pstmt);
           }
           
           return result;
        }
     
     public int updateCount(Connection conn, int bId) {
         PreparedStatement pstmt = null;
         int result = 0;
         
         String query = prop.getProperty("updateCount");
         
         try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, bId);
            
            result = pstmt.executeUpdate();
         } catch (SQLException e) {
            e.printStackTrace();
         } finally{
            close(pstmt);
         }
         
         return result;
      }
     
     public int updateBoard(Connection conn, Board b) {
           PreparedStatement pstmt = null;
           int result = 0;
           
           String query = prop.getProperty("updateBoard");
           
           try {
              pstmt = conn.prepareStatement(query);
              pstmt.setInt(1, b.getBoardCategoryId());
              pstmt.setString(2, b.getBoardTitle());
              pstmt.setString(3, b.getBoardContent());
              pstmt.setString(4, b.getIsFirst());               
              pstmt.setString(5, b.getBoardCategoryName());
              pstmt.setInt(6, b.getBoardId());
              
              result = pstmt.executeUpdate();
           } catch (SQLException e) {
              e.printStackTrace();
           } finally {
              close(pstmt);
           }
           return result;
        } 
     
     public int deleteBoard(Connection conn, int bId) {
           PreparedStatement pstmt = null;
           int result = 0;
           
           String query = prop.getProperty("deleteBoard");
           
           try {
              pstmt = conn.prepareStatement(query);
              pstmt.setInt(1, bId);
              result = pstmt.executeUpdate();
           } catch (SQLException e) {
              e.printStackTrace();
           } finally {
              close(pstmt);
           }
          return result;
        }   
     
     public int deleteBoards(Connection conn, String[] board) {
        PreparedStatement pstmt = null;
        int result = 0;
        
        String query = prop.getProperty("deleteBoard");
        
        try {
           pstmt = conn.prepareStatement(query);

           for(int i = 0 ; i < board.length ; i++) {
              pstmt.setInt(1, Integer.parseInt(board[i]));
              result += pstmt.executeUpdate();
           }               
        } catch (SQLException e) {
           e.printStackTrace();
        } finally {
           close(pstmt);
        }
        return result;
     }
     
     //////////////////사진게시판 전체///////////////////// 
     
     public int insertThumbnail(Connection conn, ArrayList<BoardAttachment> fileList) {
 		PreparedStatement pstmt = null;
 		int result = 0;
 			
 		String query = prop.getProperty("insertThumbnail");	

 		try {
 			for(int i = 0; i < fileList.size(); i++) {
 				BoardAttachment ba = fileList.get(i);
 				
 				pstmt = conn.prepareStatement(query);
 				pstmt.setInt(1, ba.getFileLevel());
 				pstmt.setString(2, ba.getOriginName());	
 				pstmt.setString(3, ba.getChangeName());
 				pstmt.setString(4, ba.getFilePath());
 							
 				result += pstmt.executeUpdate();	
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		} finally {
 			close(pstmt);
 		}
 		
 		return result;
 	}
     
     public ArrayList<BoardAttachment> selectThumbnail(Connection conn, int bId) {
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		ArrayList<BoardAttachment> list = new ArrayList<BoardAttachment>();
 		
 		String query = prop.getProperty("selectThumbnail");	
 		
 		try {
 			pstmt = conn.prepareStatement(query);
 			pstmt.setInt(1, bId);
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()) { 
 				list.add(new BoardAttachment(rset.getInt("BOARD_FILE_ID"),
 										rset.getInt("BOARD_FILE_LEVEL"),
 										rset.getString("BOARD_ORIGIN_NAME"),
 										rset.getString("BOARD_CHANGE_NAME"),
 										rset.getInt("BOARD_ID"),
 										rset.getString("BOARD_FILE_PATH"),
 										rset.getDate("BOARD_UPLOAD_DATE"),
 										rset.getString("BOARD_FILE_DELETE")));
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		} finally {
 			close(rset);
 			close(pstmt);
 		}
 		
 		return list;
 	}

 	public int updateThumbnail(Connection conn, ArrayList<BoardAttachment> fileList) {
 		PreparedStatement pstmt = null;
 		int result = 0;
 			
 		String query = prop.getProperty("updateThumbnail");	

 		try {
 			for(int i = 0; i < fileList.size(); i++) {
 				BoardAttachment ba = fileList.get(i);
 				
 				pstmt = conn.prepareStatement(query);
 				pstmt.setInt(1, ba.getFileLevel());
 				pstmt.setString(2, ba.getOriginName());	
 				pstmt.setString(3, ba.getChangeName());
 				pstmt.setString(4, ba.getFilePath());
 				pstmt.setInt(5, ba.getFileId());
 							
 				result += pstmt.executeUpdate();	
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		} finally {
 			close(pstmt);
 		}
 		
 		return result;
 	}

 	public int deleteThumbnail(Connection conn,  int bId) {
 		PreparedStatement pstmt = null;
 		int result = 0;
 			
 		String query = prop.getProperty("deleteThumbnail");	

 		try {
 				pstmt = conn.prepareStatement(query);
 				pstmt.setInt(1, bId);
 				
 				result = pstmt.executeUpdate();	
 			
 		} catch (SQLException e) {
 			e.printStackTrace();
 		} finally {
 			close(pstmt);
 		}
 		
 		return result;
 	}
 	
     /////////////////////FAQ//////////////////////
     public ArrayList<Board> selectFList(Connection conn, PageInfo pi) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        ArrayList<Board> list = new ArrayList<Board>();
        
        String query = prop.getProperty("selectFList");
        
        int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
        int endRow = startRow + pi.getBoardLimit() - 1;
        
        try {
           pstmt = conn.prepareStatement(query);
           pstmt.setInt(1, startRow);
           pstmt.setInt(2, endRow);
           
           rset = pstmt.executeQuery();
           
           while(rset.next()) {
              list.add(new Board(rset.getInt("Board_id"), rset.getInt("board_type"), 
                    rset.getInt("board_category_id"), rset.getString("board_title"), 
                    rset.getString("board_content"), rset.getInt("board_count"),
                    rset.getDate("board_enroll_date"), rset.getString("board_delete"),
                    rset.getString("is_first"), rset.getString("member_id"), rset.getString("board_category_name")));
           }
        } catch (SQLException e) {
           e.printStackTrace();
        } finally {
           close(rset);
           close(pstmt);
        }
        
        
        return list;
     }
  
     public Board selectFBoard(Connection conn, int bId) {
        PreparedStatement pstmt = null;
        ResultSet rset= null;
        Board board = null;
        
        String query = prop.getProperty("selectFBoard");
        try {
           pstmt = conn.prepareStatement(query);
           pstmt.setInt(1, bId);
           rset = pstmt.executeQuery();
           
           if(rset.next()) {
              board = new Board(rset.getInt("Board_id"), rset.getInt("board_type"), 
                    rset.getInt("board_category_id"), rset.getString("board_title"), 
                    rset.getString("board_content"), rset.getInt("board_count"),
                    rset.getDate("board_enroll_date"), rset.getString("board_delete"),
                    rset.getString("is_first"), rset.getString("member_id"), rset.getString("board_category_name"));
           }
        } catch (SQLException e) {
           e.printStackTrace();
        } finally {
           close(rset);
           close(pstmt);
        }   
        return board;
     }
   
     public ArrayList<Board> selectFList(Connection conn) {
        Statement stmt = null;
        ResultSet rset = null;
        ArrayList<Board> list = new ArrayList<Board>();
        
        String query = prop.getProperty("selectFaqListA");
        
        try {
           stmt = conn.createStatement();
           rset = stmt.executeQuery(query);
           while(rset.next()) {
              list.add(new Board(rset.getInt("Board_id"), rset.getInt("board_type"), 
                    rset.getInt("board_category_id"), rset.getString("board_title"), 
                    rset.getString("board_content"), rset.getInt("board_count"),
                    rset.getDate("board_enroll_date"), rset.getString("board_delete"),
                    rset.getString("is_first"), rset.getString("member_id"), rset.getString("board_category_name")));
           }
        } catch (SQLException e) {
           e.printStackTrace();
        } finally {
           close(rset);
           close(stmt);
        }
        
        
        return list;
     }
     
      /////////////////////공지사항//////////////////////
   
   public int getFNListCount(Connection conn) {
      Statement stmt = null;
      ResultSet rset = null;
      int fNListCount = 0;
      
      String query = prop.getProperty("getFNListCount");
      try {
         stmt = conn.createStatement();
         rset = stmt.executeQuery(query);

         if(rset.next()) {
            fNListCount = rset.getInt(1);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(stmt);
      }
      
      return fNListCount;
   }
   
   public ArrayList<Board> selectNList(Connection conn, PageInfo pi) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<Board> nList = new  ArrayList<Board>();
      
      String query = prop.getProperty("selectNList");

      int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
      int endRow = startRow + pi.getBoardLimit() - 1;   
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            Board  b = new Board(rset.getInt("BOARD_ID"), 
                           rset.getInt("BOARD_TYPE"),
                           rset.getInt("BOARD_CATEGORY_ID"),
                           rset.getString("BOARD_TITLE"),
                           rset.getString("BOARD_CONTENT"),
                           rset.getInt("BOARD_COUNT"),
                           rset.getDate("BOARD_ENROLL_DATE"),
                           rset.getString("BOARD_DELETE"),
                           rset.getString("IS_FIRST"),
                           rset.getString("MEMBER_ID"),
                           rset.getString("BOARD_CATEGORY_NAME"));
            nList.add(b);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return nList;
   }
  
   public Board selectNBoard(Connection conn, int bId) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      Board board = null;
      
      String query = prop.getProperty("selectNBoard");
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, bId);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            board = new Board(rset.getInt("BOARD_ID"), 
                  rset.getInt("BOARD_TYPE"),
                  rset.getInt("BOARD_CATEGORY_ID"),
                  rset.getString("BOARD_TITLE"),
                  rset.getString("BOARD_CONTENT"),
                  rset.getInt("BOARD_COUNT"),
                  rset.getDate("BOARD_ENROLL_DATE"),
                  rset.getString("BOARD_DELETE"),
                  rset.getString("IS_FIRST"),
                  rset.getString("MEMBER_ID"),
                  rset.getString("BOARD_CATEGORY_NAME"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally{
         close(rset);
         close(pstmt);
      }
      
      return board;
   }
  
   ///////////////////회원관리////////////////////
   public ArrayList<Member> selectMList(Connection conn, PageInfo pi) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<Member> list = new ArrayList<Member>();
      
      String query = prop.getProperty("selectMList");
      
      int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
      int endRow = startRow + pi.getBoardLimit() - 1;
      
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            Member m = new Member(rset.getString("member_name"), rset.getString("member_id"), rset.getString("member_password"),
                           rset.getString("member_email"), rset.getString("member_phone"), rset.getString("member_address"),
                           rset.getString("is_admin"), rset.getString("admin_code"), rset.getString("member_delete"), rset.getDate("member_enroll_date"));
            list.add(m);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }   finally {
         close(rset);
         close(pstmt);
      }
      return list;
   }

   public int getMListCount(Connection conn) {
      Statement stmt = null;
      ResultSet rset = null;
      int result = 0;
      
      String query = prop.getProperty("getMListCount");
      
      try {
         stmt = conn.createStatement();
         rset = stmt.executeQuery(query);
         
         if(rset.next()) {
            result = rset.getInt(1);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(stmt);
      }
      return result;
   }
   
   /////////////////// 셀프가이드 /////////////////////

	public ArrayList<Board> selectSList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();

		String query = prop.getProperty("selectSList");

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Board(rset.getInt("Board_id"), rset.getInt("board_type"), rset.getInt("board_category_id"),
						rset.getString("board_title"), rset.getString("board_content"), rset.getInt("board_count"),
						rset.getDate("board_enroll_date"), rset.getString("board_delete"), rset.getString("is_first"),
						rset.getString("member_id"), rset.getString("board_category_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public Board selectSBoard(Connection conn, int bId) {
		  PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      Board board = null;
	      
	      String query = prop.getProperty("selectSBoard");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, bId);
	         
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            board = new Board(rset.getInt("BOARD_ID"), 
	                  rset.getInt("BOARD_TYPE"),
	                  rset.getInt("BOARD_CATEGORY_ID"),
	                  rset.getString("BOARD_TITLE"),
	                  rset.getString("BOARD_CONTENT"),
	                  rset.getInt("BOARD_COUNT"),
	                  rset.getDate("BOARD_ENROLL_DATE"),
	                  rset.getString("BOARD_DELETE"),
	                  rset.getString("IS_FIRST"),
	                  rset.getString("MEMBER_ID"),
	                  rset.getString("BOARD_CATEGORY_NAME"));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally{
	         close(rset);
	         close(pstmt);
	      }
	      
	      return board;
	}

	public ArrayList selectSList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();	
		
		String query = prop.getProperty("selectSListM");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			 
			while (rset.next()) {
				list.add(new Board(rset.getInt("Board_id"), rset.getInt("board_type"), rset.getInt("board_category_id"),
						rset.getString("board_title"), rset.getString("board_content"), rset.getInt("board_count"),
						rset.getDate("board_enroll_date"), rset.getString("board_delete"), rset.getString("is_first"),
						rset.getString("member_id"), rset.getString("board_category_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	////////////////프로모션///////////////////
	public ArrayList<Board> selectPList(Connection conn, PageInfo pi) {
	  PreparedStatement pstmt = null;
	  ResultSet rset = null;
	  ArrayList<Board> list = new ArrayList<Board>();
	  
	  String query = prop.getProperty("selectPList");
	  
	  int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	  int endRow = startRow + pi.getBoardLimit() - 1;
	  
	  try {
	     pstmt = conn.prepareStatement(query);
	     pstmt.setInt(1, startRow);
	     pstmt.setInt(2, endRow);
	     
	     rset = pstmt.executeQuery();
	     
	     while(rset.next()) {
	        list.add(new Board(rset.getInt("Board_id"), rset.getInt("board_type"), 
	              rset.getInt("board_category_id"), rset.getString("board_title"), 
	              rset.getString("board_content"), rset.getInt("board_count"),
	              rset.getDate("board_enroll_date"), rset.getString("board_delete"),
	              rset.getString("is_first"), rset.getString("member_id"), rset.getString("board_category_name")));
	     }
	  } catch (SQLException e) {
	     e.printStackTrace();
	  } finally {
	     close(rset);
	     close(pstmt);
	  }   
	
	  return list;
	}
	
	public ArrayList<BoardAttachment> selectThumbnailList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<BoardAttachment> list = new ArrayList<BoardAttachment>();
	
		String query = prop.getProperty("selectThumbnailList");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
	
			while (rset.next()) {
				list.add(new BoardAttachment(rset.getInt("BOARD_FILE_ID"), rset.getInt("BOARD_FILE_LEVEL"),
						rset.getString("BOARD_ORIGIN_NAME"), rset.getString("BOARD_CHANGE_NAME"), rset.getInt("BOARD_ID"),
						rset.getString("BOARD_FILE_PATH"), rset.getDate("BOARD_UPLOAD_DATE"),
						rset.getString("BOARD_FILE_DELETE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	
	}
	
	public Board selectPBoard(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board board = null;
	
		String query = prop.getProperty("selectPBoard");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			rset = pstmt.executeQuery();
	
			if (rset.next()) {
				board = new Board(rset.getInt("Board_id"), rset.getInt("board_type"), rset.getInt("board_category_id"),
						rset.getString("board_title"), rset.getString("board_content"), rset.getInt("board_count"),
						rset.getDate("board_enroll_date"), rset.getString("board_delete"), rset.getString("is_first"),
						rset.getString("member_id"), rset.getString("board_category_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return board;
	}
	
	/////////////////// 상품 관리 //////////////////////
	// 상품관리 게시판 전체글 개수 조회
	public int getProductCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		String query = prop.getProperty("getProductCount");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	// 상품관리 게시판 전체리스트 조회
	public ArrayList<Product> selectProductList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();

		String query = prop.getProperty("selectProductList");

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Product(rset.getInt("PRODUCT_id"), rset.getString("PRODUCT_NAME"),
						rset.getInt("PRODUCT_category_id"), rset.getInt("PRODUCT_AMOUNT"),
						rset.getString("PRODUCT_BRAND"), rset.getInt("PRODUCT_PRICE"),
						rset.getDouble("PRODUCT_DISCOUNT_RATE"), rset.getInt("PRODUCT_DELIVERY_FEE"),
						rset.getString("PRODUCT_CONTENT"), rset.getString("PRODUCT_TIP"),
						rset.getDate("PRODUCT_enroll_date"), rset.getString("PRODUCT_STATUS"),
						rset.getString("PRODUCT_delete"), rset.getString("PRODUCT_SIZE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	// 상품관리 게시판 등록
	public int insertProduct(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertProduct");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getProductName());
			pstmt.setInt(2, p.getProductCategoryId());
			pstmt.setInt(3, p.getProductAmount());
			pstmt.setString(4, p.getProductBrand());
			pstmt.setInt(5, p.getProductPrice());
			pstmt.setDouble(6, p.getProductDiscountRate());
			pstmt.setInt(7, p.getProductDeliveryFee());
			pstmt.setString(8, p.getProductContent());
			pstmt.setString(9, p.getProductTip());
			pstmt.setString(10, p.getProductSize());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 상품게시판 사진 등록
	public int insertProductThumbnail(Connection conn, ArrayList<ProductAttachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertProductThumbnail");
		try {
			for (int i = 0; i < fileList.size(); i++) {
				ProductAttachment a = fileList.get(i);

				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, a.getProductFileLevel());
				pstmt.setString(2, a.getProductOriginName());
				pstmt.setString(3, a.getProductChangeName());
				pstmt.setString(4, a.getProductFilePath());

				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 상품관리 옵션 등록
	public int insertProductOption(Connection conn, ArrayList<ProductOption> optionList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertProductOption");
		try {
			for (int i = 0; i < optionList.size(); i++) {
				ProductOption po = optionList.get(i);

				pstmt = conn.prepareStatement(query);

				pstmt.setString(1, po.getProductOptionValue());
				pstmt.setInt(2, po.getProductOptionAmount());

				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 상품 게시판 상세내용 글 보기
	public Product selectProductBoard(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product product = null;

		String query = prop.getProperty("selectProductBoard");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				product = new Product(rset.getInt("PRODUCT_id"), rset.getString("PRODUCT_NAME"),
						rset.getInt("PRODUCT_category_id"), rset.getInt("PRODUCT_AMOUNT"),
						rset.getString("PRODUCT_BRAND"), rset.getInt("PRODUCT_PRICE"),
						rset.getDouble("PRODUCT_DISCOUNT_RATE"), rset.getInt("PRODUCT_DELIVERY_FEE"),
						rset.getString("PRODUCT_CONTENT"), rset.getString("PRODUCT_TIP"),
						rset.getDate("PRODUCT_enroll_date"), rset.getString("PRODUCT_STATUS"),
						rset.getString("PRODUCT_delete"), rset.getString("PRODUCT_SIZE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return product;
	}

	public ArrayList<ProductAttachment> selectProductThumbnail(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductAttachment> list = null;

		String query = prop.getProperty("selectProductThumbnail");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			rset = pstmt.executeQuery();

			list = new ArrayList<ProductAttachment>();

			while (rset.next()) {
				list.add(new ProductAttachment(rset.getInt("PRODUCT_FILE_ID"), rset.getInt("PRODUCT_FILE_LEVEL"),
						rset.getString("PRODUCT_ORIGIN_NAME"), rset.getString("PRODUCT_CHANGE_NAME"),
						rset.getInt("PRODUCT_ID"), rset.getString("PRODUCT_FILE_PATH"),
						rset.getDate("PRODUCT_UPLOAD_DATE"), rset.getString("PRODUCT_FILE_DELETE")));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<ProductOption> selectProductOption(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductOption> list = null;

		String query = prop.getProperty("selectProductOption");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			rset = pstmt.executeQuery();

			list = new ArrayList<ProductOption>();

			while (rset.next()) {
				list.add(new ProductOption(rset.getInt("PRODUCT_OPTION_ID"), rset.getString("PRODUCT_OPTION_VALUE"), rset.getString("PRODUCT_OPTION_STATUS"),
						rset.getString("PRODUCT_OPTION_DELETE"), rset.getInt("PRODUCT_ID"),
						rset.getInt("PRODUCT_OPTION_AMOUNT")));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int updateProductBoard(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateProductBoard");

		System.out.println(p.getProductContent());
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getProductName());
			pstmt.setInt(2, p.getProductCategoryId());
			pstmt.setInt(3, p.getProductAmount());
			pstmt.setString(4, p.getProductBrand());
			pstmt.setInt(5, p.getProductPrice());
			pstmt.setDouble(6, p.getProductDiscountRate());
			pstmt.setInt(7, p.getProductDeliveryFee());
			pstmt.setString(8, p.getProductContent());
			pstmt.setString(9, p.getProductTip());
			pstmt.setString(10, p.getProductStatus());
			pstmt.setString(11, p.getProductSize());
			pstmt.setInt(12, p.getProductId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateProductThumbnail(Connection conn, ArrayList<ProductAttachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateProductThumbnail");

		System.out.println(fileList.get(0).getProductFileId());
		
		try {
			for (int i = 0; i < fileList.size(); i++) {
				ProductAttachment pa = fileList.get(i);

				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, pa.getProductFileLevel());
				pstmt.setString(2, pa.getProductOriginName());
				pstmt.setString(3, pa.getProductChangeName());
				pstmt.setString(4, pa.getProductFilePath());
				pstmt.setInt(5, pa.getProductFileId());

				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateProductOption(Connection conn, ArrayList<ProductOption> optionList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateProductOption");
		try {
			for (int i = 0; i < optionList.size(); i++) {
				ProductOption po = optionList.get(i);

				pstmt = conn.prepareStatement(query);

				pstmt.setString(1, po.getProductOptionValue());
				pstmt.setInt(2, po.getProductOptionAmount());
				pstmt.setInt(3, po.getProductOptionId());

				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteProductBoard(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteProductBoard");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteProductThumbnail(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteProductThumbnail");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteProductOption(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteProductOption");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteProductBoards(Connection conn, String[] board) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteProductBoard");

		try {
			pstmt = conn.prepareStatement(query);
			for (int i = 0; i < board.length; i++) {
				pstmt.setInt(1, Integer.parseInt(board[i]));

				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
///////////////////////////장바구니//////////////////////////////////
//장바구니 전체 개수 조회
	
	 // 장바구니 전체리스트 조회(페이징x)
    public ArrayList<Cart> selectCartList(Connection conn, String id) {
       PreparedStatement stmt = null;
       ResultSet rset = null;
       ArrayList<Cart> list = new ArrayList<Cart>();

       String query = prop.getProperty("selectCartList");

       try {
          stmt = conn.prepareStatement(query); 
          rset = stmt.executeQuery();
          while (rset.next()) {
             list.add(new Cart(rset.getInt("CART_ID"), rset.getInt("CART_PRODUCT_AMOUNT"),
                   rset.getInt("PRODUCT_ID"), rset.getString("MEMBER_ID"),
                   rset.getString("CART_DELETE"), rset.getDate("CART_ENROLL_DATE"),
                  rset.getInt("PRODUCT_OPTION_ID")));
          }
       } catch (SQLException e) {
          e.printStackTrace();
       } finally {
          close(rset);
          close(stmt);
       }

       return list;
    }
    
	public int getCartCount(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;

		String query = prop.getProperty("getCartCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	//장바구니 전체리스트 조회(페이징x)
	public ArrayList<Cart> selectCartList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Cart> list = new ArrayList<Cart>();

		String query = prop.getProperty("selectCartList");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while (rset.next()) {
				list.add(new Cart(rset.getInt("CART_ID"), rset.getInt("CART_PRODUCT_AMOUNT"), rset.getInt("PRODUCT_ID"),
						rset.getString("MEMBER_ID"), rset.getString("CART_DELETE"), rset.getDate("CART_ENROLL_DATE"),
						rset.getInt("PRODUCT_OPTION_ID")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}

	//장바구니 전체리스트 조회(페이징o)
	public ArrayList<CartWhole> selectCartListC(Connection conn, PageInfo pi, String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CartWhole> list = new ArrayList<CartWhole>();

		String query = prop.getProperty("selectCartListC");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new CartWhole(rset.getInt("CART_ID"), rset.getInt("CART_PRODUCT_AMOUNT"),
						rset.getInt("PRODUCT_ID"), rset.getString("MEMBER_ID"), rset.getString("CART_DELETE"),
						rset.getDate("CART_ENROLL_DATE"), rset.getInt("PRODUCT_OPTION_ID"),
						rset.getString("PRODUCT_BRAND"), rset.getString("PRODUCT_NAME"),
						rset.getString("PRODUCT_OPTION_VALUE"), rset.getInt("PRODUCT_OPTION_AMOUNT"),
						rset.getInt("PRODUCT_PRICE"), rset.getInt("PRODUCT_DELIVERY_FEE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	//상품 전체 리스트 조회
	public ArrayList<Product> selectProductListC(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();

		String query = prop.getProperty("selectProductListC");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			while (rset.next()) {
				list.add(new Product(rset.getInt("PRODUCT_id"), rset.getString("PRODUCT_NAME"),
						rset.getInt("PRODUCT_category_id"), rset.getInt("PRODUCT_AMOUNT"),
						rset.getString("PRODUCT_BRAND"), rset.getInt("PRODUCT_PRICE"),
						rset.getDouble("PRODUCT_DISCOUNT_RATE"), rset.getInt("PRODUCT_DELIVERY_FEE"),
						rset.getString("PRODUCT_CONTENT"), rset.getString("PRODUCT_TIP"),
						rset.getDate("PRODUCT_enroll_date"), rset.getString("PRODUCT_STATUS"),
						rset.getString("PRODUCT_delete"), rset.getString("PRODUCT_SIZE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	//상품 옵션 전체 리스트 조회
	public ArrayList<ProductOption> selectProductOptionListC(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ProductOption> list = new ArrayList<ProductOption>();

		String query = prop.getProperty("selectProductOptionListC");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			while (rset.next()) {
				list.add(new ProductOption(rset.getInt("PRODUCT_OPTION_ID"), rset.getString("PRODUCT_OPTION_VALUE"), rset.getString("PRODUCT_OPTION_STATUS"),
						rset.getString("PRODUCT_OPTION_DELETE"), rset.getInt("PRODUCT_ID"),
						rset.getInt("PRODUCT_OPTION_AMOUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	// 특정 장바구니 가져오기
	public CartWhole selectCartWhole(Connection conn, int cId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		CartWhole cw = null;
		
		String query = prop.getProperty("selectCartWhole");
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				cw = new CartWhole(rset.getInt("CART_ID"), rset.getInt("CART_PRODUCT_AMOUNT"),
						rset.getInt("PRODUCT_ID"), rset.getString("MEMBER_ID"), rset.getString("CART_DELETE"),
						rset.getDate("CART_ENROLL_DATE"), rset.getInt("PRODUCT_OPTION_ID"),
						rset.getString("PRODUCT_BRAND"), rset.getString("PRODUCT_NAME"),
						rset.getString("PRODUCT_OPTION_VALUE"), rset.getInt("PRODUCT_OPTION_AMOUNT"),
						rset.getInt("PRODUCT_PRICE"), rset.getInt("PRODUCT_DELIVERY_FEE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cw;
	}
	
	//장바구니 등록
	public int insertCart(Connection conn, Cart c) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertCart");
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, c.getCartProductAmount());
			pstmt.setInt(2, c.getProductId());
			pstmt.setString(3, c.getMemberId());
			pstmt.setInt(4, c.getProductOptionId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int updateCart(Connection conn, Cart c) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateCart");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, c.getCartProductAmount());
			pstmt.setInt(2, c.getProductOptionId());
			pstmt.setInt(3, c.getCartId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteCart(Connection conn, int cId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteCart");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteCarts(Connection conn, String[] board) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteCart");

		try {
			pstmt = conn.prepareStatement(query);
			for (int i = 0; i < board.length; i++) {
				pstmt.setInt(1, Integer.parseInt(board[i]));

				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/////////////////////////////////////////////주문/////////////////////////////////////
	public int insertOrder(Connection conn, Orders order) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertOrder");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, order.getOrderId());
			pstmt.setString(2, order.getOrdererName());
			pstmt.setString(3, order.getOrdererPhone());
			pstmt.setString(4, order.getOrdererEmail());
			pstmt.setString(5, order.getOrdererAddress());
			pstmt.setString(6, order.getOrdererRequest());
			pstmt.setString(7, order.getOrderProductName());
			pstmt.setInt(8, order.getProductId());
			pstmt.setInt(9, order.getOrderPrice());
			pstmt.setString(10, order.getImpUid());
			pstmt.setString(11, order.getMemberId());
			pstmt.setString(12, order.getApplyNum());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	// 주문완료 후에 상품의 재고를 구매한 수량만큼 깍기
	public int sold(Connection conn, Cart c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("sold");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, c.getCartProductAmount());
			pstmt.setInt(2, c.getProductOptionId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 카트에 담긴 상품 정보를 가져옴
	public Cart selectCart(Connection conn, int cId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Cart c = null;
		
		String query = prop.getProperty("selectCart");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Cart(rset.getInt("cart_id"), rset.getInt("cart_product_amount"), rset.getInt("product_id"), rset.getString("member_id"),
								rset.getString("cart_delete"), rset.getDate("cart_enroll_date"), rset.getInt("product_option_id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return c;
	}
	
	/////////////////////메인페이지 ////////////////////////
	
	// Promotion, SelfGuide 게시글 전체 가져오기
	public ArrayList selectAllBoard(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();

		String query = prop.getProperty("selectAllBoard");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while (rset.next()) {
				list.add(new Board(rset.getInt("BOARD_ID"), rset.getInt("BOARD_TYPE"), rset.getInt("BOARD_CATEGORY_ID"),
						rset.getString("BOARD_TITLE"), rset.getString("BOARD_CONTENT"), rset.getInt("BOARD_COUNT"),
						rset.getDate("BOARD_ENROLL_DATE"), rset.getString("BOARD_DELETE"), rset.getString("IS_FIRST"),
						rset.getString("MEMBER_ID"), rset.getString("BOARD_CATEGORY_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}
	
	// 메인페이지 - discount product list
	public ArrayList selectDiscountProList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectDiscountProList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Product>();
			
			while (rset.next()) {
				list.add(new Product(rset.getInt("PRODUCT_ID"), rset.getString("PRODUCT_NAME"),
						rset.getInt("PRODUCT_CATEGORY_ID"), rset.getInt("PRODUCT_AMOUNT"),
						rset.getString("PRODUCT_BRAND"), rset.getInt("PRODUCT_PRICE"),
						rset.getDouble("PRODUCT_DISCOUNT_RATE"), rset.getInt("PRODUCT_DELIVERY_FEE"),
						rset.getString("PRODUCT_CONTENT"), rset.getString("PRODUCT_TIP"),
						rset.getDate("PRODUCT_ENROLL_DATE"), rset.getString("PRODUCT_STATUS"),
						rset.getString("PRODUCT_DELETE"), rset.getString("PRODUCT_SIZE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	// 메인페이지 - new product list
	public ArrayList selectNewProList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectNewProList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Product>();
			
			while (rset.next()) {
				list.add(new Product(rset.getInt("PRODUCT_ID"), rset.getString("PRODUCT_NAME"),
						rset.getInt("PRODUCT_CATEGORY_ID"), rset.getInt("PRODUCT_AMOUNT"),
						rset.getString("PRODUCT_BRAND"), rset.getInt("PRODUCT_PRICE"),
						rset.getDouble("PRODUCT_DISCOUNT_RATE"), rset.getInt("PRODUCT_DELIVERY_FEE"),
						rset.getString("PRODUCT_CONTENT"), rset.getString("PRODUCT_TIP"),
						rset.getDate("PRODUCT_ENROLL_DATE"), rset.getString("PRODUCT_STATUS"),
						rset.getString("PRODUCT_DELETE"), rset.getString("PRODUCT_SIZE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	////////////////////////////스토어 /////////////////////////////////

	public ArrayList<Product> selectProductsList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;

		String query = prop.getProperty("selectProductsList");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<Product>();

			while (rset.next()) {
				list.add(new Product(rset.getInt("PRODUCT_id"), rset.getString("PRODUCT_NAME"),
						rset.getInt("PRODUCT_category_id"), rset.getInt("PRODUCT_AMOUNT"),
						rset.getString("PRODUCT_BRAND"), rset.getInt("PRODUCT_PRICE"),
						rset.getDouble("PRODUCT_DISCOUNT_RATE"), rset.getInt("PRODUCT_DELIVERY_FEE"),
						rset.getString("PRODUCT_CONTENT"), rset.getString("PRODUCT_TIP"),
						rset.getDate("PRODUCT_enroll_date"), rset.getString("PRODUCT_STATUS"),
						rset.getString("PRODUCT_delete"), rset.getString("PRODUCT_SIZE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public ArrayList<ProductAttachment> selectProductThumbnails(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ProductAttachment> list = null;

		String query = prop.getProperty("selectProductThumbnails");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<ProductAttachment>();

			while (rset.next()) {
				list.add(new ProductAttachment(rset.getInt("PRODUCT_FILE_ID"), rset.getInt("PRODUCT_FILE_LEVEL"),
						rset.getString("PRODUCT_ORIGIN_NAME"), rset.getString("PRODUCT_CHANGE_NAME"),
						rset.getInt("PRODUCT_ID"), rset.getString("PRODUCT_FILE_PATH"),
						rset.getDate("PRODUCT_UPLOAD_DATE"), rset.getString("PRODUCT_FILE_DELETE")));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	// 상품관리 게시판 상품 검색 조건에 맞는 상품 조회
		public ArrayList<Product> selectProductList(Connection conn, PageInfo pi, String index, int roomSize,
				int[] itemCategory, int maxPrice) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Product> list = new ArrayList<Product>();
			String query = null;

	// 쿼리문 뒤에 붙는 숫자는 index이며 상품 정렬 기준을 말함 index:1(할인율순), index:2(신상품순), index:3(낮은
	// 가격순), index:4(높은 가격순)
	// 쿠리문 뒤에 index숫자가 붙지 않은 것은 정렬 기준을 선택하지 않았을 때
	// 상품 카테고리와 평수가 선택되어 있지 않을 때
			if (itemCategory[0] == 0 && roomSize == 0) {
	// 정렬 기준에 따라 쿼리문이 달라짐
				if (index == null || index.equals("0") || index.equals("null")) {
					query = prop.getProperty("selectProductListNoCaRo");
				} else if (index.equals("1")) {
					query = prop.getProperty("selectProductListNoCaRo1");
				} else if (index.equals("2")) {
					query = prop.getProperty("selectProductListNoCaRo2");
				} else if (index.equals("3")) {
					query = prop.getProperty("selectProductListNoCaRo3");
				} else if (index.equals("4")) {
					query = prop.getProperty("selectProductListNoCaRo4");
				}
	// 상품 카테고리는 선택되어 있지 않고 평수는 선택되었을 때
			} else if (itemCategory[0] == 0 && roomSize != 0) {
				if (index == null || index.equals("0") || index.equals("null")) {
					query = prop.getProperty("selectProductListRo");
				} else if (index.equals("1")) {
					query = prop.getProperty("selectProductListRo1");
				} else if (index.equals("2")) {
					query = prop.getProperty("selectProductListRo2");
				} else if (index.equals("3")) {
					query = prop.getProperty("selectProductListRo3");
				} else if (index.equals("4")) {
					query = prop.getProperty("selectProductListRo4");
				}
	// 상품 카테고리가 선택되어있고 평수는 선택되지 않았을 때
			} else if (itemCategory[0] != 0 && roomSize == 0) {
				if (index == null || index.equals("0") || index.equals("null")) {
					query = prop.getProperty("selectProductListCa");
				} else if (index.equals("1")) {
					query = prop.getProperty("selectProductListCa1");
				} else if (index.equals("2")) {
					query = prop.getProperty("selectProductListCa2");
				} else if (index.equals("3")) {
					query = prop.getProperty("selectProductListCa3");
				} else if (index.equals("4")) {
					query = prop.getProperty("selectProductListCa4");
				}
	// 상품 카테고리와 평수가 선택되었을 때
			} else if (itemCategory[0] != 0 && roomSize != 0) {
				if (index == null || index.equals("0") || index.equals("null")) {
					query = prop.getProperty("selectProductListCaRo");
				} else if (index.equals("1")) {
					query = prop.getProperty("selectProductListCaRo1");
				} else if (index.equals("2")) {
					query = prop.getProperty("selectProductListCaRo2");
				} else if (index.equals("3")) {
					query = prop.getProperty("selectProductListCaRo3");
				} else if (index.equals("4")) {
					query = prop.getProperty("selectProductListCaRo4");
				}
			}

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			try {
				pstmt = conn.prepareStatement(query);
	// 판매가 제한이 걸리지 않았을 때 모든 상품을 조회할 수 있도록 제한 가격을 바꿈
				if (maxPrice == 0) {
					maxPrice = 10000000;
				}
				pstmt.setInt(1, maxPrice);

	// 상품 검색 조건에 따라 위치홀더에 넣어주는 값이 다르다
				if (itemCategory[0] == 0 && roomSize == 0) {
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);

				} else if (itemCategory[0] == 0 && roomSize != 0) {
					switch (roomSize) {
					case 6:
						pstmt.setInt(2, 145);
						pstmt.setInt(3, 145);
						break;
					case 8:
						pstmt.setInt(2, 170);
						pstmt.setInt(3, 170);
						break;
					case 10:
						pstmt.setInt(2, 195);
						pstmt.setInt(3, 195);
						break;
					case 12:
						pstmt.setInt(2, 220);
						pstmt.setInt(3, 220);
						break;
					case 14:
						pstmt.setInt(2, 245);
						pstmt.setInt(3, 245);
						break;
					case 16:
						pstmt.setInt(2, 3000);
						pstmt.setInt(3, 3000);
						break;
					}

					pstmt.setInt(4, startRow);
					pstmt.setInt(5, endRow);

				} else if (itemCategory[0] != 0 && roomSize == 0) {
					for (int i = 2; i < itemCategory.length + 2; i++) {
						pstmt.setInt(i, itemCategory[i - 2]);
					}

					pstmt.setInt(8, startRow);
					pstmt.setInt(9, endRow);

				} else if (itemCategory[0] != 0 && roomSize != 0) {
					for (int i = 2; i < itemCategory.length + 2; i++) {
						pstmt.setInt(i, itemCategory[i - 2]);
					}

					switch (roomSize) {
					case 6:
						pstmt.setInt(8, 145);
						pstmt.setInt(9, 145);
						break;
					case 8:
						pstmt.setInt(8, 170);
						pstmt.setInt(9, 170);
						break;
					case 10:
						pstmt.setInt(8, 195);
						pstmt.setInt(9, 195);
						break;
					case 12:
						pstmt.setInt(8, 220);
						pstmt.setInt(9, 220);
						break;
					case 14:
						pstmt.setInt(8, 245);
						pstmt.setInt(9, 245);
						break;
					case 16:
						pstmt.setInt(8, 3000);
						pstmt.setInt(9, 3000);
						break;
					}

					pstmt.setInt(10, startRow);
					pstmt.setInt(11, endRow);
				}

				rset = pstmt.executeQuery();

				while (rset.next()) {
					list.add(new Product(rset.getInt("PRODUCT_id"), rset.getString("PRODUCT_NAME"),
							rset.getInt("PRODUCT_category_id"), rset.getInt("PRODUCT_AMOUNT"),
							rset.getString("PRODUCT_BRAND"), rset.getInt("PRODUCT_PRICE"),
							rset.getDouble("PRODUCT_DISCOUNT_RATE"), rset.getInt("PRODUCT_DELIVERY_FEE"),
							rset.getString("PRODUCT_CONTENT"), rset.getString("PRODUCT_TIP"),
							rset.getDate("PRODUCT_enroll_date"), rset.getString("PRODUCT_STATUS"),
							rset.getString("PRODUCT_delete"), rset.getString("PRODUCT_SIZE")));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}

		// 상품 검색 조건에 맞는 상품의 개수를 구하는 메소드
	public int getProductCount(Connection conn, int roomSize, int[] itemCategory, int maxPrice) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = null;

		if (itemCategory[0] == 0) {
// 상품 카테고리 선택하지 않고 상품 검색 할때
			query = prop.getProperty("getProductCountNoCate");
		} else {
// 상품 카테고리 선택되어 상품 검색 할때
			query = prop.getProperty("getProductCountOption");
		}

		try {
			pstmt = conn.prepareStatement(query);

// 최대 판매가격이 설정되지 않았을 때 모든 상품을 검색하기 위해 최대 가격을 설정함
			if (maxPrice == 0) {
				maxPrice = 10000000;
			}
			pstmt.setInt(1, maxPrice);

// 상품 카테고리가 선택 되었을 때 카테고리를 위치홀더에 넣어 줌
			if (itemCategory[0] != 0) {
				for (int i = 2; i <= (itemCategory.length + 1); i++) {
					pstmt.setInt(i, itemCategory[i - 2]);
				}
			}

			rset = pstmt.executeQuery();

// 평수가 선택 되어 있다면 평수의 조건에 맞는 상품들의 개수만 가져오기
			if (roomSize == 6) {
				while (rset.next()) {
					String[] sizeCheck = rset.getString("product_size").split("\\*");
					if (Integer.parseInt(sizeCheck[0]) < 145 && Integer.parseInt(sizeCheck[1]) < 145) {
						result++;
					}
				}
			} else if (roomSize == 8) {
				while (rset.next()) {
					String[] sizeCheck = rset.getString("product_size").split("\\*");
					if (Integer.parseInt(sizeCheck[0]) < 170 && Integer.parseInt(sizeCheck[1]) < 170) {
						result++;
					}
				}
			} else if (roomSize == 10) {
				while (rset.next()) {
					String[] sizeCheck = rset.getString("product_size").split("\\*");
					if (Integer.parseInt(sizeCheck[0]) < 193 && Integer.parseInt(sizeCheck[1]) < 193) {
						result++;
					}
				}
			} else if (roomSize == 12) {
				while (rset.next()) {
					String[] sizeCheck = rset.getString("product_size").split("\\*");
					if (Integer.parseInt(sizeCheck[0]) < 215 && Integer.parseInt(sizeCheck[1]) < 215) {
						result++;
					}
				}
			} else if (roomSize == 14) {
				while (rset.next()) {
					String[] sizeCheck = rset.getString("product_size").split("\\*");
					if (Integer.parseInt(sizeCheck[0]) < 230 && Integer.parseInt(sizeCheck[1]) < 230) {
						result++;
					}
				}
			} else {
				while (rset.next()) {
					result++;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}



	//스토어 댓글 리스트
	public ArrayList<ProductReply> selectStoreReplyList(Connection conn, int productId, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductReply> list = new ArrayList<ProductReply>();
		ProductReply productReply = null;
		String query = prop.getProperty("selectStoreReplyList");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				productReply = new ProductReply(rset.getInt("product_reply_id"),
						rset.getString("product_reply_content"), rset.getInt("product_id"), rset.getString("member_id"),
						rset.getDate("product_reply_enroll_date"), rset.getString("product_reply_delete"),
						rset.getString("product_category_reply_name"));

				list.add(productReply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	//스토어 댓글 등록
	public int storeInsertReply(Connection conn, ProductReply pr) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("storeInsertReply");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pr.getProductReplyContent());
			pstmt.setInt(2, pr.getProductId());
			pstmt.setString(3, pr.getMemberId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 스토어 댓글 수정
	public int storeUpdateReply(Connection conn, ProductReply pr) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("storeUpdateReply");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pr.getProductReplyContent());
			pstmt.setInt(2, pr.getProductReplyId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	// 스토어 댓글 삭제
	public int storeDeleteReply(Connection conn, int replyId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("storeDeleteReply");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, replyId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// -----------------------1대1게시판----------------------------- //
	// 1대1 게시글 리스트
	public ArrayList<Board> selectOTOList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();

		String query = prop.getProperty("selectOTOList");

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Board(rset.getInt("Board_id"), rset.getInt("board_type"), rset.getInt("board_category_id"),
						rset.getString("board_title"), rset.getString("board_content"), rset.getInt("board_count"),
						rset.getDate("board_enroll_date"), rset.getString("board_delete"), rset.getString("is_first"),
						rset.getString("member_id"), rset.getString("board_category_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}

	// 1대1게시글 상세조회
	public Board selectOTOBoard(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board board = null;

		String query = prop.getProperty("selectOTOBoard");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				board = new Board(rset.getInt("BOARD_ID"), rset.getInt("BOARD_TYPE"), rset.getInt("BOARD_CATEGORY_ID"),
						rset.getString("BOARD_TITLE"), rset.getString("BOARD_CONTENT"), rset.getInt("BOARD_COUNT"),
						rset.getDate("BOARD_ENROLL_DATE"), rset.getString("BOARD_DELETE"), rset.getString("IS_FIRST"),
						rset.getString("MEMBER_ID"), rset.getString("BOARD_CATEGORY_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return board;
	}

	// 댓글 리스트
	public ArrayList<Reply> selectOTOReplyList(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> list = new ArrayList<Reply>();
		Reply reply = null;
		String query = prop.getProperty("selectOTOReplyList");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				reply = new Reply(rset.getInt("reply_id"), rset.getString("reply_content"), rset.getInt("board_id"),
						rset.getString("member_id"), rset.getDate("enroll_date"), rset.getString("reply_delete"));

				list.add(reply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	// 댓글 등록
	public int insertReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertReply");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getBoardId());
			pstmt.setString(3, r.getMemberId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 댓글 수정
	public int updateReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateReply");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getReplyId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 각 게시물의 댓글 수 파악하는 DAO
		public int[] replyCount(Connection conn, int[] bIds) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int[] replyCount = new int[bIds.length];

			String query = prop.getProperty("replyCount");

			try {
				pstmt = conn.prepareStatement(query);

//	                  한 페이지에 나타나는 게시물의 수가 다르기 때문에 게시물의 수 만큼 반복해야 한다
//	                  서블릿에서 받은 게시글 ID를 넣어 게시글안에 몇개의 댓글이 있는지 파악해서 댓글 개수를 받는 배열에 저장해서 반환한다
				for (int i = 0; i < bIds.length; i++) {
					pstmt.setInt(1, bIds[i]);
					rset = pstmt.executeQuery();

					if (rset.next()) {
						replyCount[i] = rset.getInt(1);
					}
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return replyCount;
		}

	// 댓글 삭제
	public int deleteReply(Connection conn, int replyId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteReply");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, replyId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	//////////////// 나의 활동 ///////////////////
	// 나의 활동 1:1 댓글 리스트
	public ArrayList<Reply> selectReply(Connection conn, PageInfo pi, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> list = new ArrayList<Reply>();

		String query = prop.getProperty("selectRList");

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Reply mr = new Reply(rset.getInt("reply_id"), rset.getString("reply_Content"), rset.getInt("board_id"),
						rset.getString("member_id"), rset.getDate("enroll_date"), rset.getString("reply_delete"),
						rset.getString("board_Category_name"));

				list.add(mr);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	// 나의 활동 스토어 댓글 리스트
	public ArrayList<ProductReply> selectMyStoreReply(Connection conn, PageInfo pi2, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductReply> list = new ArrayList<ProductReply>();

		String query = prop.getProperty("selectStoreList");

		int startRow = (pi2.getCurrentPage() - 1) * pi2.getBoardLimit() + 1;
		int endRow = startRow + pi2.getBoardLimit() - 1;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				ProductReply r = new ProductReply(rset.getInt("product_reply_id"),
						rset.getString("product_reply_content"), rset.getInt("product_id"), rset.getString("member_id"),
						rset.getDate("product_reply_enroll_date"), rset.getString("product_reply_delete"),
						rset.getString("product_category_reply_name"));

				list.add(r);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	
	// 댓글 개수 파악하기
		public int getRListCount(Connection conn, String userId) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int result = 0;

			String query = prop.getProperty("getRListCount");

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, userId);
				rset = pstmt.executeQuery();

				if (rset.next()) {
					result = rset.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return result;
		}

	// 나의 활동 1:1 선택 댓글 삭제
	public int deleteReplys(Connection conn, String[] rId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteReplys");

		try {
			pstmt = conn.prepareStatement(query);

			for (int i = 0; i < rId.length; i++) {
				pstmt.setInt(1, Integer.parseInt(rId[i]));
				pstmt.executeUpdate();
				result++;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 나의 활동 스토어 선택 댓글 삭제
	public int deleteStoreReplys(Connection conn, String[] rId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteStoreReplys");

		try {
			pstmt = conn.prepareStatement(query);

			for (int i = 0; i < rId.length; i++) {
				pstmt.setInt(1, Integer.parseInt(rId[i]));
				pstmt.executeUpdate();
				result++;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	 //--------------검색-----------------------------------------------------------------------------
	 // 상품 검색 리스트
	public ArrayList<Product> pSearchList(Connection conn, String sAllWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();
		StringBuffer sql = new StringBuffer();
		
		
		  sql.append(" SELECT * "); 
		  sql.append(" FROM PRODUCT ");
		  sql.append(" WHERE (PRODUCT_NAME || PRODUCT_BRAND) LIKE ? AND PRODUCT_DELETE = 'N'");
		  sql.append(" ORDER BY PRODUCT_ID");
		 
		
		
		String query = sql.toString();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,"%"+ sAllWord +"%");

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Product(rset.getInt("PRODUCT_id"), rset.getString("PRODUCT_NAME"),
						rset.getInt("PRODUCT_category_id"), rset.getInt("PRODUCT_AMOUNT"),
						rset.getString("PRODUCT_BRAND"), rset.getInt("PRODUCT_PRICE"),
						rset.getDouble("PRODUCT_DISCOUNT_RATE"), rset.getInt("PRODUCT_DELIVERY_FEE"),
						rset.getString("PRODUCT_CONTENT"), rset.getString("PRODUCT_TIP"),
						rset.getDate("PRODUCT_enroll_date"), rset.getString("PRODUCT_STATUS"),
						rset.getString("PRODUCT_delete"), rset.getString("PRODUCT_SIZE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 상품검색 카운트
	public int pSearchCount(Connection conn, String sAllWord) {
		PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      int pSearchCount = 0;
	      StringBuffer sql = new StringBuffer();
	      
	      sql.append(" SELECT COUNT(*) ");
	      sql.append(" FROM PRODUCT ");
	      sql.append(" WHERE (PRODUCT_NAME || PRODUCT_BRAND) LIKE ? AND PRODUCT_DELETE = 'N'");
	      sql.append(" ORDER BY PRODUCT_ID");
	      
	      String query = sql.toString();
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, "%"+ sAllWord +"%");
	         rset = pstmt.executeQuery();

	         if (rset.next()) {
	        	 pSearchCount = rset.getInt(1);
	         }

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }

	      return pSearchCount;
	   }
	
	//////////////////////// 나의 쇼핑 ///////////////////////
	
	// 나의 쇼핑 첫 화면, 회원의 주문내역 가져오기
	public ArrayList<Orders> selectOrders(Connection conn, String userId, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Orders> list = new ArrayList<Orders>();
		
		String query = prop.getProperty("selectOrderList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Orders(rset.getString("order_id"), rset.getString("orderer_name"), rset.getString("orderer_phone"),
									rset.getString("orderer_email"), rset.getString("orderer_address"), rset.getString("orderer_request"),
									rset.getString("order_product_name"), rset.getInt("product_id"), rset.getInt("order_price"),
									rset.getDate("order_date"), rset.getString("imp_uid"), rset.getString("member_id"), rset.getString("apply_num")));
			}
			 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 회원의 주문내역 개수 가져오기
	public int getOListCount(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getOListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	// 주문상세 조회 메소드
	public Orders selectOrderDetail(Connection conn, String oId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Orders o = null;
		
		String query = prop.getProperty("selectOrderDetail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, oId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				o = new Orders(rset.getString("order_id"), rset.getString("orderer_name"), rset.getString("orderer_phone"),
						rset.getString("orderer_email"), rset.getString("orderer_address"), rset.getString("orderer_request"),
						rset.getString("order_product_name"), rset.getInt("product_id"), rset.getInt("order_price"),
						rset.getDate("order_date"), rset.getString("imp_uid"), rset.getString("member_id"), rset.getString("apply_num"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return o;
	}

	// 주문관리 페이징을 위한 게시물 개수 가져오기
	public int selectOrdersListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("selectOrdersListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	// 주문관리에서 주문내역을 가져오는 메소드
	public ArrayList<Orders> selectOrdersList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Orders> list = new ArrayList<Orders>();
		
		String query = prop.getProperty("selectOrdersList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Orders(rset.getString("order_id"), rset.getString("orderer_name"), rset.getString("orderer_phone"),
						rset.getString("orderer_email"), rset.getString("orderer_address"), rset.getString("orderer_request"),
						rset.getString("order_product_name"), rset.getInt("product_id"), rset.getInt("order_price"),
						rset.getDate("order_date"), rset.getString("imp_uid"), rset.getString("member_id"),  rset.getString("apply_num")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}