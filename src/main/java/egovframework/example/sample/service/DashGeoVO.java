package egovframework.example.sample.service;

import java.util.Date;

public class DashGeoVO {

	private int sido_cd; //시도코드
	private String sido_nm; //시도이름
	
    @Override
    public String toString() {
        return "DashGeoVO [sido_cd=" + sido_cd + ", sido_nm=" + sido_nm +  "]";
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
    
	}
