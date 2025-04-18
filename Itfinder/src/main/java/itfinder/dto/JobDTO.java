package itfinder.dto;

import java.util.*;

import itfinder.dao.*;
import itfinder.vo.*;

public class JobDTO extends DBManager
{
	

		// 게시물을 등록한다.
		// 리턴값 : true - 등록성공, false - 등록실패	
		public boolean Insert(JobVO vo)
		{
			if( this.DBOpen() == false )
			{
				return false;
			}
			
			// Job 테이블에 자료를 등록한다.
			String sql = "";
			sql  = "insert ";
			sql += "	into job";
			sql += "	(uno,jtitle,jkind,jperiod1,jperiod2,jnumber,jtype,jnote,jhour,jregion,jpay,jeducation,jeducation2,jcareer) ";
			sql += "values (";
			sql += "	'" + vo.getUno() + "',";
			sql += "	'" + this._R(vo.getJtitle()) + "',";
			sql += "	'" + vo.getJkind() + "',";
			sql += "	'" + vo.getJperiod1() + "',";
			sql += "	'" + vo.getJperiod2() + "',";
			sql += "	'" + this._R(vo.getJnumber()) + "',";
			sql += "	'" + vo.getJtype() + "',";
			sql += "	'" + this._R(vo.getJnote()) + "',";
			sql += "	'" + this._R(vo.getJhour()) + "',";
			sql += "	'" + vo.getJregion() + "',";
			sql += "	'" + this._R(vo.getJpay()) + "',";
			sql += "	'" + vo.getJeducation() + "',";
			sql += "	'" + vo.getJeducation2() + "',";
			sql += "	'" + vo.getJcareer() + "'";
			sql += ")";
			this.RunSQL(sql);
			// insert into job (uno,jtitle,jkind,jperiod,jnumber,jtype,jnote,jhour,jregion,jpay,jeducation,jcareer) 
			// values ('uno', 'jtitle', 'jkind', 'jperiod', 'jnumber', 'jtype', 'jnote', 'jhour', 'jregion', 'jpay', 'jeducation', 'jcareer');

			// 등록된 게시물의 번호를 얻는다.
			sql = "select last_insert_id() as jno ";
			this.OpenQuery(sql);
			this.GetNext();
			String jno = this.GetValue("jno");
			vo.setJno(jno);
			
			
			this.DBClose();
			return true;
		}
		
		// 게시물 정보를 조회한다.
		// ishit : true - 조회수를 증가, false - 조회수 증가 안함.
		public JobVO Read(String jno,boolean ishit)
		{
			if( this.DBOpen() == false )
			{
				return null;
			}
			
			String sql = "";
			// 해당 게시물 번호에 대한 정보를 조회한다.
			sql  = "select ";
			sql += "    uno,jtitle,jkind,jperiod1,jperiod2,jnumber,jtype,jnote,jhour,jregion,jpay,jeducation,jeducation2,jcareer,date(jwdate) as jwdate,jhit, ";
			sql += "    (select uname from user where uno = job.uno) as uname, ";
			sql += "    (select uceo from user where uno = job.uno) as uceo, ";
			sql += "    (select usize from user where uno = job.uno) as usize, ";
			sql += "    (select uindustry from user where uno = job.uno) as uindustry, ";
			sql += "    (select ubirth from user where uno = job.uno) as ubirth, ";
			sql += "	(select pname from user where uno = job.uno ) as pname ";
			sql += "from ";
			sql += "    job ";
			sql += "where ";
			sql += "    jno = " + jno;
			this.OpenQuery(sql);
			if(this.GetNext() == false)
			{
				// 해당 게시물 없음.
				this.DBClose();
				return null;
			}
		
			JobVO vo = new JobVO();
			vo.setJno(jno);
			vo.setUname(this.GetValue("uname"));		
			vo.setUno(this.GetValue("uno"));
			vo.setJtitle(this.GetValue("jtitle"));
			vo.setJkind(this.GetValue("jkind"));
			vo.setJperiod1(this.GetValue("jperiod1"));
			vo.setJperiod2(this.GetValue("jperiod2"));
			vo.setJnumber(this.GetValue("jnumber"));
			vo.setJtype(this.GetValue("jtype"));
			vo.setJnote(this.GetValue("jnote"));
			vo.setJhour(this.GetValue("jhour"));
			vo.setJregion(this.GetValue("jregion"));
			vo.setJpay(this.GetValue("jpay"));
			vo.setJeducation(this.GetValue("jeducation"));
			vo.setJeducation2(this.GetValue("jeducation2"));
			vo.setJcareer(this.GetValue("jcareer"));
			vo.setJwdate(this.GetValue("jwdate"));
			vo.setJhit(this.GetValue("jhit"));
			vo.setUceo(this.GetValue("uceo"));
			vo.setUsize(this.GetValue("usize"));
			vo.setUindustry(this.GetValue("uindustry"));
			vo.setUbirth(this.GetValue("ubirth"));
			vo.setPname(this.GetValue("pname"));
			
			if(ishit == true)
			{
				// 조회수를 증가시킨다.
				sql  = "update job set jhit = jhit + 1 ";
				sql += "where jno = " + jno;
				this.RunSQL(sql);
			}
			
			
			this.DBClose();
			return vo;
		}
		
