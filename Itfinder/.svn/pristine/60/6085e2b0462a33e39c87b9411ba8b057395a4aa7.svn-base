package itfinder.dto;
import java.util.*;

import itfinder.dao.*;
import itfinder.vo.*;

// 회원정보 관리 클래스
public class UserDTO extends DBManager 
{
	// 아이디 중복 검사
	// 리턴값 : true - 중복된 ID, false -중복이 안된 ID
	public boolean CheckID(String uid)
	{
		this.DBOpen();
		String sql = "";
		sql = "select uid from user where uid = '" + uid + "' ";
		this.OpenQuery(sql);
		if( this.GetNext() == true )
		{
			this.DBClose();
			return true;
		}
		this.DBClose();
		return false;
	}
	
	public boolean ComCheckID(String uname)
	{
		this.DBOpen();
		String sql = "";
		sql = "select uname from user where uname = '" + uname + "' ";
		this.OpenQuery(sql);
		if( this.GetNext() == true )
		{
			this.DBClose();
			return true;
		}
		this.DBClose();
		return false;
	}
	
	// 회원가입 처리
	// 리턴값 : true - 가입성공, false - 가입실패
	public boolean Join(UserVO vo)
	{
		if( CheckID(vo.getUid()) == true )
		{
			// 아이디가 중복됨.
			System.out.println("아이디 중복");
			return false;
		}
		this.DBOpen();
		
		// 회원가입
		String sql = "";
				
		sql  = "insert into user (uid,upw,uname,ukind,ubirth,uphone,";
		sql	+= "uemail,ulicensenum,uceo,usize,uindustry,pname,";
		sql	+= "agreeterm,agreeinfo,agreemarket) ";
		sql += "values (";
		sql += "'" + this._R(vo.getUid()) + "',";
		sql += "md5('" + vo.getUpw() + "'),";
		sql += "'" + this._R(vo.getUname()) + "',";
		sql += "'" + vo.getUkind() + "',";
		sql += "'" + vo.getUbirth() + "',";
		sql += "'" + vo.getUphone() + "',";
		sql += "'" + vo.getUemail() + "',";
		sql += "'" + vo.getUlicensenum() + "',";
		sql += "'" + vo.getUceo() + "',";
		sql += "'" + vo.getUsize() + "',";
		sql += "'" + vo.getUindustry() + "',";
		sql += "'" + vo.getPname()  + "',";
		sql += "'" + vo.getAgreeterm()  + "',";
		sql += "'" + vo.getAgreeinfo()  + "',";
		sql += "'" + vo.getAgreemarket()  + "'";
		sql += ") ";
		this.RunSQL(sql);
		
		// 등록된 회원 번호를 얻는다.
		sql = "select last_insert_id() as uno ";
		this.OpenQuery(sql);
		this.GetNext();
		vo.setUno(this.GetValue("uno"));
		
		// 기업로고를 등록한다.
//		if(vo.getPname() != null && !vo.getPname().equals(""))
//		{
//			sql  = "insert into user (uno,pname) ";
//			sql += "values (";
//			sql += "'" + vo.getUno() + "',";
//			sql += "'" + vo.getPname() + "'";
//			sql += ") ";
//			this.RunSQL(sql);	
//		}		
		
		this.DBClose();
		return true;
	}
	
	// 회원 로그인 처리
	public UserVO Login(String uid, String upw)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "select uno,uname,ukind from user ";
		sql += "where uid = '" + uid + "' ";
		sql += "and upw = md5('" + upw + "') ";
		sql += "and uretire = 'N' ";
		this.OpenQuery(sql);
		if( this.GetNext() == false )
		{
			// 회원 정보가 없음.
			this.DBClose();
			return null;
		}
		
		UserVO vo = new UserVO();
		vo.setUid(uid);
		vo.setUno(this.GetValue("uno"));
		vo.setUname(this.GetValue("uname"));
		vo.setUkind(this.GetValue("ukind"));
		this.DBClose();
		return vo;
	}
	
	public UserVO Read(String uno)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "select * from user ";
		sql += "where uno = '" + uno + "' ";
		this.OpenQuery(sql);
		if( this.GetNext() == false )
		{
			// 회원 정보가 없음.
			this.DBClose();
			return null;
		}
		
		UserVO vo = new UserVO();
		// 비번을 제외한 모든 컬럼의 값을 가져와 vo에 넣습니다
		vo.setUno(this.GetValue("uno"));
		vo.setUid(this.GetValue("uid"));
		vo.setUname(this.GetValue("uname"));
		vo.setUkind(this.GetValue("ukind"));
		vo.setUbirth(this.GetValue("ubirth"));
		vo.setUphone(this.GetValue("uphone"));
		vo.setUemail(this.GetValue("uemail"));
		vo.setUlicensenum(this.GetValue("ulicensenum"));
		vo.setUceo(this.GetValue("uceo"));
		vo.setUsize(this.GetValue("usize"));
		vo.setUindustry(this.GetValue("uindustry"));
		vo.setPname(this.GetValue("pname"));
		vo.setUretire(this.GetValue("uretire"));
		vo.setUjoindate(this.GetValue("ujoindate"));
		vo.setAgreeterm(this.GetValue("agreeterm"));
		vo.setAgreeinfo(this.GetValue("agreeinfo"));
		vo.setAgreemarket(this.GetValue("agreemarket"));
		this.DBClose();
		return vo;
	}
	
	//기업리뷰에서 기업회원 목록을 select~option으로 구현하기 위한 회원목록 조회 메서드
		//로그인한 회원이 이미 가입한 회사는 목록에서 제외됨.
		public ArrayList<Map<String,String>> GetList(String loginUno)
		{
			ArrayList<Map<String,String>> list = new ArrayList<Map<String,String>>();
			
			if( this.DBOpen() == false )
			{
				return list;
			}
			
			String sql = "";
			sql  = "select ";
			sql += " uno,uname,ukind,pname,";
			sql += " (select count(*) from review where uno = "+loginUno+" and rvuno = user.uno ) as done ";
			sql += " from user ";
			sql += " where ukind = 'c'";
			this.OpenQuery(sql);
			
			while(this.GetNext() == true)
			{
				
				Map<String,String> map = new HashMap<String,String>();
				map.put("uno",this.GetValue("uno"));
				map.put("uname",this.GetValue("uname"));
				map.put("ukind",this.GetValue("ukind"));
				map.put("pname",this.GetValue("pname"));
				map.put("done",this.GetValue("done"));
				list.add(map);
			}
		
		this.DBClose();
		return list;
	}

}
