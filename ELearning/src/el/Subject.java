package el;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Subject
{	private String subjectId;
	private String subjectName ;
	private String description ;
	private String message;
	private String oldSubjectName;
	public String getOldSubjectName() {
		return oldSubjectName;
	}
	public void setOldSubjectName(String oldSubjectName) {
		this.oldSubjectName = oldSubjectName;
	}
	public String getMessage() {
		return message;
	}
	public String getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setMessage(String message) {
		this.message = message;
	}



	public void addSubject() 
	{  

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{
			conn = DBConnection.getConnection();
			if(!isSubjectAllreadyExist())
			{
				String sql = "insert into Subject(subjectId,subjectName,description) values(?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, this.getMaxSubjectId());
				pstmt.setString(2, this.subjectName);
				pstmt.setString(3, this.description);
				int rowAffected = pstmt.executeUpdate();
				if(rowAffected>0){
					message="Record Added Successfully !";
				}else{
					message="Please ! Try Again !";
				}
				
			}
			else
			{
				message="Subject Name Already Exist !";
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
		
		
		
		
	
		
	public boolean isSubjectAllreadyExist(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean flag=false;
		
		try{
			conn = DBConnection.getConnection();
			String query = "select 'X' from Subject where subjectName=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,this.subjectName);
			rset = pstmt.executeQuery();
			if(rset.next())	{
				flag=true;
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
		return flag;
	}
	public int getMaxSubjectId(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int id=0;
		
		try{
			conn = DBConnection.getConnection();
			String query = "select max(subjectId) as id from Subject";
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
	public ArrayList getListOfAllSubjects()throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
		ArrayList list = new ArrayList<ArrayList<String>>(); 
		ArrayList subjectIdList = new ArrayList<String>();
		ArrayList subjectNameList = new ArrayList<String>();
		ArrayList descriptionList = new ArrayList<String>(); 
		try
		{
			conn = DBConnection.getConnection();
			String query = "select subjectId,subjectName,description from subject";
		
			pstmtSelect = conn.prepareStatement(query);
			rsSelect = pstmtSelect.executeQuery();
			while(rsSelect.next())
			{
				subjectIdList.add(rsSelect.getString("subjectId"));
				subjectNameList.add(rsSelect.getString("subjectName"));
				String value="";
				if(rsSelect.getString("description")!=null){
					
					value=rsSelect.getString("description");
					if(value.length()>31){
						value=value.substring(0, 30);
						value=value+"...";
					}
				}
				
				
				
				descriptionList.add(value);
			}
			if(subjectIdList != null && subjectIdList.size() > 0)
			{
				list.add(subjectIdList);
				list.add(subjectNameList);
				list.add(descriptionList);	
			}
			else
			{
				message = "No record Found";
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
	
	public void getRecord() throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
		
		try
		{
			conn = DBConnection.getConnection();
			String query = "select subjectId,subjectName,description from subject where subjectId=?";
		
			
			
			pstmtSelect = conn.prepareStatement(query);
			pstmtSelect.setString(1,subjectId);
			rsSelect=pstmtSelect.executeQuery();
			while(rsSelect.next())
			{
				this.subjectId=rsSelect.getString("subjectId");
				this.subjectName=rsSelect.getString("subjectName");
				this.description=rsSelect.getString("description");
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
	
	public void updateSubject()throws Exception{
		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
		
	try	{
			if(this.subjectName.equals(this.oldSubjectName)){
				conn = DBConnection.getConnection();
				String query = "update subject set subjectName=?,description=?  where subjectId=?";
			
				
				
				pstmtSelect = conn.prepareStatement(query);
				pstmtSelect.setString(1,this.subjectName);
				pstmtSelect.setString(2,this.description);
				pstmtSelect.setString(3,this.subjectId);
				int rowAffected=pstmtSelect.executeUpdate();
				if(rowAffected>0){
					this.message="Record Updated Successfully !";
				}else{
					this.message="not updated";
				}
			}else{
				if(!isSubjectAllreadyExist()){
					conn = DBConnection.getConnection();
					String query = "update subject set subjectName=?,description=?  where subjectId=?";
				
					
					
					pstmtSelect = conn.prepareStatement(query);
					pstmtSelect.setString(1,this.subjectName);
					pstmtSelect.setString(2,this.description);
					pstmtSelect.setString(3,this.subjectId);
					int rowAffected=pstmtSelect.executeUpdate();
					if(rowAffected>0){
						this.message="Record Updated Successfully !";
					}else{
						this.message="not updated";
					}
				}else{
					message="SubjectName Already Exist";
				}
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
	
	public void deleteSubject()throws Exception{

		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
		
		try
		{   if(!isSubjectAllreadyUsed()){
			conn = DBConnection.getConnection();
			String query = "delete from subject where subjectId=?";
		
			
			
			pstmtSelect = conn.prepareStatement(query);
			pstmtSelect.setString(1,subjectId);
			int rowAffected=pstmtSelect.executeUpdate();
			if(rowAffected>0)
			{
				this.message="Record Deleted Successfully !";
			}
		}else{
			message="Subject is used anywhere !";
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
	public ArrayList getListOfAllSubjectsName()throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rsSelect = null;
		ArrayList list = new ArrayList<ArrayList<String>>(); 
		ArrayList subjectIdList = new ArrayList<String>();
		ArrayList subjectNameList = new ArrayList<String>();
		try
		{
			conn = DBConnection.getConnection();
			String query = "select subjectId,subjectName from subject";
		
			pstmtSelect = conn.prepareStatement(query);
			rsSelect = pstmtSelect.executeQuery();
			while(rsSelect.next())
			{
				subjectIdList.add(rsSelect.getString("subjectId"));
				subjectNameList.add(rsSelect.getString("subjectName"));
				
			}
			if(subjectIdList != null && subjectIdList.size() > 0)
			{
				list.add(subjectIdList);
				list.add(subjectNameList);
				
			}
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			throw ex;
		}
		finally
		{
			if(rsSelect != null){	rsSelect.close();	}
			if(pstmtSelect != null)	{	pstmtSelect.close();		}
			if(conn != null){	conn.close();		}
		}
		return list;
	}
	public boolean isSubjectAllreadyUsed(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean flag=false;
		
		try{
			conn = DBConnection.getConnection();
			String query = "select 'X' from TOPIC where subjectId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,this.subjectId);
			rset = pstmt.executeQuery();
			if(rset.next())	{
				flag=true;
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
		return flag;
	}
	
	public 	ArrayList  getTopicNameBySubjectId(int id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String topname="";
		ArrayList list = new ArrayList(); 
		ArrayList topicNameList = new ArrayList();
		ArrayList topicIdList  = new ArrayList();
		
		try{
			conn = DBConnection.getConnection();
			String query = "select topicId,topicName from Topic where subjectId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,id);
			
			rset = pstmt.executeQuery();
			while(rset.next())	{
				topicIdList.add(rset.getString("topicId"));
				topicNameList.add(rset.getString("topicName"));
			}
			if(topicIdList!=null && topicIdList.size()>0){
				list.add(topicIdList);
				list.add(topicNameList);
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
		
		return list;
	}
public String getSubjectNameAccordingToSubjectId(int i1) throws Exception
{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String name="";
	try
	{
		conn = DBConnection.getConnection();
		String query = "select subjectName from subject where subjectId=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,i1);
		rset = pstmt.executeQuery();
		while(rset.next()){
	    name=rset.getString("subjectName");
		}
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
		throw ex;
	}
	finally
	{
		if(rset != null){	rset.close();	}
		if(pstmt != null)	{	pstmt.close();		}
		if(conn != null){	conn.close();		}
	}
	return name;
}

	
	
	
	
}