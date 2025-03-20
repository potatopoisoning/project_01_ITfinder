package itfinder.vo;

public class ReplyVO
{
	private String rno;    // 댓글번호
	private String bno;    // 게시물번호
	private String uno;    // 댓글작성회원번호
	private String rnote;  // 댓글내용
	private String rwdate; // 작성일자
	//[[----Read를 위한 추가 선언
	private String uname;   //작성자명
	//]]----Read를 위한 추가 선언
	
	public String getRno()    { return rno;    }
	public String getBno()    { return bno;    }
	public String getUno()    { return uno;    }
	public String getRnote()  { return rnote;  }
	public String getRwdate() { return rwdate; }
	public String getUname()  {	return uname;	}
	
	public void setRno(String rno)       { this.rno = rno;       }
	public void setBno(String bno)       { this.bno = bno;       }
	public void setUno(String uno)       { this.uno = uno;       }
	public void setRnote(String rnote)   { this.rnote  = rnote;  }
	public void setRwdate(String rwdate) { this.rwdate = rwdate; }
	public void setUname(String uname)   {	this.uname = uname;	  }	
}