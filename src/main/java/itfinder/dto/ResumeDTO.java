package itfinder.dto;

import java.util.*;

import itfinder.dao.*;
import itfinder.vo.*;

public class ResumeDTO extends DBManager
{
	// 이력서 등록
	public boolean ReInsert(ResumeVO vo)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		String sql = "";
		sql  = "insert into resume (";
		sql += "uno,reeducation,rescore,";
		sql += "reschoolname,remajor,regraduation,recompanyname,retenure,";
		sql += "reposition,restatus,reperformance,reself,retitle) ";
		sql += "values (";
		sql += "'" + vo.getUno() +"',";
		sql += "'" + vo.getReeducation() +"',";
		sql += "'" + vo.getRescore() + "',";
		sql += "'" + vo.getReschoolname() + "',";
		sql += "'" + vo.getRemajor() + "',";
		sql += "'" + vo.getRegraduation() + "',";
		sql += "'" + vo.getRecompanyname() + "',";
		sql += "'" + vo.getRetenure() + "',";
		sql += "'" + vo.getReposition() + "',";
		sql += "'" + vo.getRestatus() + "',";
		sql += "'" + vo.getReperformance() + "',";
		sql += "'" + vo.getReself() + "',";
		sql += "'" + vo.getRetitle() + "'";
		sql += ") ";
		this.RunSQL(sql);
		
