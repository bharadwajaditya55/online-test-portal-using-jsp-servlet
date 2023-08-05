package el;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;


public class  ExamFeedback {

	private String name;
	private String quality;
	private String comment;
	private int Sno;
	private String emailId;
	private String message;
	private String dateofcomment;

	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getSno() {
		return Sno;
	}
	public void setSno(int sno) {
		Sno = sno;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDateofcomment() {
		return dateofcomment;
	}
	public void setDateofcomment(String dateofcomment) {
		this.dateofcomment = dateofcomment;
	}
	
	
	public boolean submitFeedback() throws Exception
	{  

		Connection conn = null;
		PreparedStatement pstmt = null;
		SimpleDateFormat dateFormat=new SimpleDateFormat("MM-dd-yyyy   HH:mm:ss");
        Calendar cal = Calendar.getInstance();
		boolean flag=false;

		
		try
		{   
			System.out.println("entered in submit feedback");
			
			conn = DBConnection.getConnection();
			//java.util.Date d = new java.util.Date (); 
            //long t=d.getTime();
           // java.sql.Date date=new java.sql.Date(t);
			
				String sql = "insert into ExamFeedback(SNO,USERNAME,EMAILID,QUALITYOFTEST,USERCOMMENT,DATEOFCOMMENT) values(?,?,?,?,?,?)";
				System.out.println("entered in submit feedback");

				pstmt = conn.prepareStatement(sql);
				int maxno=this.getMaxSno();
				pstmt.setInt(1,maxno);

				pstmt.setString(2,this.name);
				//System.out.println("Name"+this.name);

				pstmt.setString(3, this.emailId);
				//System.out.println("Name"+this.emailId);

				pstmt.setString(4, this.quality);
				//System.out.println("Name"+this.quality);

				pstmt.setString(5, this.comment);
				//System.out.println("Name"+this.comment);

				pstmt.setString(6,dateFormat.format(cal.getTime()));
				//System.out.println("entered in submit feedback");

				int rowAffected = pstmt.executeUpdate();
				//System.out.println("rowAffected"+rowAffected);

				if(rowAffected>0)
				{flag=true;}

				System.out.println("flag"+flag);
				
				

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
			   }
		catch(Exception e){e.printStackTrace();}
		}
		return flag;
	}
	public int getMaxSno(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int id=0;
		
		try{
			conn = DBConnection.getConnection();
			String query = "select max(Sno) as id from ExamFeedback";
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

	
	public ArrayList getListOfAllFeedback()throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
			
		ArrayList list = new ArrayList<ArrayList<String>>(); 
		ArrayList snoList = new ArrayList<String>();
		ArrayList usernameList = new ArrayList<String>();
		ArrayList qualityList = new ArrayList<String>();
		ArrayList difficultyList = new ArrayList<String>();
		ArrayList commentList = new ArrayList<String>();
		ArrayList dateofcommentList = new ArrayList<String>(); 
		try
		{
			conn = DBConnection.getConnection();
			String query = "select sno,username,QualityOfTest,DifficultyOfTest,usercomment,dateofcomment from ExamFeedback order by sno desc";
			pstmtSelect = conn.prepareStatement(query);
			rsSelect = pstmtSelect.executeQuery();
			while(rsSelect.next())
			{
				snoList.add(rsSelect.getString("sno"));
				usernameList.add(rsSelect.getString("username"));
				qualityList.add(rsSelect.getString("QualityOfTest"));
				difficultyList.add(rsSelect.getString("DifficultyOfTest"));
				dateofcommentList.add(rsSelect.getString("dateofcomment"));	
				String value="";
				if(rsSelect.getString("usercomment")!=null){
					
					value=rsSelect.getString("usercomment");
					if(value.length()>31){
						value=value.substring(0, 30);
						value=value+"...";
					}
				}
				
				commentList.add(value);
					}	
			if(snoList != null && snoList.size() > 0)
			{
				list.add(snoList);
				list.add(usernameList);
				list.add(qualityList);
				list.add(difficultyList);
				list.add(commentList);
				list.add(dateofcommentList);	
			}
			else
			{
				this.message = "No record Found";
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			throw e;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			throw ex;
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



	

	public void deleteFeedback()throws Exception{

		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
		
		try
		{
			conn = DBConnection.getConnection();
			String query = "delete from ExamFeedback where sno=?";
		
			
			
			pstmtSelect = conn.prepareStatement(query);
			pstmtSelect.setInt(1,Sno);
			int rowAffected=pstmtSelect.executeUpdate();
			if(rowAffected>0)
			{	
				this.message="Feedback Deleted Successfully !";
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
