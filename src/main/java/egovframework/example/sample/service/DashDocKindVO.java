package egovframework.example.sample.service;

import java.util.Date;

public class DashDocKindVO {

	private int total_docMW; //조산사 총 합
	private int total_docM; //의과 총 합  
	private int total_docD; //치과 총 합
	private int total_docH; //한방 총 합
	private int sido_cd; //시도코드
	
    @Override
    public String toString() {
        return "DashDocKindVO [total_docMW=" + total_docMW + ", total_docM=" + total_docM +  ", total_docD=" + total_docD + ", total_docH=" + total_docH +", sido_cd=" + sido_cd + "]";
    }

	public int getTotal_docMW() {
		return total_docMW;
	}

	public void setTotal_docMW(int total_docMW) {
		this.total_docMW = total_docMW;
	}

	public int getTotal_docM() {
		return total_docM;
	}

	public void setTotal_docM(int total_docM) {
		this.total_docM = total_docM;
	}

	public int getTotal_docD() {
		return total_docD;
	}

	public void setTotal_docD(int total_docD) {
		this.total_docD = total_docD;
	}

	public int getTotal_docH() {
		return total_docH;
	}

	public void setTotal_docH(int total_docH) {
		this.total_docH = total_docH;
	}

	public int getSido_cd() {
		return sido_cd;
	}

	public void setSido_cd(int sido_cd) {
		this.sido_cd = sido_cd;
	}

    
    
    
    
    
    
	}
