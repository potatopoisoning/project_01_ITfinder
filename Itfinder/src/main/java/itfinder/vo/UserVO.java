package itfinder.vo;

// 회원정보 데이터 VO
public class UserVO
{
	private String uno;       	// 회원번호
	private String uid;       	// 아이디
	private String upw;       	// 비밀번호
	private String uname;     	// 이름
	private String ukind;     	// 회원구분
	private String ubirth;   	// 생년월일
	private String uphone;    	// 연락처
	private String uemail;  	// 이메일
	private String ulicensenum; // 사업자등록번호
	private String uceo; 		// 대표자명
	private String usize; 		// 기업규모
	private String uindustry; 	// 기업업종
	private String pname; 		// 물리파일명
	private String uretire; 	// 탈퇴여부
	private String ujoindate; 	// 가입일자
	private String agreeterm; 	// 이용약관동의
	private String agreeinfo; 	// 개인정보수집동의
	private String agreemarket; // 마케팅동의
	
	public String getUno()			{ return uno;		  }
	public String getUid() 			{ return uid;		  }
	public String getUpw() 			{ return upw;		  }
	public String getUname() 		{ return uname;		  }
	public String getUkind() 		{ return ukind;		  }
	public String getUbirth() 		{ return ubirth;	  }
	public String getUphone() 		{ return uphone;	  }
	public String getUemail() 		{ return uemail;	  }
	public String getUlicensenum() 	{ return ulicensenum; }
	public String getUceo()			{ return uceo;		  }
	public String getUsize() 		{ return usize;		  }
	public String getUindustry() 	{ return uindustry;	  }
	public String getPname() 		{ return pname;		  }
	public String getUretire() 		{ return uretire;	  }
	public String getUjoindate()	{ return ujoindate;	  }
	public String getAgreeterm() 	{ return agreeterm;	  }
	public String getAgreeinfo() 	{ return agreeinfo;	  }
	public String getAgreemarket() 	{ return agreemarket; }
	
	public void setUno(String uno) 			{ this.uno = uno;                         }
	public void setUid(String uid) 			{ this.uid = uid;						  }
	public void setUpw(String upw) 			{ this.upw = upw;						  }
	public void setUname(String uname) 		{ this.uname = uname;					  }
	public void setUkind(String ukind)		{ this.ukind = ukind;					  }
	public void setUbirth(String ubirth) 	{ this.ubirth = ubirth;					  }
	public void setUphone(String uphone) 	{ this.uphone = uphone;					  }
	public void setUemail(String uemail) 	{ this.uemail = uemail;				 	  }
	public void setUlicensenum(String ulicensenum) 	{ this.ulicensenum = ulicensenum; }
	public void setUceo(String uceo) 		{ this.uceo = uceo;						  }
	public void setUsize(String usize) 		{ this.usize = usize;  					  }
	public void setUindustry(String uindustry) 		{ this.uindustry = uindustry;  	  }
	public void setPname(String pname) 		{ this.pname = pname;					  }
	public void setUretire(String uretire)  { this.uretire = uretire;				  }
	public void setUjoindate(String ujoindate) { this.ujoindate = ujoindate;		  }
	public void setAgreeterm(String agreeterm) { this.agreeterm = agreeterm;	 	  }
	public void setAgreeinfo(String agreeinfo) { this.agreeinfo = agreeinfo;		  }
	public void setAgreemarket(String agreemarket) { this.agreemarket = agreemarket;  }
}


