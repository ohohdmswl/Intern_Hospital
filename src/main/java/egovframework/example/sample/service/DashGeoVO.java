package egovframework.example.sample.service;

import java.util.Date;

public class DashGeoVO {

	private int sido_cd; //시도코드
	private String sido_nm; //시도이름
	private int sigungu_cd; //시군구코드
	private String sigungu_nm; //시군구이름
	
	
    @Override
    public String toString() {
        return "DashGeoVO [sido_cd=" + sido_cd + ", sido_nm=" + sido_nm + ", sigungu_cd=" + sigungu_cd +", sigungu_nm=" + sigungu_nm + "]";
    }


	public int getSido_cd() {
		return sido_cd;
	}


	public void setSido_cd(int sido_cd) {
		this.sido_cd = sido_cd;
	}


	public String getSido_nm() {
		return sido_nm;
	}


	public void setSido_nm(String sido_nm) {
		this.sido_nm = sido_nm;
	}


	public int getSigungu_cd() {
		return sigungu_cd;
	}


	public void setSigungu_cd(int sigungu_cd) {
		this.sigungu_cd = sigungu_cd;
	}


	public String getSigungu_nm() {
		return sigungu_nm;
	}


	public void setSigungu_nm(String sigungu_nm) {
		this.sigungu_nm = sigungu_nm;
	}
    
    
}
