package itfinder.vo;

public class BenefitVO 
{
	private String beno;   // 복리후생관리번호
	private String jno;    // 채용공고번호
	private String bekind; // 분야코드
	private String bename; // 분야명
	
	public String getBeno()   { return beno;   }
	public String getJno()    { return jno;    }
	public String getBekind() { return bekind; }
	public String getBename() { return bename; }
	
	public void setBeno(String beno) { this.beno = beno; }
	public void setJno(String jno)   { this.jno = jno;   }
	public void setBekind(String bekind) { this.bekind = bekind; }
	public void setBename(String bename) { this.bename = bename; }
	
}