		// 전체 게시물 갯수를 얻는다.
		// keyword : 검색어 
		public int GetTotal(String type, String region, String keyword)
		{
			int total = 0;
			if( this.DBOpen() == false )
			{
				return total;
			}
			
			// 게시물의 갯수를 얻는다.
			String sql = "";
			sql  = "select count(*) as count "; 
			sql += "from job ";
			
				// 채용공고 검색조건
				// 지역 선택시
				if(!region.equals("R0"))
				{
					if(!type.equals("t0") && !keyword.equals(""))
					{	
						sql += "where jregion = '" + region + "' ";
						sql += "and jtype = '" + type + "' ";
						sql += "and ( jtitle like '%" + keyword + "%' ";
						sql += "or jnote like '%" + keyword + "%' ) ";
					}else if(!type.equals("t0") && keyword.equals("")) //*
					{
						sql += "where jregion = '" + region + "' ";
						sql += "and jtype = '" + type + "' ";
					}else if(type.equals("t0") && !keyword.equals(""))
					{
						sql += "where jregion = '" + region + "' ";
						sql += "and ( jtitle like '%" + keyword + "%' ";
						sql += "or jnote like '%" + keyword + "%' ) ";
					}else if(type.equals("t0") && keyword.equals("")) //*
					{
						sql += "where jregion = '" + region + "' ";
					}
				}
				
				// 직업 선택시
				if(!type.equals("t0"))
				{
					if(region.equals("R0") && !keyword.equals(""))
					{
						sql += "where jtype = '" + type + "' ";
						sql += "and ( jtitle like '%" + keyword + "%' ";
						sql += "or jnote like '%" + keyword + "%' ) ";
					}else if(region.equals("R0") && keyword.equals("")) //*
					{
						sql += "where jtype = '" + type + "' ";
					}
				}
				
				// 키워드 입력시(공고 제목 + 내용에서 검색) 
				if(!keyword.equals(""))
				{
					if(region.equals("R0") && type.equals("t0"))
					{
						sql += "where ( jtitle like '%" + keyword + "%' ";
						sql += "or jnote like '%" + keyword + "%' ) ";
					}
				}
				
			this.OpenQuery(sql);
			this.GetNext();
			total = this.GetInt("count");
			this.CloseQuery();
			
			this.DBClose();
			return total;
		}
		
		public int GetTotal2(String uno)
		{
			int total = 0;
			if( this.DBOpen() == false )
			{
				return total;
			}
			
			// 게시물의 갯수를 얻는다.
			String sql = "";
			sql  = "select count(*) as count "; 
			sql += "from job ";
			sql += "where uno = '" + uno + "' ";
			
			this.OpenQuery(sql);
			this.GetNext();
			total = this.GetInt("count");
			this.CloseQuery();
			
			this.DBClose();
			return total;
		}
		
