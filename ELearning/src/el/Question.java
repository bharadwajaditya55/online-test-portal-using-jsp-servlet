package el;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Question {


	private int subjectId ;
	private int questionId;
	private String question;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String remarks;
	private String answer;
	private String message;
	private int paperId;
	private String explanation;


	
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		this.option4 = option4;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	


	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	public void addQuestion() 
	{  

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{
			conn = DBConnection.getConnection();
			
			{
				
				System.out.println(explanation);
				String sql = "insert into Question(subjectId,questionId,question,option1,option2,option3,option4,remarks,answer,explanation) values(?,?,?,?,?,?,?,?,?,?)  ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,this.subjectId);
				pstmt.setInt(2, this.getMaxQuestionId());
				pstmt.setString(3, this.question);
				pstmt.setString(4, this.option1);
				pstmt.setString(5, this.option2);
				pstmt.setString(6, this.option3);
				pstmt.setString(7, this.option4);
				pstmt.setString(8, this.remarks);
				pstmt.setString(9, this.answer);
				pstmt.setString(10, this.explanation);

				int rowAffected = pstmt.executeUpdate();
				if(rowAffected>0){
					message="Question Added Successfully !";
				}else{
					message="Please ! Try Again !";
				}
				
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
	}
		
	public int getMaxQuestionId(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int id=0;
		
		try{
			conn = DBConnection.getConnection();
			String query = "select max(questionId) as id from Question";
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			if(rset.next())	{
				id=rset.getInt("id");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{	try{
				if(rset != null){rset.close();}
				if(pstmt != null){pstmt.close();}
				if(conn != null){conn.close();}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return id+1;	
		
		
		
		

}
	public ArrayList getQuestionsBySubjectId(int subid)throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
		ArrayList list = new ArrayList(); 
		ArrayList questionIdList = new ArrayList();
		ArrayList subjectIdList = new ArrayList();
		

		try
		{
			conn = DBConnection.getConnection();
			String query = "select subjectId,questionId from Question where subjectId=?";
		
			pstmtSelect = conn.prepareStatement(query);
			pstmtSelect.setInt(1,subid);
			rsSelect = pstmtSelect.executeQuery();
			while(rsSelect.next())
			{
				questionIdList.add(rsSelect.getString("questionId"));
				subjectIdList.add(rsSelect.getString("subjectId"));
				
			}
			if(questionIdList != null && questionIdList.size() > 0)
			{
				list.add(questionIdList);
				list.add(subjectIdList);
				
			
			}
			else
			{
				message = "No record Found";
			}
		}
		
		catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
		finally
		{
			if(rsSelect != null)
			{
				rsSelect.close();
			}
			if(pstmtSelect != null)
			{
				pstmtSelect.close();
			}
			if(conn != null)
			{
				conn.close();
			}
		}
		return list;
	}
	
	
	public void getQuestionDetails() throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
		
		try
		{
			conn = DBConnection.getConnection();
			String query = "select subjectId,question,option1,option2,option3,option4,remarks,answer from question where questionId=?";
		
			
			
			pstmtSelect = conn.prepareStatement(query);
			pstmtSelect.setInt(1,questionId);
			rsSelect=pstmtSelect.executeQuery();
			while(rsSelect.next())
			{
				this.question=rsSelect.getString("question");
				this.option1=rsSelect.getString("option1");
				this.option2=rsSelect.getString("option2");
				this.option3=rsSelect.getString("option3");
				this.option4=rsSelect.getString("option4");
				this.remarks=rsSelect.getString("remarks");
				this.answer=rsSelect.getString("answer");
				this.subjectId=rsSelect.getInt("subjectId");
				
			}
			
		}
			
			finally
			{
				if(rsSelect != null)
				{
					rsSelect.close();
				}
				if(pstmtSelect != null)
				{
					pstmtSelect.close();
				}
				if(conn != null)
				{
					conn.close();
				}
			}
		
	}
	
	
	public void deleteQuestion()throws Exception{

		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
		
		try
		{
			conn = DBConnection.getConnection();
			String query = "delete from question where questionId=?";
		
			
			
			pstmtSelect = conn.prepareStatement(query);
			pstmtSelect.setInt(1,questionId);
			int rowAffected=pstmtSelect.executeUpdate();
			if(rowAffected>0)
			{	
				this.message="question Deleted Successfully !";
			}
			
		}
			
			finally
			{
				if(rsSelect != null)
				{
					rsSelect.close();
				}
				if(pstmtSelect != null)
				{
					pstmtSelect.close();
				}
				if(conn != null)
				{
					conn.close();
				}
			}
	}
		
		public void updateQuestion(){
			
			PreparedStatement pstmt = null;
			Connection conn=null;
			try
			{
				conn = DBConnection.getConnection();
					String sql = "update question set question=?,option1=?,option2=?,option3=?,option4=?,remarks=?,answer=? where  questionId=?";
					 
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, this.question);
					pstmt.setString(2, this.option1);
					pstmt.setString(3, this.option2);
					pstmt.setString(4, this.option3);
					pstmt.setString(5, this.option4);
					pstmt.setString(6, this.remarks);
					pstmt.setString(7, this.answer);
					pstmt.setInt(8,this.questionId);
					
					int rowAffected = pstmt.executeUpdate();
					System.out.println(rowAffected);
					System.out.println("Question Id is"+questionId);
					if(rowAffected>0){
						
					 message="Question Updated Successfully !";
					}else{
						message="No Record Insert Please Try Again !";
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
			
		}
public String getQuestionDetailsByAjax() 
		{
			Connection conn = null;
			PreparedStatement pstmtSelect = null;
			ResultSet rsSelect = null;
			String data="";
			try
			{
				conn = DBConnection.getConnection();
				String query = "select subjectId,question,option1,option2,option3,option4,remarks,answer from question where questionId=?";
				pstmtSelect = conn.prepareStatement(query);
				pstmtSelect.setInt(1,questionId);
				rsSelect=pstmtSelect.executeQuery();
				if(rsSelect.next())
				{	
					this.question=rsSelect.getString("question")!=null?rsSelect.getString("question"):"";
					this.option1=rsSelect.getString("option1")!=null?rsSelect.getString("option1"):"";
					this.option2=rsSelect.getString("option2")!=null?rsSelect.getString("option2"):"";
					this.option3=rsSelect.getString("option3")!=null?rsSelect.getString("option3"):"";;
					this.option4=rsSelect.getString("option4")!=null?rsSelect.getString("option4"):"";;
					this.remarks=rsSelect.getString("remarks")!=null?rsSelect.getString("remarks"):"";
					this.answer=rsSelect.getString("answer")!=null?rsSelect.getString("answer"):"";
					this.subjectId=rsSelect.getInt("subjectId")!=0?rsSelect.getInt("subjectId"):0;
					
				}
				data=this.questionId+new Character((char)1).toString()+
					this.option1+new Character((char)1).toString()+
					this.option2+new Character((char)1).toString()+
					this.option3+new Character((char)1).toString()+
					this.option4+new Character((char)1).toString()+
					this.answer+new Character((char)1).toString()+
					this.question+new Character((char)1).toString()+
					this.remarks+new Character((char)1).toString();
				
			}catch(Exception e){
				e.printStackTrace();
			}
				
				finally
				{  try{
					if(rsSelect != null){rsSelect.close();}
					if(pstmtSelect != null){pstmtSelect.close();}
					if(conn != null){conn.close();	}
				}catch(Exception e){
						e.printStackTrace();
					}
				}
			return data;
		}
		
public void selectQuestion(int qid) throws Exception
{
	Connection conn = null;
	PreparedStatement pstmtSelect = null;
	ResultSet rsSelect = null;
	
	try
	{
		conn = DBConnection.getConnection();
		String query = "select questionId,question,option1,option2,option3,option4,answer,explanation from question where questionId=?";
		pstmtSelect = conn.prepareStatement(query);
		pstmtSelect.setInt(1,qid);
		rsSelect=pstmtSelect.executeQuery();
		while(rsSelect.next())
		{
			this.questionId=rsSelect.getInt("questionId");
			this.question=rsSelect.getString("question");
			this.option1=rsSelect.getString("option1");
			this.option2=rsSelect.getString("option2");
			this.option3=rsSelect.getString("option3");
			this.option4=rsSelect.getString("option4");
			this.answer=rsSelect.getString("answer");
			this.explanation=rsSelect.getString("explanation");

					
		}
		
	}
		
		finally
		{
			if(rsSelect != null)
			{
				rsSelect.close();
			}
			if(pstmtSelect != null)
			{
				pstmtSelect.close();
			}
			if(conn != null)
			{
				conn.close();
			}
		}
	
}



	}

	
	
	
	
	
	

