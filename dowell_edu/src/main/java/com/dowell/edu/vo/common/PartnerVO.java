package com.dowell.edu.vo.common;

import java.util.Date;



public class PartnerVO {
	
	/*
	MA_PRT_MT		거래처코드	VARCHAR2(8)	PRT_CD
	MA_PRT_MT		거래처명	VARCHAR2(10)	PRT_NM
	MA_PRT_MT		거래처구분코드	VARCHAR2(10)	PRT_DT_CD
	MA_PRT_MT		대표자명	VARCHAR2(50)	RPSV_NM
	MA_PRT_MT		사업자등록번호	VARCHAR2(20)	BSN_NO
	MA_PRT_MT		우편번호	VARCHAR2(10)	ZIP_NO
	MA_PRT_MT		주소	VARCHAR2(100)	ADDR
	MA_PRT_MT		상세주소	VARCHAR2(100)	ADDR_DTL
	MA_PRT_MT		전화번호	VARCHAR2(10)	TEL_NO
	MA_PRT_MT		핸드폰번호	VARCHAR2(11)	MBL_NO
	MA_PRT_MT		거래처상태코드	VARCHAR2(10)	PRT_SS_CD
	MA_PRT_MT		영업개시일자	VARCHAR2(8)	MBZ_ST_DT
	MA_PRT_MT		중지일자	VARCHAR2(8)	STP_DT
	MA_PRT_MT		해지일자	VARCHAR2(8)	CNCL_DT
	MA_PRT_MT		여신한도금액	NUMBER(12)	ORD_LMT_AMT
	MA_PRT_MT		최초등록일자	DATE	FST_REG_DT
	MA_PRT_MT		최초등록자	VARCHAR2(20)	FST_USER_ID
	MA_PRT_MT		최종수정일자	DATE	LST_UPD_DT
	MA_PRT_MT		최종수정자	VARCHAR2(20)	LST_UPD_ID

	*/
	
	private String prt_cd;
	private String prt_nm;
	private String prt_dt_cd;
	private String rpsv_nm;
	private String bsn_no;
	private String zip_no;
	private String addr;
	private String addr_dtl;
	private String tel_no;
	private String mbl_no;
	private String prt_ss_cd;
	private String mbz_st_dt;
	private String stp_dt;
	private String cncl_dt;
	private String ord_lmt_amt;
	private Date fst_reg_dt;
	private String fst_user_id;
	private Date lst_upd_dt;
	private String lst_upd_id;
	
	
	public String getPrt_cd() {
		return prt_cd;
	}
	public void setPrt_cd(String prt_cd) {
		this.prt_cd = prt_cd;
	}
	public String getPrt_nm() {
		return prt_nm;
	}
	public void setPrt_nm(String prt_nm) {
		this.prt_nm = prt_nm;
	}
	public String getPrt_dt_cd() {
		return prt_dt_cd;
	}
	public void setPrt_dt_cd(String prt_dt_cd) {
		this.prt_dt_cd = prt_dt_cd;
	}
	public String getRpsv_nm() {
		return rpsv_nm;
	}
	public void setRpsv_nm(String rpsv_nm) {
		this.rpsv_nm = rpsv_nm;
	}
	public String getBsn_no() {
		return bsn_no;
	}
	public void setBsn_no(String bsn_no) {
		this.bsn_no = bsn_no;
	}
	public String getZip_no() {
		return zip_no;
	}
	public void setZip_no(String zip_no) {
		this.zip_no = zip_no;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_dtl() {
		return addr_dtl;
	}
	public void setAddr_dtl(String addr_dtl) {
		this.addr_dtl = addr_dtl;
	}
	public String getTel_no() {
		return tel_no;
	}
	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}
	public String getMbl_no() {
		return mbl_no;
	}
	public void setMbl_no(String mbl_no) {
		this.mbl_no = mbl_no;
	}
	public String getPrt_ss_cd() {
		return prt_ss_cd;
	}
	public void setPrt_ss_cd(String prt_ss_cd) {
		this.prt_ss_cd = prt_ss_cd;
	}
	public String getMbz_st_dt() {
		return mbz_st_dt;
	}
	public void setMbz_st_dt(String mbz_st_dt) {
		this.mbz_st_dt = mbz_st_dt;
	}
	public String getStp_dt() {
		return stp_dt;
	}
	public void setStp_dt(String stp_dt) {
		this.stp_dt = stp_dt;
	}
	public String getCncl_dt() {
		return cncl_dt;
	}
	public void setCncl_dt(String cncl_dt) {
		this.cncl_dt = cncl_dt;
	}
	public String getOrd_lmt_amt() {
		return ord_lmt_amt;
	}
	public void setOrd_lmt_amt(String ord_lmt_amt) {
		this.ord_lmt_amt = ord_lmt_amt;
	}
	public Date getFst_reg_dt() {
		return fst_reg_dt;
	}
	public void setFst_reg_dt(Date fst_reg_dt) {
		this.fst_reg_dt = fst_reg_dt;
	}
	public String getFst_user_id() {
		return fst_user_id;
	}
	public void setFst_user_id(String fst_user_id) {
		this.fst_user_id = fst_user_id;
	}
	public Date getLst_upd_dt() {
		return lst_upd_dt;
	}
	public void setLst_upd_dt(Date lst_upd_dt) {
		this.lst_upd_dt = lst_upd_dt;
	}
	public String getLst_upd_id() {
		return lst_upd_id;
	}
	public void setLst_upd_id(String lst_upd_id) {
		this.lst_upd_id = lst_upd_id;
	}
	@Override
	public String toString() {
		return "PartnerVO [prt_cd=" + prt_cd + ", prt_nm=" + prt_nm + ", prt_dt_cd=" + prt_dt_cd + ", rpsv_nm="
				+ rpsv_nm + ", bsn_no=" + bsn_no + ", zip_no=" + zip_no + ", addr=" + addr + ", addr_dtl=" + addr_dtl
				+ ", tel_no=" + tel_no + ", mbl_no=" + mbl_no + ", prt_ss_cd=" + prt_ss_cd + ", mbz_st_dt=" + mbz_st_dt
				+ ", stp_dt=" + stp_dt + ", cncl_dt=" + cncl_dt + ", ord_lmt_amt=" + ord_lmt_amt + ", fst_reg_dt="
				+ fst_reg_dt + ", fst_user_id=" + fst_user_id + ", lst_upd_dt=" + lst_upd_dt + ", lst_upd_id="
				+ lst_upd_id + "]";
	}


	
}
