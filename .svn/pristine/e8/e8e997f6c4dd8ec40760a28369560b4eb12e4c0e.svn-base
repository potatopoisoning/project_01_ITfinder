package itfinder.dto;

import java.util.*;

import itfinder.dao.*;
import itfinder.vo.*;

public class BenefitDTO extends DBManager
{
	public boolean Insert(String bekind, String bename, String jno)
	{
		this.DBOpen();
		
		String sql = "";
		
		//복리후생을 등록한다.
		sql  = "insert into benefit ";
		sql += " (bekind,bename,jno) ";
		sql += "values (";
		sql += "'" + bekind + "','" + bename + "','" + jno + "'";
		sql += ")";
		System.out.println(sql);
		this.RunSQL(sql);
		
		this.DBClose();
		return true;	
	}
	
	public ArrayList<BenefitVO> Read(String jno)
	{
		ArrayList<BenefitVO> list = new ArrayList<BenefitVO>();
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select ";
		sql += "    beno,bekind,bename ";
		sql += "from ";
		sql += "    benefit ";
		sql += "where ";
		sql += "    jno = " + jno;
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			BenefitVO vo = new BenefitVO();
			vo.setBeno(this.GetValue("beno"));
			vo.setBekind(this.GetValue("bekind"));
			vo.setBename(this.GetValue("bename"));
			list.add(vo);
		}
		
		this.DBClose();
		return list;
	}
}
