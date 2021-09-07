package com.dowell.edu.vo.customer;

import java.util.Date;
import java.util.List;

import com.dowell.edu.vo.common.PartnerVO;

import lombok.ToString;

@ToString
public class CustomerVO {

		/*
		 * CS_CUST01_MT	고객관리			
		CS_CUST01_MT		고객번호	VARCHAR2(10)	CUST_NO
		CS_CUST01_MT		고객명	VARCHAR2(50)	CUST_NM
		CS_CUST01_MT		성별코드	VARCHAR2(10)	SEX_CD
		CS_CUST01_MT		양음력구분	VARCHAR2(1)	SCAL_YN
		CS_CUST01_MT		생년월일	VARCHAR2(8)	BRDY_DT
		CS_CUST01_MT		결혼기념일	VARCHAR2(8)	MRRG_DT
		CS_CUST01_MT		직업코드	VARCHAR2(10)	POC_CD
		CS_CUST01_MT		휴대폰번호	VARCHAR2(11)	MBL_NO
		CS_CUST01_MT		우편물수령코드	VARCHAR2(10)	PSMT_GRC_CD
		CS_CUST01_MT		이메일주소	VARCHAR2(100)	EMAIL
		CS_CUST01_MT		우편번호코드	VARCHAR2(10)	ZIP_CD
		CS_CUST01_MT		주소	VARCHAR2(100)	ADDR
		CS_CUST01_MT		상세주소	VARCHAR2(100)	ADDR_DTL
		CS_CUST01_MT		고객상태코드	VARCHAR2(10)	CUST_SS_CD
		CS_CUST01_MT		해지사유내용	VARCHAR2(100)	CNCL_CNTS
		CS_CUST01_MT		가입매장코드	VARCHAR2(8)	JN_PRT_CD
		CS_CUST01_MT		이메일수신동의여부	VARCHAR2(1)	EMAIL_RCV_YN
		CS_CUST01_MT		SMS수신동의여부	VARCHAR2(1)	SMS_RCV_YN
		CS_CUST01_MT		TM수신동의여부	VARCHAR2(1)	TM_RCV_YN
		CS_CUST01_MT		DM수신동의여부	VARCHAR2(1)	DM_RCV_YN
		CS_CUST01_MT		최초가입일자	VARCHAR2(8)	FST_JS_DT
		CS_CUST01_MT		가입일자	VARCHAR2(8)	JS_DT
		CS_CUST01_MT		중지일자	VARCHAR2(8)	STP_DT
		CS_CUST01_MT		해지일자	VARCHAR2(8)	CNCL_DT
		CS_CUST01_MT		최초등록일자	DATE	FST_REG_DT
		CS_CUST01_MT		최초등록자	VARCHAR2(20)	FST_USER_ID
		CS_CUST01_MT		최종수정일자	DATE	LST_UPD_DT
		CS_CUST01_MT		최종수정자	VARCHAR2(20)	LST_UPD_ID
		 * */
	private String cust_no;
	private String cust_nm;
	private String sex_cd;
	private String scal_yn;
	private String brdy_dt;
	private String mrrg_dt;
	private String poc_cd;
	private String mbl_no;
	private String psmt_grc_cd;
	private String email;
	private String zip_cd;
	private String addr;
	private String addr_dtl;
	private String cust_ss_cd;
	private String cncl_cnts;
	private String jn_prt_cd;
	private String email_rcv_yn;
	private String sms_rcv_yn;
	private String tm_rcv_yn;
	private String dm_rcv_yn;
	private String fst_js_dt;
	private String js_dt;
	private String stp_dt;
	private String cncl_dt;
	private Date fst_reg_dt;
	private String fst_user_id;
	private Date lst_upd_dt;
	private String lst_upd_id;
	private List<PartnerVO> partnerVO;
	private String lst_upd_dt_time;
	private String cust_nm_real;
	