		//등록된 이력서의 번호를 얻는다.
		sql = "select last_insert_id() as reno ";
		this.OpenQuery(sql);
		this.GetNext();
		String reno = this.GetValue("reno");
		vo.setReno(reno);
		this.DBClose();
		return true;
	}
	
	// 이력서 정보를 변경한다.
	// 리턴값 : true - 변경성공, false - 변경실패	
	public boolean ReUpdate(ResumeVO vo)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		// resume 테이블에 자료를 변경한다.
		String sql = "";
		sql  = "update resume ";
		sql += "set ";
		sql += "reeducation = '"   + vo.getReeducation() + "', ";
		sql += "rescore = '" 	   + vo.getRescore() + "', ";
		sql += "reschoolname = '"  + vo.getReschoolname() + "', ";
		sql += "remajor = '" 	   + vo.getRemajor() + "', ";
		sql += "regraduation = '"  + vo.getRegraduation() + "', ";
		sql += "recompanyname = '" + vo.getRecompanyname() + "', ";
		sql += "retenure = '" 	   + vo.getRetenure() + "', ";
		sql += "reposition = '"    + vo.getReposition() + "', ";
		sql += "restatus = '" 	   + vo.getRestatus() + "', ";
		sql += "reperformance = '" + vo.getReperformance() + "', ";
		sql += "reself = '" 	   + vo.getReself() + "', ";
		sql += "retitle = '" 	   + vo.getRetitle() + "' ";
		sql += "where reno = '"    + vo.getReno() + "' ";
		this.RunSQL(sql);
		
		this.DBClose();
		return true;		
	}
	
	// 이력서를 삭제한다.
	public boolean ReDelete(String reno)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		String sql = "";
		sql = "delete from resume where reno = " + reno;
		this.RunSQL(sql);

		this.DBClose();
		return true;		
	}
		
	// 이력서 정보를 조회한다.
	public ResumeVO ReRead(String reno)
	{
		if( this.DBOpen() == false )
		{
			return null;
		}
		
		String sql = "";
	    sql  = "select ";
	    sql += "r.reno, r.uno, r.reeducation, r.rescore, r.reschoolname, ";
	    sql += "r.remajor, r.regraduation, r.recompanyname, r.retenure, ";
	    sql += "r.reposition, r.restatus, r.reperformance, r.reself, r.retitle, ";
	    sql += "date(r.rewdate) as rewdate, ";
	    sql += "u.uname, u.uphone, u.uemail "; // 사용자의 이름, 연락처, 이메일 추가
	    sql += "from resume r ";
	    sql += "join user u on r.uno = u.uno ";
	    sql += "where r.reno = " + reno;
		    
		this.OpenQuery(sql);
		
		if(this.GetNext() == false)
		{
			// 이력서 없음.
			this.DBClose();
			return null;
		}
		
		ResumeVO rvo = new ResumeVO();
		rvo.setReno(reno);
		rvo.setUno(this.GetValue("uno"));
		rvo.setReeducation(this.GetValue("reeducation"));
		rvo.setRescore(this.GetValue("rescore"));
		rvo.setReschoolname(this.GetValue("reschoolname"));
		rvo.setRemajor(this.GetValue("remajor"));
		rvo.setRegraduation(this.GetValue("regraduation"));
		rvo.setRecompanyname(this.GetValue("recompanyname"));
		rvo.setRetenure(this.GetValue("retenure"));
		rvo.setReposition(this.GetValue("reposition"));
		rvo.setRestatus(this.GetValue("restatus"));
		rvo.setReperformance(this.GetValue("reperformance"));
		rvo.setReself(this.GetValue("reself"));
		rvo.setRetitle(this.GetValue("retitle"));
		rvo.setRewdate(this.GetValue("rewdate"));
	    rvo.setUname(this.GetValue("uname"));
	    rvo.setUphone(this.GetValue("uphone"));
	    rvo.setUemail(this.GetValue("uemail"));
		
		this.DBClose();
		return rvo;
	}
	
		//전체 이력서 갯수를 얻는다.
		//kind: 구분
		// C : 기업회원 P : 개인회원 
		//keyword : 검색어 
		public int GetTotal(String uno)
		{
			int total = 0;
			if( this.DBOpen() == false )
			{
				return total;
			}
			
			//게시물의 갯수를 얻는다.
			String sql = "";
			sql  = "select count(*) as count "; 
			sql += "from resume ";
			sql += "where uno = '" + uno + "' ";
			
			this.OpenQuery(sql);
			this.GetNext();
			total = this.GetInt("count");
			this.CloseQuery();
			
			this.DBClose();
			return total;
		}
		/*
		public int GetTotal2(String reno)
		{
			int total = 0;
			if( this.DBOpen() == false )
			{
				return total;
			}
			
			//게시물의 갯수를 얻는다.
			String sql = "";
			sql  = "select count(*) as count "; 
			sql += "from applicant ";
			sql += "where r.reno = '" + reno + "'"; // 메서드로부터 전달받은 uno 변수를 사용
			
			this.OpenQuery(sql);
			this.GetNext();
			total = this.GetInt("count");
			this.CloseQuery();
			
			this.DBClose();
			return total;
		}
		*/
		
		//이력서 목록을 조회한다.
		public ArrayList<ResumeVO> GetList(int pageno, String uno)
		{
			ArrayList<ResumeVO> list = new ArrayList<ResumeVO>();
			
			if( this.DBOpen() == false )
			{
				return list;
			}		
			
			//게시물 목록을 얻는다.
			String sql = "";
			sql  = "select reno,reeducation,rescore,reschoolname,remajor,";
			sql += "regraduation,recompanyname,retenure,reposition,";
			sql += "restatus,reperformance,reself,retitle,date(rewdate) as rewdate ";
			sql += "from resume ";
			sql += "where uno = " + uno ;
			
			// 최근 게시물로 정렬
			sql += " order by reno desc ";
			
			int startno = 10 * (pageno - 1);
			sql += "limit " + startno + ",10";
					
			this.OpenQuery(sql);		
			while(this.GetNext())
			{
				ResumeVO rvo = new ResumeVO();
				rvo.setReno(this.GetValue("reno"));
				rvo.setReeducation(this.GetValue("reeducation"));
				rvo.setRescore(this.GetValue("rescore"));
				rvo.setReschoolname(this.GetValue("reschoolname"));
				rvo.setRemajor(this.GetValue("remajor"));
				rvo.setRegraduation(this.GetValue("regraduation"));
				rvo.setRecompanyname(this.GetValue("recompanyname"));
				rvo.setRetenure(this.GetValue("retenure"));
				rvo.setReposition(this.GetValue("reposition"));
				rvo.setRestatus(this.GetValue("restatus"));
				rvo.setReperformance(this.GetValue("reperformance"));
				rvo.setReself(this.GetValue("reself"));
				rvo.setRewdate(this.GetValue("rewdate"));
				rvo.setRetitle(this.GetValue("retitle"));
				
				list.add(rvo);
			}
			
			this.DBClose();
			return list;
		}
		
		//이력서를 복사한다.
		public boolean Copy(String reno)
		{
			if( this.DBOpen() == false )
			{
				return false;
			}			
			
			String sql = "";
			
			sql  = "insert into resume (";
			sql += "uno,reeducation,rescore,";
			sql += "reschoolname,remajor,regraduation,recompanyname,retenure,";
			sql += "reposition,restatus,reperformance,reself,retitle) ";
			sql += "select ";
			sql += "uno,reeducation,rescore,";
			sql += "reschoolname,remajor,regraduation,recompanyname,retenure,";
			sql += "reposition,restatus,reperformance,reself,  ";
			sql += "concat(retitle,'(복사본)') ";
			sql += "from resume  ";
			sql += "where reno = " + reno;
			
			this.RunSQL(sql);
			
			return true;
		}
		
		//이력서 목록과 채용공고 목록을 함께 조회한다.
		public ArrayList<ResumeVO> GetListWithJob(int pageno, String uno)
		{
			ArrayList<ResumeVO> list = new ArrayList<ResumeVO>();

		    if( this.DBOpen() == false ) {
		        return list;
		    }       

		    // applicant와 resume, job 테이블을 조인하여 이력서 목록을 얻는다.
		    String sql = "";
		    sql  = "select r.*, r.uno as applicant_uno, j.jno, j.jtitle ";
		    sql += "from applicant a ";
		    sql += "join resume r ON a.reno = r.reno ";
		    sql += "join job j ON a.jno = j.jno ";
		    sql += "where j.uno = '" + uno + "'"; // 메서드로부터 전달받은 uno 변수를 사용
		    sql += "order by j.jno desc ";
		    
		    int startno = 10 * (pageno - 1);
			sql += "limit " + startno + ",10";
			
		    this.OpenQuery(sql);      
		    while(this.GetNext()) {
		        ResumeVO rvo = new ResumeVO();

		        // 추가: 지원한 채용공고 번호 및 제목
		        rvo.setJno(this.GetValue("jno"));
		        rvo.setReno(this.GetValue("reno"));
		        rvo.setJtitle(this.GetValue("jtitle")); // JobVO에서 채용공고 제목을 가져오는 부분 추가
		        rvo.setUno(this.GetValue("applicant_uno")); // 지원자의 uno 추가
		        rvo.setRetenure(this.GetValue("retenure")); // 지원자의 경력 추가
		        rvo.setReschoolname(this.GetValue("reschoolname")); // 최종학력 필드 설정
		        rvo.setRemajor(this.GetValue("remajor")); // 전공명 필드 설정
		        
		        list.add(rvo);
		        
		    }

		    this.DBClose();
		    return list;
		}
}
