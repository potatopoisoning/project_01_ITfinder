package itfinder.vo;

//이력서 정보
public class ResumeVO 
{

	private String reno;           //이력서번호
	private String uno;            //회원번호
	private String reeducation;    //학력
	private String rescore;        //학점
	private String reschoolname;   //학교명
	private String remajor;        //전공명
	private String regraduation;   //졸업일자
	private String recompanyname;  //경력회사명
	private String retenure;       //재직기간
	private String reposition;     //직급
	private String restatus;       //재직여부
	private String reperformance;  //주요성과
	private String reself;  	   //자기소개서
	private String rename;		   //이름
	private String rewdate; 	   //작성일자
	//[[---GetListWithJob을 위한 추가 선언
	private String retitle; 	   //이력서 제목
	private String jno;            //채용공고번호
	private String jtitle;         //채용공고명
	private String uname;          // 이름
	private String uphone;          //연락처
	private String uemail;          //이메일
	//]]---GetListWithJob을 위한 추가 선언
	
	public String getReno()          { return reno;	         }
	public String getUno()           { return uno;	         }
	public String getReeducation()   { return reeducation;   }
	public String getRescore()       { return rescore;	     }
	public String getReschoolname()  { return reschoolname;	 }
	public String getRemajor()       { return remajor;	     }
	public String getRegraduation()  { return regraduation;	 }
	public String getRecompanyname() { return recompanyname; }
	public String getRetenure()      { return retenure;      }
	public String getReposition()    { return reposition;	 }
	public String getRestatus()      { return restatus;	     }
	public String getReperformance() { return reperformance; }
	public String getReself() 		 { return reself; 		 }
	public String getRename() 		 { return rename; 		 }
	public String getRewdate() 		 { return rewdate; 		 }
	public String getRetitle() 		 { return retitle; 		 }
	public String getJno() 		     { return jno; 		     }
	public String getJtitle() 		 { return jtitle; 		 }
	public String getUname() 		 { return uname; 		 }
	public String getUphone() 		 { return uphone; 		 }
	public String getUemail() 		 { return uemail; 		 }
	
	
	public void setReno(String reno)                   { this.reno = reno;	                 }
	public void setUno(String uno)                     { this.uno = uno;	                 }
	public void setReeducation(String reeducation)     { this.reeducation = reeducation;	 }
	public void setRescore(String rescore)             { this.rescore = rescore;	         }
	public void setReschoolname(String reschoolname)   { this.reschoolname = reschoolname; 	 }
	public void setRemajor(String remajor)             { this.remajor = remajor;	         }
	public void setRegraduation(String regraduation)   { this.regraduation = regraduation;	 }
	public void setRecompanyname(String recompanyname) { this.recompanyname = recompanyname; }
	public void setRetenure(String retenure)           { this.retenure = retenure;	         }
	public void setReposition(String reposition)       { this.reposition = reposition;	     }
	public void setRestatus(String restatus)           { this.restatus = restatus;	         }
	public void setReperformance(String reperformance) { this.reperformance = reperformance; }
	public void setReself(String reself)           	   { this.reself = reself;	        	 }
	public void setRename(String rename)           	   { this.rename = rename;	        	 }
	public void setRewdate(String rewdate)             { this.rewdate = rewdate;	         }
	public void setRetitle(String retitle)             { this.retitle = retitle;	         }
	public void setJno(String jno)             		   { this.jno = jno;	                 }
	public void setJtitle(String jtitle)               { this.jtitle = jtitle;	             }
	public void setUname(String uname)                 { this.uname = uname;	             }
	public void setUphone(String uphone)               { this.uphone = uphone;	             }
	public void setUemail(String uemail)               { this.uemail = uemail;	             }
}
