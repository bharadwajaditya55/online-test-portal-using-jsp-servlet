package el;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.jdbc.CallableStatement;


public class Topic {
private	int subjectId ;
private	int	topicId ;
private String	topicName;
private String	description ;
private String message;
private String oldTopicName;
private String topicContent;

public String getTopicContent() {
	return topicContent;
}

public void setTopicContent(String topicContent) {
	this.topicContent = topicContent;
}

public String getOldTopicName() {
	return oldTopicName;
}

public void setOldTopicName(String oldTopicName) {
	this.oldTopicName = oldTopicName;
}
public int getSubjectId() {
	return subjectId;
}
public void setSubjectId(int subjectId) {
	this.subjectId = subjectId;
}
public int getTopicId() {
	return topicId;
}
public void setTopicId(int topicId) {
	this.topicId = topicId;
}
public String getTopicName() {
	topicName=topicName.trim();
	return topicName;
}
public void setTopicName(String topicName) {
	this.topicName = topicName.trim();
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getMessage() {
	return message;
}
public void updateTopicContent(){
	
    CallableStatement cstm = null;
	Connection conn=null;
	try
	{
		conn = DBConnection.getConnection();
		if(!isTopicAllreadyExist())
		{
			String sql = "CALL update_cont(? , ?);";
			 
			cstm = (CallableStatement) conn.prepareCall(sql);
			cstm.setInt(1, this.topicId);
			cstm.setString(2, this.topicContent);
			
			int rowAffected = cstm.executeUpdate();
			System.out.println(this.topicContent);
			System.out.println(this.topicId);
			System.out.println(rowAffected);
			if(rowAffected>0){
				
			 message="Topic Contents Added Successfully !";
			}else{
				message="No Record Insert Please Try Again !";
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
			if(cstm != null){cstm.close();}
			if(conn != null){conn.close();}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}

public boolean addTopicContents(Connection conn,int maxid){
	boolean flag=false;
	PreparedStatement pstmt = null;
	try
	{
		
			String sql = "insert into TopicContents(topicId) values(?)";
			 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxid);
			int rowAffected = pstmt.executeUpdate();
			if(rowAffected>0){
				
			 flag=true;
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
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	return flag;
}
public void addTopic() 
{  

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try
	{
		conn = DBConnection.getConnection();
		if(!isTopicAllreadyExist())
		{
			String sql = "insert into Topic(subjectId,topicId,topicName,description) values(?,?,?,?)";
			 
			pstmt = conn.prepareStatement(sql);
			int maxid=this.getMaxTopicId();
			pstmt.setInt(1,this.subjectId);
			pstmt.setInt(2, maxid);
			pstmt.setString(3, this.topicName);
			pstmt.setString(4, this.description);
			int rowAffected = pstmt.executeUpdate();
			if(rowAffected>0){
				
			boolean yes=	addTopicContents(conn,maxid);
				
			 	if(yes)message="Topic Added Successfully !";
			
			}else{
				message="Please ! Try Again !";
			}
			
		}
		else
		{
			message="Topic Name Already Exist !";
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
	
	
public int getMaxTopicId(){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	int id=0;
	
	try{
		conn = DBConnection.getConnection();
		String query = "select max(topicId) as id from Topic";
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

public boolean isTopicAllreadyExist(){
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rset = null;
boolean flag=false;

try{
	conn = DBConnection.getConnection();
	String query = "select 'X' from topic where topicName=?  and subjectId=?";
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1,this.topicName);
	pstmt.setInt(2,this.subjectId);
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

public ArrayList getListOfAllTopics()throws Exception
{
	Connection conn = null;
	PreparedStatement pstmtSelect = null;
	ResultSet rsSelect = null;
	ArrayList list = new ArrayList<ArrayList<String>>(); 
	ArrayList subjectIdList = new ArrayList<String>();
	ArrayList topicIdList = new ArrayList<String>();
	ArrayList topicNameList = new ArrayList<String>();
	ArrayList descriptionList = new ArrayList<String>(); 
	try
	{
		conn = DBConnection.getConnection();
		String query = "select subjectId,topicId,topicName,description from Topic";
	
		pstmtSelect = conn.prepareStatement(query);
		rsSelect = pstmtSelect.executeQuery();
		while(rsSelect.next())
		{
			subjectIdList.add(rsSelect.getString("subjectId"));
			topicIdList.add(rsSelect.getString("topicId"));
			topicNameList.add(rsSelect.getString("topicName"));
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
			list.add(topicIdList);
			list.add(topicNameList);
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
		String query = "select topicId,topicName,description from Topic where topicId=?";
	
		
		
		pstmtSelect = conn.prepareStatement(query);
		pstmtSelect.setInt(1,topicId);
		rsSelect=pstmtSelect.executeQuery();
		while(rsSelect.next())
		{
			this.topicId=rsSelect.getInt("topicId");
			this.topicName=rsSelect.getString("topicName");
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

public void updateTopic()throws Exception{
	Connection conn = null;
	PreparedStatement pstmtSelect = null;
	ResultSet rsSelect = null;
	
try	{
		if(this.topicName.equals(this.oldTopicName)){
			conn = DBConnection.getConnection();
			String query = "update topic set topicName=?,description=?  where topicId=?";
		
			
			
			pstmtSelect = conn.prepareStatement(query);
			pstmtSelect.setString(1,this.topicName);
			pstmtSelect.setString(2,this.description);
			pstmtSelect.setInt(3,this.topicId);
			int rowAffected=pstmtSelect.executeUpdate();
			if(rowAffected>0){
				this.message="topicName Already Exist";
			}else{
				this.message="not updated";
			}
		}else{
			if(!isTopicAllreadyExist()){
				conn = DBConnection.getConnection();
				String query = "update topic set topicName=?,description=?  where topicId=?";
			
				
				
				pstmtSelect = conn.prepareStatement(query);
				pstmtSelect.setString(1,this.topicName);
				pstmtSelect.setString(2,this.description);
				pstmtSelect.setInt(3,this.topicId);
				int rowAffected=pstmtSelect.executeUpdate();
				if(rowAffected>0){
					this.message="Record Updated Successfully !";
				}else{
					this.message="not updated";
				}
			}else{
				message="topicName Already Exist";
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

public void deleteTopic()throws Exception{

	Connection conn = null;
	PreparedStatement pstmtSelect = null;
	ResultSet rsSelect = null;
	
	try
	{
		conn = DBConnection.getConnection();
		String query = "delete from topic where topicId=?";
	
		
		
		pstmtSelect = conn.prepareStatement(query);
		pstmtSelect.setInt(1,topicId);
		int rowAffected=pstmtSelect.executeUpdate();
		if(rowAffected>0)
		{	deleteTopicContents(conn);
			this.message="Topic Deleted Successfully !";
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
public boolean deleteTopicContents(Connection conn)throws Exception{

	
	PreparedStatement pstmtSelect = null;
	ResultSet rsSelect = null;
	boolean flag=false;
	
	try
	{
		conn = DBConnection.getConnection();
		String query = "delete from topicContents where topicId=?";
		pstmtSelect = conn.prepareStatement(query);
		pstmtSelect.setInt(1,topicId);
		int rowAffected=pstmtSelect.executeUpdate();
		if(rowAffected>0)
		{
			flag=true;
		}
		
	}finally{
			if(rsSelect != null){rsSelect.close();}
			if(pstmtSelect != null)	{pstmtSelect.close();}
	}
	return flag;
}

public String  getSubjectNameById(int id){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String subname="";
	
	try{
		conn = DBConnection.getConnection();
		String query = "select subjectName from Subject where subjectId=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,id);
		
		rset = pstmt.executeQuery();
		if(rset.next())	{
			subname=rset.getString("subjectName");
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
	return subname;
}

public String  getTopicNameById(int id){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String topname="";
	
	try{
		conn = DBConnection.getConnection();
		String query = "select topicName from Topic where topicId=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,id);
		
		rset = pstmt.executeQuery();
		if(rset.next())	{
			topname=rset.getString("topicName");
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
	return topname;
}
public String  getTopicContentsById(int id){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String topConts="";
	
	try{
		conn = DBConnection.getConnection();
		String query = "select topicContent from TopicContents where topicId=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,id);
		
		rset = pstmt.executeQuery();
		if(rset.next())	{
			topConts=rset.getString("topicContent")!=null?rset.getString("topicContent"):"";
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
	return topConts;
}

public ArrayList getListOfAllTopicsBySubjectId(int subid)throws Exception
{
	Connection conn = null;
	PreparedStatement pstmtSelect = null;
	ResultSet rsSelect = null;
	ArrayList list = new ArrayList<ArrayList<String>>(); 
	ArrayList subjectIdList = new ArrayList<String>();
	ArrayList topicIdList = new ArrayList<String>();
	ArrayList topicNameList = new ArrayList<String>();

	try
	{
		conn = DBConnection.getConnection();
		String query = "select subjectId,topicId,topicName from Topic where subjectId=?";
	
		pstmtSelect = conn.prepareStatement(query);
		pstmtSelect.setInt(1,subid);
		rsSelect = pstmtSelect.executeQuery();
		while(rsSelect.next())
		{
			subjectIdList.add(rsSelect.getString("subjectId"));
			topicIdList.add(rsSelect.getString("topicId"));
			topicNameList.add(rsSelect.getString("topicName"));
		}
		if(subjectIdList != null && subjectIdList.size() > 0)
		{
			list.add(subjectIdList);
			list.add(topicIdList);
			list.add(topicNameList);
		
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

public void updateTopicContents(){
	
	PreparedStatement pstmt = null;
	Connection conn=null;
	try
	{
		conn = DBConnection.getConnection();
		if(!isTopicAllreadyExist())
		{
			String sql = "update topicContents set topicContent=? where  topicId=?";
			 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, this.topicContent);
			pstmt.setInt(2, this.topicId);
			
			int rowAffected = pstmt.executeUpdate();
			System.out.println(this.topicContent);
			System.out.println(this.topicId);
			System.out.println(rowAffected);
			if(rowAffected>0){
				
			 message="Topic Contents Added Successfully !";
			}else{
				message="No Record Insert Please Try Again !";
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

public String getContentByTopicId(int tpid) throws Exception
{
	Connection conn = null;
	PreparedStatement pstmtSelect = null;
	ResultSet rsSelect = null;
	String content="";
	
	try
	{
		conn = DBConnection.getConnection();
		String query = "select topicContent from TopicContents where topicId=?";
	
		
		
		pstmtSelect = conn.prepareStatement(query);
		pstmtSelect.setInt(1,tpid);
		rsSelect=pstmtSelect.executeQuery();
		if(rsSelect.next())
		{
			content=rsSelect.getString("topicContent")!=null?rsSelect.getString("topicContent"):"<H1>No Topic Information Available</H1>";
			
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
	return content;
	
}

public String  getTopicNameBySubjectId(int id){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String topname="";
	
	try{
		conn = DBConnection.getConnection();
		String query = "select topicName from Topic where subjectId=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,id);
		
		rset = pstmt.executeQuery();
		if(rset.next())	{
			topname=rset.getString("topicName");
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
	return topname;
}



}