		// 게시물 목록을 조회한다.
		// keyword : 검색어 	
		public ArrayList<JobVO> GetList1(int pageno, String type, String region, String keyword)
		{
			ArrayList<JobVO> list1 = new ArrayList<JobVO>();
			
			if( this.DBOpen() == false )
			{
				return list1;
			}		
			
			// 게시물 목록을 얻는다.
			String sql = "";
			sql  = "select jno,jtitle,date(jwdate) as jwdate,jcareer,jeducation,"
					+ "jregion,jpay,jperiod1,jperiod2, ";
			sql += "(select uname from user where uno = job.uno) as uname ";
			sql += "from job ";
			// 채용공고 검색조건
			// 지역 선택시
			if(!region.equals("R0"))
			{
				if(!type.equals("t0") && !keyword.equals(""))
				{	
					sql += "where jregion = '" + region + "' ";
					sql += "and jtype = '" + type + "' ";
					sql += "and ( jtitle like '%" + keyword + "%' ";
					sql += "or jnote like '%" + keyword + "%' ) ";
				}else if(!type.equals("t0") && keyword.equals(""))
				{
					sql += "where jregion = '" + region + "' ";
					sql += "and jtype = '" + type + "' ";
				}else if(type.equals("t0") && !keyword.equals(""))
				{
					sql += "where jregion = '" + region + "' ";
					sql += "and ( jtitle like '%" + keyword + "%' ";
					sql += "or jnote like '%" + keyword + "%' ) ";
				}else if(type.equals("t0") && keyword.equals(""))
				{
					sql += "where jregion = '" + region + "' ";
				}
			}
			
			// 직업 선택시
			if(!type.equals("t0"))
			{
				if(region.equals("R0") && !keyword.equals(""))
				{
					sql += "where jtype = '" + type + "' ";
					sql += "and ( jtitle like '%" + keyword + "%' ";
					sql += "or jnote like '%" + keyword + "%' ) ";
				}else if(region.equals("R0") && keyword.equals(""))
				{
					sql += "where jtype = '" + type + "' ";
				}
			}
			
			// 키워드 입력시(공고 제목 + 내용에서 검색) 
			if(!keyword.equals(""))
			{
				if(region.equals("R0") && type.equals("t0"))
				{
					sql += "where ( jtitle like '%" + keyword + "%' ";
					sql += "or jnote like '%" + keyword + "%' ) ";
				}
			}
				
				 
					
			// 최근 게시물로 정렬
			sql += "order by jno desc ";
			
			// 페이지당 10개씩 가져오도록 limit를 처리한다.
			int startno = 10 * (pageno - 1);
			sql += "limit " + startno + ",10";
		
			this.OpenQuery(sql);		
			while(this.GetNext())
			{
				JobVO vo = new JobVO();
				
				vo.setJno(this.GetValue("jno"));
				vo.setJtitle(this.GetValue("jtitle"));
				vo.setJwdate(this.GetValue("jwdate"));
				vo.setJcareer(this.GetValue("jcareer"));
				vo.setJeducation(this.GetValue("jeducation"));
				vo.setJregion(this.GetValue("jregion"));
				vo.setJpay(this.GetValue("jpay"));
				vo.setJperiod1(this.GetValue("jperiod1"));
				vo.setJperiod2(this.GetValue("jperiod2"));
				vo.setUname(this.GetValue("uname"));
				
				list1.add(vo);
			}
			
			this.DBClose();
			return list1;
		}

		//String uno 추가함. 
		public ArrayList<JobVO> GetList2(int pageno, String uno)
		{
			ArrayList<JobVO> list2 = new ArrayList<JobVO>();
			
			if( this.DBOpen() == false )
			{
				return list2;
			}		
			
			// 게시물 목록을 얻는다.
			String sql = "";
			sql  = "select jno,jtitle,date(jwdate) as jwdate, ";
			sql += "(select uname from user where uno = job.uno) as uname ";
			sql += "from job ";
			sql += "where uno = '" + uno + "' "; // 로그인한 회원의 공고만 가져오기

			// 최근 게시물로 정렬
			sql += "order by jno desc ";
			
			// 페이지당 10개씩 가져오도록 limit를 처리한다.
			int startno = 10 * (pageno - 1);
			sql += "limit " + startno + ",10";
			
			this.OpenQuery(sql);		
			while(this.GetNext())
			{
				JobVO vo = new JobVO();
				
				vo.setJno(this.GetValue("jno"));
				vo.setJtitle(this.GetValue("jtitle"));
				vo.setJwdate(this.GetValue("jwdate"));
				vo.setUname(this.GetValue("uname"));
				
				list2.add(vo);
			}
			
			this.DBClose();
			return list2;
		}
		
		public ArrayList<JobVO> GetList3(int pageno)
		{
			ArrayList<JobVO> list3 = new ArrayList<JobVO>();
			
			if( this.DBOpen() == false )
			{
				return list3;
			}		
			
			// 게시물 목록을 얻는다.
			String sql = "";
			sql  = "select uno,jno,jtitle,date(jwdate) as jwdate, ";
			sql += "(select uname from user where uno = job.uno) as uname, ";
			sql += "(select pname from user where uno = job.uno ) as pname ";
			sql += "from job ";
			
			// 최근 게시물로 정렬
			sql += "order by jno desc ";
			
			// 페이지당 8개씩 가져오도록 limit를 처리한다.
			int startno = 10 * (pageno - 1);
			sql += "limit " + startno + ",8";
			
			this.OpenQuery(sql);		
			while(this.GetNext())
			{
				JobVO vo = new JobVO();
				
				vo.setUno(this.GetValue("uno"));
				vo.setJno(this.GetValue("jno"));
				vo.setJtitle(this.GetValue("jtitle"));
				vo.setJwdate(this.GetValue("jwdate"));
				vo.setUname(this.GetValue("uname"));
				vo.setPname(this.GetValue("pname"));
				
				list3.add(vo);
			}
			
			this.DBClose();
			return list3;
		}

		//여기서부터 추가
		//applicant테이블에 등록
		public boolean InsertApplicant(String reno, String jno) 
		{
			if( this.DBOpen() == false )
			{
				return false;
			}

			String sql = "insert into applicant (reno, jno) values ('" + reno + "', '" + jno + "')";
	    
			boolean apply = this.RunSQL(sql);

	        this.DBClose();
	        return apply;
	    }
}
