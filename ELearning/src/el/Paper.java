package el;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Paper {




private int paperId;
private int paperIdDrop;
private int questionId[];
private int checkbox;
private String paperName;
private int subjectId;
private int totalQuestions;
private int timeInMinute;
private String message;
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
public int getPaperId() {
	return paperId;
}
public void setPaperId(int paperId) {
	this.paperId = paperId;
}
public String getPaperName() {
	return paperName;
}
public void setPaperName(String paperName) {
	this.paperName = paperName;
}
public int getSubjectId() {
	return subjectId;
}
public void setSubjectId(int subjectId) {
	this.subjectId = subjectId;
}
public int getTotalQuestions() {
	return totalQuestions;
}
public void setTotalQuestions(int totalQuestions) {
	this.totalQuestions = totalQuestions;
}
public int getTimeInMinute() {
	return timeInMinute;
}
public void setTimeInMinute(int timeInMinute) {
	this.timeInMinute = timeInMinute;
}

public int[] getQuestionId() {
	return questionId;
}
public void setQuestionId(int[] questionId) {
	this.questionId = questionId;
	System.out.println(questionId.toString());
	for(int i=0;i<questionId.length;i++)
		System.out.println(questionId[i]);
		

	
}
public int getCheckbox() {
	return checkbox;
}
public void setCheckbox(int checkbox) {
	this.checkbox = checkbox;
}

public int getPaperIdDrop() {
	return paperIdDrop;
}
public void setPaperIdDrop(int paperIdDrop) {
	this.paperIdDrop = paperIdDrop;
}
public void addPaper()

{
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{
			if(!isPaperAllreadyExist())
			{
			conn = DBConnection.getConnection();
			String sql = "insert into Paper(paperId,paperName,subjectId,timeInMinute) values(?,?,?,?)";
				 
				pstmt = conn.prepareStatement(sql);
				int maxid=this.getMaxPaperId();
				pstmt.setInt(1,maxid);
				pstmt.setString(2, this.paperName);
				pstmt.setInt(3, this.subjectId);
				pstmt.setInt(4, this.timeInMinute);
				int rowAffected = pstmt.executeUpdate();
				if(rowAffected>0){
					
						
				 message="Paper Added Successfully !";
				
				}else{
					message="Please ! Try Again !";
				}
			}
			else
			{
				message="Paper Name Already Exist !";
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
		
public int getMaxPaperId(){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	int id=0;
	
	try{
		conn = DBConnection.getConnection();
		String query = "select max(paperId) as id from paper";
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



public boolean isPaperAllreadyExist(){
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rset = null;
boolean flag=false;

try{
	conn = DBConnection.getConnection();
	String query = "select 'X' from paper where paperName=?  and subjectId=?";
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1,this.paperName);
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

public ArrayList  getPaperNameBySubjectId(int id){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String topname="";
	ArrayList list = new ArrayList(); 
	ArrayList paperNameList = new ArrayList();
	ArrayList paperIdList  = new ArrayList();
	
	
	try{
		conn = DBConnection.getConnection();
		String query = "select paperId,paperName from paper where subjectId=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,id);
		
		rset = pstmt.executeQuery();
		while(rset.next())	{
			paperIdList.add(rset.getString("paperId"));
			paperNameList.add(rset.getString("paperName"));
		}
		if(paperIdList!=null && paperIdList.size()>0){
			list.add(paperIdList);
			list.add(paperNameList);
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


public void addQuestionToPaper() throws Exception
{  

	System.out.println("sccsasacsac");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try
	{
		conn = DBConnection.getConnection();
		
		{
			String sql = "insert into QuestionPaperSet(paperId,questionId) values(?,?)";
			pstmt = conn.prepareStatement(sql);
			for(int i=0;i<questionId.length;i++)
			{
			pstmt.setInt(1,this.paperId);
			pstmt.setInt(2,questionId[i]);
			int rowAffected = pstmt.executeUpdate();
			System.out.println(rowAffected);
			if(rowAffected>0){
				message="Question Added Successfully !";
			}else{
				message="Please ! Try Again !";
			}
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

public String getQuestionByPaperId()throws Exception
{
	Connection conn = null;
	PreparedStatement pstmtSelect = null;
	ResultSet rsSelect = null;
	String str="";
	try
	{
		conn = DBConnection.getConnection();
		String query = "select questionId from QuestionPaperSet where paperId=?";
	
		pstmtSelect = conn.prepareStatement(query);
		pstmtSelect.setInt(1,this.paperId);
		rsSelect = pstmtSelect.executeQuery();
		while(rsSelect.next())
		{
			str=str+rsSelect.getInt("questionId")+",";
			
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
	return str;
}
public String getPaperNameAccordingToPaperId(int i1) throws Exception
{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String name="";
	try
	{
		conn = DBConnection.getConnection();
		String query = "select paperName from paper where paperId=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,i1);
		rset = pstmt.executeQuery();
		while(rset.next()){
	    name=rset.getString("paperName");
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

public int getTotalQuestionsByPaperId(int i1) throws Exception
{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	int q1=0;
	try
	{
		conn = DBConnection.getConnection();
		String query = "select totalQuestions from paper where paperId=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,i1);
		rset = pstmt.executeQuery();
		while(rset.next()){
	    q1=rset.getInt("totalQuestions");
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
	return q1;
}
public int getTimeDurationByPaperId(int t1) throws Exception
{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	int t2=0;
	try
	{
		conn = DBConnection.getConnection();
		String query = "select timeInMinute from paper where paperId=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,t1);
		rset = pstmt.executeQuery();
		while(rset.next()){
	    t2=rset.getInt("timeInMinute");
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
	return t2;



}


public ArrayList getQuestionsIdByPaperId(int paperId) 
{
	Connection conn = null;
	PreparedStatement pstmtSelect = null;
	ResultSet rsSelect = null;
	
	ArrayList list = new ArrayList(); 
	try
	{
		conn = DBConnection.getConnection();
		String query1 = "select questionId from QuestionPaperSet where paperId=?";
		pstmtSelect = conn.prepareStatement(query1);
		pstmtSelect.setInt(1,paperId);
		rsSelect = pstmtSelect.executeQuery();
	
		while(rsSelect.next())
		{
			list.add(rsSelect.getInt("questionId"));
			
		}
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
		
	}
	finally
		{ try{
			if(rsSelect != null){rsSelect.close();	}
			if(pstmtSelect != null)	{pstmtSelect.close();}
			if(conn != null){conn.close();	}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	return list;


}
}