	public String getCust_no() {
		return cust_no;
	}
	public void setCust_no(String cust_no) {
		this.cust_no = cust_no;
	}
	public String getCust_nm() {
		return cust_nm;
	}
	public void setCust_nm(String cust_nm) {
		this.cust_nm = cust_nm;
	}
	public String getSex_cd() {
		return sex_cd;
	}
	public void setSex_cd(String sex_cd) {
		this.sex_cd = sex_cd;
	}
	public String getScal_yn() {
		return scal_yn;
	}
	public void setScal_yn(String scal_yn) {
		this.scal_yn = scal_yn;
	}
	public String getBrdy_dt() {
		return brdy_dt;
	}
	public void setBrdy_dt(String brdy_dt) {
		this.brdy_dt = brdy_dt;
	}
	public String getMrrg_dt() {
		return mrrg_dt;
	}
	public void setMrrg_dt(String mrrg_dt) {
		this.mrrg_dt = mrrg_dt;
	}
	public String getPoc_cd() {
		return poc_cd;
	}
	public void setPoc_cd(String poc_cd) {
		this.poc_cd = poc_cd;
	}
	public String getMbl_no() {
		return mbl_no;
	}
	public void setMbl_no(String mbl_no) {
		this.mbl_no = mbl_no;
	}
	public String getPsmt_grc_cd() {
		return psmt_grc_cd;
	}
	public void setPsmt_grc_cd(String psmt_grc_cd) {
		this.psmt_grc_cd = psmt_grc_cd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZip_cd() {
		return zip_cd;
	}
	public void setZip_cd(String zip_cd) {
		this.zip_cd = zip_cd;
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
	public String getCust_ss_cd() {
		return cust_ss_cd;
	}
	public void setCust_ss_cd(String cust_ss_cd) {
		this.cust_ss_cd = cust_ss_cd;
	}
	public String getCncl_cnts() {
		return cncl_cnts;
	}
	public void setCncl_cnts(String cncl_cnts) {
		this.cncl_cnts = cncl_cnts;
	}
	public String getJn_prt_cd() {
		return jn_prt_cd;
	}
	public void setJn_prt_cd(String jn_prt_cd) {
		this.jn_prt_cd = jn_prt_cd;
	}
	public String getEmail_rcv_yn() {
		return email_rcv_yn;
	}
	public void setEmail_rcv_yn(String email_rcv_yn) {
		this.email_rcv_yn = email_rcv_yn;
	}
	public String getSms_rcv_yn() {
		return sms_rcv_yn;
	}
	public void setSms_rcv_yn(String sms_rcv_yn) {
		this.sms_rcv_yn = sms_rcv_yn;
	}
	public String getTm_rcv_yn() {
		return tm_rcv_yn;
	}
	public void setTm_rcv_yn(String tm_rcv_yn) {
		this.tm_rcv_yn = tm_rcv_yn;
	}
	public String getDm_rcv_yn() {
		return dm_rcv_yn;
	}
	public void setDm_rcv_yn(String dm_rcv_yn) {
		this.dm_rcv_yn = dm_rcv_yn;
	}
	public String getFst_js_dt() {
		return fst_js_dt;
	}
	public void setFst_js_dt(String fst_js_dt) {
		this.fst_js_dt = fst_js_dt;
	}
	public String getJs_dt() {
		return js_dt;
	}
	public void setJs_dt(String js_dt) {
		this.js_dt = js_dt;
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
	public List<PartnerVO> getPartnerVO() {
		return partnerVO;
	}
	public void setPartnerVO(List<PartnerVO> partnerVO) {
		this.partnerVO = partnerVO;
	}
	public String getLst_upd_dt_time() {
		return lst_upd_dt_time;
	}
	public void setLst_upd_dt_time(String lst_upd_dt_time) {
		this.lst_upd_dt_time = lst_upd_dt_time;
	}
	public String getCust_nm_real() {
		return cust_nm_real;
	}
	public void setCust_nm_real(String cust_nm_real) {
		this.cust_nm_real = cust_nm_real;
	}
	
	
	

	
}
