package egovframework.example.sample.service;

import java.util.Date;

public class DashHosSearchListVO {

	private String hos_nm;		//병원이름
	private int hos_cd; 		//병원코드
	private String hos_tel; 	//병원전화번호
	private String hos_url; 	//병원 url
	private String hos_addr; 	//병원주소
	private int hos_zip;		//병원 우편번호
	private String hos_open; 	//병원 개원날자
	private int hos_x;			//병원 x좌표
	private int hos_y; 			//병원 y좌표
	private int doc_mg;			//의사 의과 일반의
	private int doc_mi; 		//의사 의과 인턴
	private int doc_mr;			//의사 의과 레지던트
	private int doc_mp; 		//의사 의과 전문의
	private int doc_dg; 		//의사 치과 일반의
	private int doc_di; 		//의사 치과 인턴
	private int doc_dr; 		//의사 치과 레지던트
	private int doc_dp; 		//의사 치과 전문의
	private int doc_hg; 		//의사 한방 일반의 
	private int doc_hi;			//의사 한방 인턴
	private int doc_hr; 		//의사 한방 레지던트
	private int doc_hp; 		//의사 한방 전문의
	private int doc_mw;			//의사 조산사
	private int doc_tat; 		//의사 총 합
	
    @Override
    public String toString() {
        return "DashDocKindVO [hos_nm=" + hos_nm 
        				  +", hos_cd=" + hos_cd 
        				  +", hos_tel=" + hos_tel 
        				  +", hos_url=" + hos_url 
        				  +", hos_addr=" + hos_addr 
        				  +", hos_zip=" + hos_zip 
        				  +", hos_open=" + hos_open 
        				  +", hos_x=" + hos_x 
        				  +", hos_y=" + hos_y 
        				  +", doc_mg=" + doc_mg 
        				  +", doc_mi=" + doc_mi 
        				  +", doc_mr=" + doc_mr 
        				  +", doc_mp=" + doc_mp 
        				  +", doc_dg=" + doc_dg 
        				  +", doc_di=" + doc_di 
        				  +", doc_dr=" + doc_dr 
        				  +", doc_dp=" + doc_dp 
        				  +", doc_hg=" + doc_hg 
        				  +", doc_hi=" + doc_hi 
        				  +", doc_hr=" + doc_hr 
        				  +", doc_hp=" + doc_hp 
        				  +", doc_mw=" + doc_mw 
        				  +", doc_tat=" + doc_tat 
        				  + "]";
    					    
    						}

	public String getHos_nm() {
		return hos_nm;
	}

	public void setHos_nm(String hos_nm) {
		this.hos_nm = hos_nm;
	}

	public int getHos_cd() {
		return hos_cd;
	}

	public void setHos_cd(int hos_cd) {
		this.hos_cd = hos_cd;
	}

	public String getHos_tel() {
		return hos_tel;
	}

	public void setHos_tel(String hos_tel) {
		this.hos_tel = hos_tel;
	}

	public String getHos_url() {
		return hos_url;
	}

	public void setHos_url(String hos_url) {
		this.hos_url = hos_url;
	}

	public String getHos_addr() {
		return hos_addr;
	}

	public void setHos_addr(String hos_addr) {
		this.hos_addr = hos_addr;
	}

	public int getHos_zip() {
		return hos_zip;
	}

	public void setHos_zip(int hos_zip) {
		this.hos_zip = hos_zip;
	}

	public String getHos_open() {
		return hos_open;
	}

	public void setHos_open(String hos_open) {
		this.hos_open = hos_open;
	}

	public int getHos_x() {
		return hos_x;
	}

	public void setHos_x(int hos_x) {
		this.hos_x = hos_x;
	}

	public int getHos_y() {
		return hos_y;
	}

	public void setHos_y(int hos_y) {
		this.hos_y = hos_y;
	}

	public int getDoc_mg() {
		return doc_mg;
	}

	public void setDoc_mg(int doc_mg) {
		this.doc_mg = doc_mg;
	}

	public int getDoc_mi() {
		return doc_mi;
	}

	public void setDoc_mi(int doc_mi) {
		this.doc_mi = doc_mi;
	}

	public int getDoc_mr() {
		return doc_mr;
	}

	public void setDoc_mr(int doc_mr) {
		this.doc_mr = doc_mr;
	}

	public int getDoc_mp() {
		return doc_mp;
	}

	public void setDoc_mp(int doc_mp) {
		this.doc_mp = doc_mp;
	}

	public int getDoc_dg() {
		return doc_dg;
	}

	public void setDoc_dg(int doc_dg) {
		this.doc_dg = doc_dg;
	}

	public int getDoc_di() {
		return doc_di;
	}

	public void setDoc_di(int doc_di) {
		this.doc_di = doc_di;
	}

	public int getDoc_dr() {
		return doc_dr;
	}

	public void setDoc_dr(int doc_dr) {
		this.doc_dr = doc_dr;
	}

	public int getDoc_dp() {
		return doc_dp;
	}

	public void setDoc_dp(int doc_dp) {
		this.doc_dp = doc_dp;
	}

	public int getDoc_hg() {
		return doc_hg;
	}

	public void setDoc_hg(int doc_hg) {
		this.doc_hg = doc_hg;
	}

	public int getDoc_hi() {
		return doc_hi;
	}

	public void setDoc_hi(int doc_hi) {
		this.doc_hi = doc_hi;
	}

	public int getDoc_hr() {
		return doc_hr;
	}

	public void setDoc_hr(int doc_hr) {
		this.doc_hr = doc_hr;
	}

	public int getDoc_hp() {
		return doc_hp;
	}

	public void setDoc_hp(int doc_hp) {
		this.doc_hp = doc_hp;
	}

	public int getDoc_mw() {
		return doc_mw;
	}

	public void setDoc_mw(int doc_mw) {
		this.doc_mw = doc_mw;
	}

	public int getDoc_tat() {
		return doc_tat;
	}

	public void setDoc_tat(int doc_tat) {
		this.doc_tat = doc_tat;
	}


    
}
