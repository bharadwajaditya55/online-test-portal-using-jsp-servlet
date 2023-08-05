package el;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;


public class Feedback {

	private String username;
	private String useremailId;
	private String comment;
	private int Sno;
	private String dateofcomment;
	private String message;

	
	
	public String getMessage() {
		return message;
	}
	public String getDateofcomment() {
		return dateofcomment;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseremailId() {
		return useremailId;
	}
	public void setUseremailId(String useremailId) {
		this.useremailId = useremailId;
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



	public void submitFeedback() throws Exception
	{  

		Connection conn = null;
		PreparedStatement pstmt = null;
		SimpleDateFormat dateFormat=new SimpleDateFormat("MM-dd-yyyy   HH:mm:ss");
        Calendar cal = Calendar.getInstance();
		
		try
		{   
			System.out.println("entered in submit feedback");
			
			conn = DBConnection.getConnection();
			//java.util.Date d = new java.util.Date (); 
            //long t=d.getTime();
           // java.sql.Date date=new java.sql.Date(t);
			
				String sql = "insert into Feedback(Sno,UserName,UserEmailId,userComment,dateofcomment) values(?,?,?,?,?)";
				 
				pstmt = conn.prepareStatement(sql);
				int maxno=this.getMaxSno();
				pstmt.setInt(1,maxno);
				pstmt.setString(2,this.username);
				pstmt.setString(3, this.useremailId);
				pstmt.setString(4, this.comment);
				pstmt.setString(5,dateFormat.format(cal.getTime()));

				int rowAffected = pstmt.executeUpdate();
							
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
	public int getMaxSno(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int id=0;
		
		try{
			conn = DBConnection.getConnection();
			String query = "select max(Sno) as id from Feedback";
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

	
	public ArrayList getListOfAllComments()throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
			
		ArrayList list = new ArrayList<ArrayList<String>>(); 
		ArrayList snoList = new ArrayList<String>();
		ArrayList usernameList = new ArrayList<String>();
		ArrayList useremailIdList = new ArrayList<String>();
		ArrayList commentList = new ArrayList<String>();
		ArrayList dateofcommentList = new ArrayList<String>(); 
		try
		{
			conn = DBConnection.getConnection();
			String query = "select sno,username,useremailid,usercomment,dateofcomment from Feedback order by sno desc";
		
			pstmtSelect = conn.prepareStatement(query);
			rsSelect = pstmtSelect.executeQuery();
			while(rsSelect.next())
			{
				snoList.add(rsSelect.getString("sno"));
				usernameList.add(rsSelect.getString("username"));
				useremailIdList.add(rsSelect.getString("useremailid"));
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
				list.add(useremailIdList);
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



	
	public void getFeed() throws Exception
	{
		System.out.println("entered in get feed method");
		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
		
		try
		{
			conn = DBConnection.getConnection();
			String query = "select username,usercomment,dateofcomment from Feedback where useremailId=?";
		
			
			
			pstmtSelect = conn.prepareStatement(query);
			pstmtSelect.setString(1,useremailId);
			rsSelect=pstmtSelect.executeQuery();
			while(rsSelect.next())
			{
				this.username=rsSelect.getString("username");
				this.comment=rsSelect.getString("usercomment");
				this.dateofcomment=rsSelect.getString("dateofcomment");

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
		
	}

	
	
	public void deleteFeedback()throws Exception{

		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
		
		try
		{
			conn = DBConnection.getConnection();
			String query = "delete from Feedback where useremailId=?";
		
			
			
			pstmtSelect = conn.prepareStatement(query);
			pstmtSelect.setString(1,useremailId);
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
