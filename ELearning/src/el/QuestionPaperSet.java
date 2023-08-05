package el;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class QuestionPaperSet {


	private String paperId;
	private String questionId;
	public String getPaperId() {
		return paperId;
	}
	public void setPaperId(String paperId) {
		System.out.println("paper id"+paperId);
		this.paperId = paperId;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		System.out.println("question id"+questionId);
		this.questionId = questionId;
	}
	
	public boolean addQuestionToPaper()
	{	Connection conn = null;
		PreparedStatement pstmt = null;
		boolean flag=false;
		int count=0;
		try
		{
			conn = DBConnection.getConnection();
			if(this.deleteAllQuestionFromPaper(Integer.parseInt(paperId), conn))
			{   String qIds[]=this.questionId.split(",");
				String sql = "insert into QuestionPaperSet(paperId,questionId) values(?,?)";
				pstmt = conn.prepareStatement(sql);
				for(int i=0;i<qIds.length;i++)
				{
					pstmt.setInt(1,Integer.parseInt(this.paperId));
					pstmt.setInt(2,Integer.parseInt(qIds[i]));
					
					int rowAffected = pstmt.executeUpdate();
					if(qIds[i].equals("0"))
					{
					count=0;
					}
					else
						count=count+1;
					if(rowAffected>0){
						
						
						flag=true;
					}
				}
				String sql1 = "update paper set totalQuestions=? where paperId=?";
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1,count);
				pstmt.setInt(2,Integer.parseInt(this.paperId));
				pstmt.executeUpdate();
			}
			
		}
		
		catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
		finally
		{ 
			try{
				if(pstmt != null){pstmt.close();}
				if(conn != null){conn.close();}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public boolean deleteAllQuestionFromPaper(int pId,Connection conn)throws Exception
	{	
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
		boolean flag=false;
		try
		{   String query = "delete from QuestionPaperSet where paperId=?";
			pstmtSelect = conn.prepareStatement(query);
			pstmtSelect.setInt(1,pId);
			int rowAffected=pstmtSelect.executeUpdate();
			System.out.println("Row afected"+rowAffected);
			if(rowAffected>=0)
			{
				flag=true;
			}
		}catch(Exception e){
			e.printStackTrace();
			
		}finally
			{
				if(pstmtSelect != null)
				{
					pstmtSelect.close();
				}
			}
		System.out.println("flag if >= 0"+flag);
		return flag;
	}
	
	
	
	
	
	
}
