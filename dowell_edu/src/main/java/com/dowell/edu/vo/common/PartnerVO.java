package com.dowell.edu.vo.common;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
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
	
	private String code_cd;
	private String dtl_cd;
	private String dtl_cd_nm;
	
}
