package itfinder.dto;

import java.util.*;

import itfinder.dao.*;
import itfinder.vo.*;

// 기업리뷰 정보 관리 클래스
public class ReviewDTO extends DBManager
{
	// 기업리뷰를 등록한다.
		// 리턴값 : true - 등록성공, false - 등록실패	
		public boolean Insert(ReviewVO vo)
		{
			if( this.DBOpen() == false )
			{
				return false;
			}
			
			// Review 테이블에 자료를 등록한다.
			// uno는 리뷰작성회원번호, rvuno는 리뷰대상회원번호
			String sql = "";
			sql  = "insert into Review (uno,rvuno,rvcompanyname,rvtotal,rvbalance,rvpay,rvculture,rvcomment,rvgood,rvbad) ";
			sql += "values (";
			sql += "'" + vo.getUno() + "',";
			sql += "(select uno from user where uname = '" + vo.getRvcompanyname() + "'), ";
			sql += "'" + vo.getRvcompanyname() + "',";
			sql += "'" + vo.getRvtotal()+ "',";
			sql += "'" + vo.getRvbalance()+ "',";
			sql += "'" + vo.getRvpay()+ "',";
			sql += "'" + vo.getRvculture()+ "',";
			sql += "'" + this._R(vo.getRvcomment()) + "',";
			sql += "'" + this._R(vo.getRvgood()) + "',";
			sql += "'" + this._R(vo.getRvbad()) + "' ";
			sql += ")";
			this.RunSQL(sql);
			
			// 등록된 기업리뷰의 번호를 얻는다.
			sql = "select last_insert_id() as rvno";
			this.OpenQuery(sql);
			this.GetNext();
			String rvno = this.GetValue("rvno");
			vo.setRvno(rvno);
							
			this.DBClose();
			return true;
		}
		
	
		// 전체 기업리뷰 갯수를 얻는다.   
		// companyname : 회사명	
		public int GetTotal(String companyname)
		{
			int total = 0;
			if( this.DBOpen() == false )
			{
				return total;
			}
			
			// 게시물의 갯수를 얻는다.
			String sql = "";
			sql  = "select count(*) as count "; 
			sql += "from review ";
			sql += "where rvcompanyname like '%" + companyname + "%' ";
			
			this.OpenQuery(sql);
			this.GetNext();
			total = this.GetInt("count");
			this.CloseQuery();
			
			this.DBClose();
			return total;
		}
		
		// 기업리뷰 목록을 조회한다. 
		// companyname : 회사명	
		public ArrayList<ReviewVO> GetList(int pageno, String companyname)
		{
			ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
			
			if( this.DBOpen() == false )
			{
				return list;
			}		
			
			// 기업리뷰 목록을 얻는다.
			String sql = "";
		    sql  = "select rvno,rvuno,rvcompanyname,rvtotal,rvbalance,rvpay,rvculture,rvcomment,rvgood,rvbad, ";
		    sql += "(select pname from user where uno = review.rvuno ) as pname ";
		    sql += "from review ";
			sql += "where rvcompanyname like '%" + companyname + "%' ";
				
			// 최근 게시물로 정렬
			sql += "order by rvno desc ";
			
			// 페이지당 10개씩 가져오도록 limit를 처리한다.
			int startno = 5 * (pageno - 1);
			sql += "limit " + startno + ",5";
		
			this.OpenQuery(sql);		
			while(this.GetNext())
			{
				ReviewVO vo = new ReviewVO();
				
				vo.setRvcompanyname(this.GetValue("rvcompanyname"));
		        vo.setRvno(this.GetValue("rvno"));
		        vo.setRvuno(this.GetValue("rvuno"));
		        vo.setRvtotal(this.GetValue("rvtotal"));
		        vo.setRvbalance(this.GetValue("rvbalance"));
		        vo.setRvpay(this.GetValue("rvpay"));
		        vo.setRvculture(this.GetValue("rvculture"));
		        vo.setRvcomment(this.GetValue("rvcomment"));
		        vo.setRvgood(this.GetValue("rvgood"));
		        vo.setRvbad(this.GetValue("rvbad"));
		        vo.setRvpname(this.GetValue("pname"));
		
				list.add(vo);
			}
			
			this.DBClose();
			return list;
		}		
		
		
}
