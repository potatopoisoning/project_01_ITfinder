package itfinder.dto;

import java.util.*;
import itfinder.dao.*;
import itfinder.vo.*;

//댓글 정보 관리 클래스
public class ReplyDTO extends DBManager
{
	// 댓글을 등록한다.
	// 리턴값 : true - 등록성공, false - 등록실패	
	public boolean Insert(ReplyVO vo)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		String sql = "";
		sql  = "insert into reply (bno,uno,rnote) ";
		sql += "values (";
		sql += "'" + vo.getBno() + "',";
		sql += "'" + vo.getUno() + "',";
		sql += "'" + this._R(vo.getRnote()) + "'";
		sql += ") ";
		this.RunSQL(sql);
		
		// 등록된 댓글의 번호를 얻는다.
		sql = "select last_insert_id() as rno ";
		this.OpenQuery(sql);
		this.GetNext();
		String rno = this.GetValue("rno");
		vo.setRno(rno);
		
		this.DBClose();
		return true;
	}
		
	// 댓글을 삭제한다.
	// 리턴값 : true - 삭제성공, false - 삭제실패	
	public boolean Delete(String rno)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		String sql = "";
		sql = "delete from reply where rno = " + rno;
		this.RunSQL(sql);
		
		this.DBClose();
		return true;
	}
	
	// 댓글 목록을 조회한다.
	public ArrayList<ReplyVO> GetList(String bno)
	{
		ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();
		
		if( this.DBOpen() == false )
		{
			return list;
		}
		
		String sql = "";
		sql  = "select rno,uno,rnote,date(rwdate) as rwdate, ";
		sql += "(select uname from user where uno = reply.uno) as uname ";
		sql += "from reply ";
		sql += "where bno = " + bno + " ";
		sql += "order by rno desc ";
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			ReplyVO vo = new ReplyVO();
			vo.setRno(this.GetValue("rno"));
			vo.setRnote(this.GetValue("rnote"));
			vo.setRwdate(this.GetValue("rwdate"));
			vo.setUno(this.GetValue("uno"));
			vo.setUname(this.GetValue("uname"));
			list.add(vo);
		}
		
		this.DBClose();
		return list;
	}
 	

}
