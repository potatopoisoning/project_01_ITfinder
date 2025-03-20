package itfinder.dto;

import java.util.*;

import itfinder.dao.*;
import itfinder.vo.*;

// 게시물 정보 관리 클래스
public class BoardDTO extends DBManager
{
	// 게시물을 등록한다.
	// 리턴값 : true - 등록성공, false - 등록실패	
	public boolean Insert(BoardVO vo)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		String btopValue = "N"; // 기본적으로 btop을 'N'으로 설정
	    if(vo.getBkind().equals("N")) // 공지사항인 경우
	    {
	        btopValue = "Y"; // btop을 'Y'로 설정
	    }
		
		// Board 테이블에 자료를 등록한다.
		String sql = "";
		sql  = "insert into board (uno,btitle,bnote,bkind,btop,bsource) ";
		sql += "values (";
		sql += "'" + vo.getUno() + "',";
		sql += "'" + this._R(vo.getBtitle()) + "',";
		sql += "'" + this._R(vo.getBnote()) + "',";
		sql += "'" + vo.getBkind() + "',";
		sql += "'" + vo.getBtop() + "',";
		sql +=" '" + vo.getBsource()+ "'";
		sql += ")";
		this.RunSQL(sql);

		// 등록된 게시물의 번호를 얻는다.
		sql = "select last_insert_id() as bno ";
		this.OpenQuery(sql);
		this.GetNext();
		String bno = this.GetValue("bno");
		vo.setBno(bno);
		
