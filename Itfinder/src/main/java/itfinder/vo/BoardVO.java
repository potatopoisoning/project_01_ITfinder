package itfinder.vo;

public class BoardVO 
{
	private String bno;    // 게시물번호
	private String uno;    // 회원번호
	private String btitle; // 제목
	private String bkind;  // 작성유형(공지사항(N)/취업뉴스(R)/일반게시글(F))
	private String btop;   // 공지사항상단
	private String bnote;  // 내용
	private String bwdate; // 작성일자
	private String bhit;   // 조회수
	private String bsource; // 뉴스출처
	private String pname;  // 물리파일명
	private String fname;  // 논리파일명
	//[[---Read를 위한 추가 선언
	private String uname;  // 작성자명
	private String rno;  // 댓글갯수
	//]]---Read를 위한 추가 선언
	
	public String getBno()     { return bno;     }
	public String getUno()     { return uno;     }
	public String getBtitle()  { return btitle;  }
	public String getBkind()   { return bkind;   }
	public String getBtop()    { return btop;    }
	public String getBnote()   { return bnote;   }
	public String getBwdate()  { return bwdate;  }
	public String getBhit()    { return bhit;    }
	public String getBsource() { return bsource; }
	public String getPname()   { return pname;   }
	public String getFname()   { return fname;   }
	public String getUname()   { return uname;   }
	public String getRno()     { return rno;     }

	public void setBno(String bno)         { this.bno = bno;         }
	public void setUno(String uno)         { this.uno = uno;         }
	public void setBtitle(String btitle)   { this.btitle = btitle;   }
	public void setBkind(String bkind)     { this.bkind = bkind;     }
	public void setBtop(String btop)       { this.btop = btop;       }
	public void setBnote(String bnote)     { this.bnote = bnote;     }
	public void setBwdate(String bwdate)   { this.bwdate = bwdate;   }
	public void setBhit(String bhit)       { this.bhit = bhit;       }
	public void setBsource(String bsource) { this.bsource = bsource; }
	public void setPname(String pname)     { this.pname = pname;     }
	public void setFname(String fname)     { this.fname = fname;     }
	public void setUname(String uname)     { this.uname = uname;     }
	public void setRno(String rno)         { this.rno = rno;         }
	
	
}
