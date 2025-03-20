package itfinder.vo;

public class JobVO 
{
	private String jno;          //채용공고번호
	private String uno ;         //회원번호
	private String jtitle ;      //채용공고명
	private String jkind ;       //채용유형
	private String jperiod1 ;    //모집기간1
	private String jperiod2 ;    //모집기간2
	private String jnumber ;     //모집인원
	private String jtype ;       //모집업종
	private String jnote ;       //직무내용
	private String jhour ;       //근무시간
	private String jregion;      //근무지역
	private String jpay ;        //급여
	private String jeducation ;  //학력
	private String jeducation2 ; //학력-졸업예정자
	private String jcareer ;     //경력
	private String jwdate;       //작성일
	private String jhit ;        //조회수
	private String uname ;     	 //회사명
	private String uceo; 		 //대표자명
	private String usize; 		 //기업규모
	private String uindustry; 	 //기업업종
	private String ubirth;   	 //설립일
	private String beno;   	 	 //복리후생
	private String pname ;        //기업회원 로고이미지 파일명
	
	public String getJno()        {	return jno;	       }
	public String getUno()        {	return uno;	       }
	public String getJtitle()     {	return jtitle;	   }
	public String getJkind()      {	return jkind;	   }
	public String getJperiod1()   {	return jperiod1;   }
	public String getJperiod2()   {	return jperiod2;   }
	public String getJnumber()    {	return jnumber;	   }
	public String getJtype()      {	return jtype;	   }
	public String getJnote()      {	return jnote;	   }
	public String getJhour()      {	return jhour;	   }
	public String getJregion()    {	return jregion;	   }
	public String getJpay()       {	return jpay;	   }
	public String getJeducation() {	return jeducation; }
	public String getJeducation2(){	return jeducation2;}
	public String getJcareer()    {	return jcareer;	   }
	public String getJwdate()     {	return jwdate;	   }
	public String getJhit()       {	return jhit;	   }
	public String getUname() 	  { return uname;	   }
	public String getUceo()		  { return uceo;	   }
	public String getUsize() 	  { return usize;	   }
	public String getUindustry()  { return uindustry;  }
	public String getUbirth()     { return ubirth;     }
	public String getBeno()       {	return beno;	   }
	public String getPname()        { return pname;	       }
	
	public void setJno(String jno)               { this.jno = jno;	             }
	public void setUno(String uno)               { this.uno = uno;	             }
	public void setJtitle(String jtitle)         { this.jtitle = jtitle;	     }
	public void setJkind(String jkind)           { this.jkind = jkind;	         }
	public void setJperiod1(String jperiod1)     { this.jperiod1 = jperiod1;	 }
	public void setJperiod2(String jperiod2)     { this.jperiod2 = jperiod2;	 }
	public void setJnumber(String jnumber)       { this.jnumber = jnumber;       }
	public void setJtype(String jtype)           { this.jtype = jtype;	         }
	public void setJnote(String jnote)           { this.jnote = jnote;	         }
	public void setJhour(String jhour)           { this.jhour = jhour;	         }
	public void setJregion(String jregion)       { this.jregion = jregion;	     }
	public void setJpay(String jpay)             { this.jpay = jpay;	         }
	public void setJeducation(String jeducation) { this.jeducation = jeducation; }
	public void setJeducation2(String jeducation2){ this.jeducation2 = jeducation2;}
	public void setJcareer(String jcareer)       { this.jcareer = jcareer;       }
	public void setJwdate(String jwdate)         { this.jwdate = jwdate;         }
	public void setJhit(String jhit)             { this.jhit = jhit;             }
	public void setUname(String uname) 			 { this.uname = uname;			 }
	public void setUceo(String uceo) 			 { this.uceo = uceo;			 }
	public void setUsize(String usize) 			 { this.usize = usize;  		 }
	public void setUindustry(String uindustry) 	 { this.uindustry = uindustry;   }
	public void setUbirth(String ubirth) 	     { this.ubirth = ubirth;         }
	public void setBeno(String beno)             { this.uno = beno;	             }
	public void setPname(String pname)           { this.pname = pname;	         }
	
	public String getJkindName()
	{
		String name = "";
		switch(this.jkind)
		{
		case "J":	name = "정규직"; break;
		case "B":	name = "비정규직"; break;
		}
		return name;
	}
	public String getJtypeName() 
	{
		String name = "";
		switch(this.jtype)
		{
		case "t0":	name = "모집업종"; break;
		case "t1":	name = "소프트웨어 엔지니어"; break;
		case "t2":	name = "프론트엔드 개발자"; break;
		case "t3":	name = "파이썬 개발자"; break;
		case "t4":	name = "머신러닝 엔지니어"; break;
		case "t5":	name = "웹개발자"; break;
		case "t6":	name = "자바 개발자"; break;
		case "t7":	name = "서버 개발자"; break;
		case "t8":	name = "c,c++ 개발자"; break;
		case "t9":	name = "안드로이드 개발자"; break;
		}
		return name;
	}
	public String getJregionName() 
	{
		String name = "";
		switch(this.jregion)
		{
		case "R0":	name = "지역"; break;
		case "R1":	name = "서울"; break;
		case "R2":	name = "경기도"; break;
		case "R3":	name = "강원도"; break;
		case "R4":	name = "충청남도"; break;
		case "R5":	name = "충청북도"; break;
		case "R6":	name = "전라남도"; break;
		case "R7":	name = "전라북도"; break;
		case "R8":	name = "경상남도"; break;
		case "R9":	name = "경상북도"; break;
		case "R10":	name = "제주도"; break;
		}
		return name;
	}
	
	public String getJeducationName() 
	{
		String name = "";
		switch(this.jeducation)
		{
		case "e0":	name = "학력 무관"; break;
		case "e1":	name = "고등학교 졸업"; break;
		case "e2":	name = "2년제 대학졸업"; break;
		case "e3":	name = "4년제 대학졸업"; break;
		case "e4":	name = "대학원 졸업"; break;
		}
		return name;
	}
	
	public String getJeducation2Name() 
	{
		String name = "";
		switch(this.jeducation2)
		{
		case "LC":	name = "(졸업예정자 가능)"; break;
		}
		return name;
	}
	
	public String getJcareerName() 
	{
		String name = "";
		switch(this.jcareer)
		{
		case "c0":	name = "경력 무관"; break;
		case "c1":	name = "1년 이상"; break;
		case "c2":	name = "2년 이상"; break;
		case "c3":	name = "3년 이상"; break;
		case "c4":	name = "4년 이상"; break;
		}
		return name;
	}

} 