		// 첨부파일을 등록한다.
		if(vo.getFname() != null && !vo.getFname().equals(""))
		{
			sql  = "insert into attach (bno,pname,fname) ";
			sql += "values (";
			sql += "'" + vo.getBno() + "',";
			sql += "'" + vo.getPname() + "',";
			sql += "'" + vo.getFname() + "'";
			sql += ") ";
			this.RunSQL(sql);	
		}		
		this.DBClose();
		return true;
	}
	
	// 게시물을 삭제한다.
	// 리턴값 : true - 삭제성공, false - 삭제실패	
	public boolean Delete(String bno)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		// 첨부파일 삭제 -> 댓글 삭제 -> 게시물 삭제
		String sql = "";
		sql = "delete from attach where bno = " + bno;
		this.RunSQL(sql);

		sql = "delete from reply where bno = " + bno;
		this.RunSQL(sql);

		sql = "delete from board where bno = " + bno;
		this.RunSQL(sql);
		
		this.DBClose();
		return true;		
	}
	
	// 게시물 정보를 변경한다.
	// 리턴값 : true - 변경성공, false - 변경실패	
	public boolean Update(BoardVO vo)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		// Board 테이블에 자료를 변경한다.
		String sql = "";
		sql  = "update board ";
		sql += "set ";
		sql += "btitle = '" + this._R(vo.getBtitle()) + "', ";
		sql += "bnote = '" + this._R(vo.getBnote()) + "', ";
		sql += "bkind = '" + vo.getBkind() + "', ";
		sql += "btop = '" + vo.getBtop() + "', ";
		sql += "bsource = '" + vo.getBsource() + "' ";
		sql += "where bno = '" + vo.getBno() + "' ";
		this.RunSQL(sql);
		
		// 첨부파일을 등록한다.
		if(vo.getFname() != null && !vo.getFname().equals(""))
		{
			// 기존 첨부파일을 모두 삭제한다.
			sql = "delete from attach where bno = '" + vo.getBno() + "' ";
			this.RunSQL(sql);
			
			sql  = "insert into attach (bno,pname,fname) ";
			sql += "values (";
			sql += "'" + vo.getBno() + "',";
			sql += "'" + vo.getPname() + "',";
			sql += "'" + vo.getFname() + "'";
			sql += ") ";
			this.RunSQL(sql);	
		}	
		
		this.DBClose();
		return true;		
	}
	
	// 게시물 정보를 조회한다.
	// ishit : true - 조회수를 증가, false - 조회수 증가 안함.
	public BoardVO Read(String bno,boolean ishit)
	{
		if( this.DBOpen() == false )
		{
			return null;
		}
		
		String sql = "";
		// 해당 게시물 번호에 대한 정보를 조회한다.
		sql  = "select uno,btitle,bnote,bkind,btop,bsource,bwdate,bhit, ";
		sql += "(select uname from user where uno = board.uno) as uname ";
		sql += "from board ";
		sql += "where bno = " + bno;
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			// 해당 게시물 없음.
			this.DBClose();
			return null;
		}
	
		BoardVO vo = new BoardVO();
		vo.setBno(bno);
		vo.setUno(this.GetValue("uno"));
		vo.setBtitle(this.GetValue("btitle"));
		vo.setBnote(this.GetValue("bnote"));
		vo.setBkind(this.GetValue("bkind"));
		vo.setBtop(this.GetValue("btop"));
		vo.setBsource(this.GetValue("bsource"));
		vo.setBwdate(this.GetValue("bwdate"));
		vo.setBhit(this.GetValue("bhit"));
		vo.setUname(this.GetValue("uname"));		
		
		// 첨부파일 정보를 조회한다.
		sql  = "select pname,fname "; 
		sql += "from attach ";
		sql += "where bno = " + bno;
		this.OpenQuery(sql);
		if( this.GetNext() == true)
		{
			vo.setPname(this.GetValue("pname"));
			vo.setFname(this.GetValue("fname"));
		}		
		
		if(ishit == true)
		{
			// 조회수를 증가시킨다.
			sql  = "update board set bhit = bhit + 1 ";
			sql += "where bno = " + bno;
			this.RunSQL(sql);
		}
		
		this.DBClose();
		return vo;
	}
	
	// 전체 게시물 갯수를 얻는다.
	// type : T - 제목에서 검색, N - 내용에서 검색 , 빈값 : 제목+내용에서 검색   
	// keyword : 검색어 
	public int GetTotal(String kind,String type, String keyword)
	{
		int total = 0;
		if( this.DBOpen() == false )
		{
			return total;
		}
		
		// 게시물의 갯수를 얻는다.
		String sql = "";
		sql  = "select count(*) as count "; 
		sql += "from board ";
		sql += "where bkind IN ('N', 'F') ";
		if(!keyword.equals(""))
		{
			if(type.equals("T"))
			{
				// 제목에서 검색 
				sql += "and btitle like '%" + keyword + "%' ";
			}else if(type.equals("N"))
			{
				// 내용에서 검색 
				sql += "and bnote like '%" + keyword + "%' ";
			}else
			{
				// 제목 + 내용에서 검색 
				sql += "and ( btitle like '%" + keyword + "%' ";
				sql += "or bnote like '%" + keyword + "%' ) ";
			}
		}
		this.OpenQuery(sql);
		this.GetNext();
		total = this.GetInt("count");
		this.CloseQuery();
		
		this.DBClose();
		return total;
	}
	
	// 게시물 목록을 조회한다.
	// kind: 구분
	// type : T - 제목에서 검색, N - 내용에서 검색 , 빈값 : 제목+내용에서 검색   
	// keyword : 검색어 	
	// **
	public ArrayList<BoardVO> GetList(int pageno, String kind, String type, String keyword)
	{
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		if( this.DBOpen() == false )
		{
			return list;
		}		
		
		// 게시물 목록을 얻는다.
		String sql = "";
		sql  = "select bno,btitle,bnote,bsource,date(bwdate) as bwdate,bhit,bkind, ";
		sql += "(select uname from user where uno = board.uno) as uname, ";
		sql += "(select count(rno) from reply where bno = board.bno) as rno "; 
		sql += "from board ";
		sql += "where bkind IN ('N', 'F') ";
		if(!keyword.equals(""))
		{
			if(type.equals("T"))
			{
				// 제목에서 검색 
				sql += "and btitle like '%" + keyword + "%' ";
			}else if(type.equals("N"))
			{
				// 내용에서 검색 
				sql += "and bnote like '%" + keyword + "%' ";
			}else
			{
				// 제목 + 내용에서 검색 
				sql += "and ( btitle like '%" + keyword + "%' ";
				sql += "or bnote like '%" + keyword + "%' ) ";
			}
		}		
		// 최근 게시물로 정렬
		sql += "order by case when bkind = 'N' then 0 else 1 end, bno desc ";
		
		// 페이지당 10개씩 가져오도록 limit를 처리한다.
		int startno = 10 * (pageno - 1);
		sql += "limit " + startno + ",10";
	
		this.OpenQuery(sql);		
		while(this.GetNext())
		{
			BoardVO vo = new BoardVO();
			
			vo.setBno(this.GetValue("bno"));
			vo.setBtitle(this.GetValue("btitle"));
			vo.setBnote(this.GetValue("bnote"));
			vo.setBsource(this.GetValue("bsource"));
			vo.setBwdate(this.GetValue("bwdate"));
			vo.setBhit(this.GetValue("bhit"));
			vo.setUname(this.GetValue("uname"));
			vo.setRno(this.GetValue("rno"));
			vo.setBkind(this.GetValue("bkind"));
			
			list.add(vo);
		}
		
		this.DBClose();
		return list;
	}
	
	// 취업뉴스의 게시물 갯수를 얻는다.
	// type : T - 제목에서 검색, N - 내용에서 검색 , 빈값 : 제목+내용에서 검색   
	// keyword : 검색어 
	public int NewsGetTotal(String kind,String type, String keyword)
	{
		int total = 0;
		if( this.DBOpen() == false )
		{
			return total;
		}
		
		// 게시물의 갯수를 얻는다.
		String sql = "";
		sql  = "select count(*) as count "; 
		sql += "from board ";
		sql += "where bkind = 'R'";
		if(!keyword.equals(""))
		{
			if(type.equals("T"))
			{
				// 제목에서 검색 
				sql += "and btitle like '%" + keyword + "%' ";
			}else if(type.equals("N"))
			{
				// 내용에서 검색 
				sql += "and bnote like '%" + keyword + "%' ";
			}else
			{
				// 제목 + 내용에서 검색 
				sql += "and ( btitle like '%" + keyword + "%' ";
				sql += "or bnote like '%" + keyword + "%' ) ";
			}
		}
		this.OpenQuery(sql);
		this.GetNext();
		total = this.GetInt("count");
		this.CloseQuery();
		
		this.DBClose();
		return total;
	}
	
	// 취업뉴스의 게시물 목록을 조회한다.
	// kind: 구분
	// type : T - 제목에서 검색, N - 내용에서 검색 , 빈값 : 제목+내용에서 검색   
	// keyword : 검색어 	
	// **
	public ArrayList<BoardVO> NewsGetList(int pageno, String kind, String type, String keyword)
	{
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		if( this.DBOpen() == false )
		{
			return list;
		}		
		
		// 게시물 목록을 얻는다.
		String sql = "";
		sql  = "select bno,btitle,bnote,bsource,date(bwdate) as bwdate,bhit, ";
		sql += "(select uname from user where uno = board.uno) as uname ";
		sql += "from board ";
		sql += "where bkind = 'R'";
		if(!keyword.equals(""))
		{
			if(type.equals("T"))
			{
				// 제목에서 검색 
				sql += "and btitle like '%" + keyword + "%' ";
			}else if(type.equals("N"))
			{
				// 내용에서 검색 
				sql += "and bnote like '%" + keyword + "%' ";
			}else
			{
				// 제목 + 내용에서 검색 
				sql += "and ( btitle like '%" + keyword + "%' ";
				sql += "or bnote like '%" + keyword + "%' ) ";
			}
		}		
		// 최근 게시물로 정렬
		sql += "order by bno desc ";
		
		// 페이지당 10개씩 가져오도록 limit를 처리한다.
		int startno = 4 * (pageno - 1);
		sql += "limit " + startno + ",4";
	
		this.OpenQuery(sql);		
		while(this.GetNext())
		{
			BoardVO vo = new BoardVO();
			
			vo.setBno(this.GetValue("bno"));
			vo.setBtitle(this.GetValue("btitle"));
			vo.setBnote(this.GetValue("bnote"));
			vo.setBsource(this.GetValue("bsource"));
			vo.setBwdate(this.GetValue("bwdate"));
			vo.setBhit(this.GetValue("bhit"));
			vo.setUname(this.GetValue("uname"));
			
			list.add(vo);
		}
		
		this.DBClose();
		return list;
	}
	
	//취업뉴스의 이전글 보기
	public BoardVO GetPreviousNews(String currentBno, String bkind) 
	{
	    BoardVO vo = null;
	    if (this.DBOpen()) 
	    {
	        String sql = "select * from board where bno < '" + currentBno + "' and bkind = '" + bkind + "' order by bno desc limit 1";
	        this.OpenQuery(sql);
	        if (this.GetNext())
	        {
	            vo = new BoardVO();
	            vo.setBno(this.GetValue("bno"));
				vo.setBtitle(this.GetValue("btitle"));
				vo.setBnote(this.GetValue("bnote"));
				vo.setBsource(this.GetValue("bsource"));
				vo.setBwdate(this.GetValue("bwdate"));
				vo.setBhit(this.GetValue("bhit"));
				vo.setUname(this.GetValue("uname"));
	        }
	        this.CloseQuery();
	    }
	    this.DBClose();
	    return vo;
	}
	
	//취업뉴스의 다음글 보기
	public BoardVO GetNextNews(String currentBno, String bkind) 
	{
	    BoardVO vo = null;
	    if (this.DBOpen()) 
	    {
	        String sql = "select * from board where bno > '" + currentBno + "' and bkind = '" + bkind + "'  order by bno desc limit 1";
	        this.OpenQuery(sql);
	        if (this.GetNext()) 
	        {
	            vo = new BoardVO();
	            vo.setBno(this.GetValue("bno"));
				vo.setBtitle(this.GetValue("btitle"));
				vo.setBnote(this.GetValue("bnote"));
				vo.setBsource(this.GetValue("bsource"));
				vo.setBwdate(this.GetValue("bwdate"));
				vo.setBhit(this.GetValue("bhit"));
				vo.setUname(this.GetValue("uname"));
	        }
	        this.CloseQuery();
	    }
	    this.DBClose();
	    return vo;
	}
	
	//index 관련 메서드
	public ArrayList<BoardVO> NewsGetList1(int pageno, String kind)
	{
		ArrayList<BoardVO> list1 = new ArrayList<BoardVO>();
		
		if( this.DBOpen() == false )
		{
			return list1;
		}		
		
		// 게시물 목록을 얻는다.
		String sql = "";
		sql  = "select bno,btitle,bnote,bsource,date(bwdate) as bwdate,bhit, ";
		sql += "(select uname from user where uno = board.uno) as uname, ";
		sql += "(select count(rno) from reply where bno = board.bno) as rno "; 
		sql += "from board ";
		sql += "where bkind = 'R'";
		
		// 최근 게시물로 정렬
		sql += "order by bno desc ";
		
		// 페이지당 10개씩 가져오도록 limit를 처리한다.
		int startno = 10 * (pageno - 1);
		sql += "limit " + startno + ",5";
		
		this.OpenQuery(sql);		
		while(this.GetNext())
		{
			BoardVO vo = new BoardVO();
			
			vo.setBno(this.GetValue("bno"));
			vo.setBtitle(this.GetValue("btitle"));
			vo.setBnote(this.GetValue("bnote"));
			vo.setBsource(this.GetValue("bsource"));
			vo.setBwdate(this.GetValue("bwdate"));
			vo.setBhit(this.GetValue("bhit"));
			vo.setUname(this.GetValue("uname"));
			vo.setRno(this.GetValue("rno"));
			
			list1.add(vo);
		}
		
		this.DBClose();
		return list1;
	}
	
	public ArrayList<BoardVO> GetList1(int pageno, String kind)
	{
		ArrayList<BoardVO> list1 = new ArrayList<BoardVO>();
		
		if( this.DBOpen() == false )
		{
			return list1;
		}		
		
		// 게시물 목록을 얻는다.
		String sql = "";
		sql  = "select bno,btitle,bnote,bsource,date(bwdate) as bwdate,bhit, ";
		sql += "(select uname from user where uno = board.uno) as uname, ";
		sql += "(select count(rno) from reply where bno = board.bno) as rno "; 
		sql += "from board ";
		sql += "where bkind = 'F'";
		// 최근 게시물로 정렬
		sql += "order by bno desc ";
		
		// 페이지당 10개씩 가져오도록 limit를 처리한다.
		int startno = 10 * (pageno - 1);
		sql += "limit " + startno + ",5";
		
		this.OpenQuery(sql);		
		while(this.GetNext())
		{
			BoardVO vo = new BoardVO();
			
			vo.setBno(this.GetValue("bno"));
			vo.setBtitle(this.GetValue("btitle"));
			vo.setBnote(this.GetValue("bnote"));
			vo.setBsource(this.GetValue("bsource"));
			vo.setBwdate(this.GetValue("bwdate"));
			vo.setBhit(this.GetValue("bhit"));
			vo.setUname(this.GetValue("uname"));
			vo.setRno(this.GetValue("rno"));
			
			list1.add(vo);
		}
		
		this.DBClose();
		return list1;
	}
	
}
