package egovframework.example.sample.service;

import java.util.Date;

public class DashHpKindVO {

	private int kind_cd; //병원종류코드
	private String kind_nm; //병원 종류 이름
	private int kind_tot; //병원 종류 개수(count)
	
    @Override
    public String toString() {
        return "DashHpKindVO [kind_cd=" + kind_cd + ", kind_nm=" + kind_nm +  ", kind_tot=" + kind_tot + "]";
    }
	
	public int getKind_cd() {
		return kind_cd;
	}
	public void setKind_cd(int kind_cd) {
		this.kind_cd = kind_cd;
	}
	public String getKind_nm() {
		return kind_nm;
	}
	public void setKind_nm(String kind_nm) {
		this.kind_nm = kind_nm;
	}
	public int getKind_tot() {
		return kind_tot;
	}
	public void setKind_tot(int kind_tot) {
		this.kind_tot = kind_tot;
	}
	
}
