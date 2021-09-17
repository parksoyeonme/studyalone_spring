package com.dowell.edu.vo.customer;

import java.util.Date;
import java.util.List;

import com.dowell.edu.vo.common.PartnerVO;

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
	
	//고객리스트 조회시 사용
	private String prt_nm;
	private String prt_cd;
	//Date lst_upd_id를 문자열로 바꾼 후 사용
	private String lst_upd_dt_time;
	//마스킹말고 원본이름 사용
	private String cust_nm_real;
	
	//고객리스트 조회시 
	private String user_nm;
	
	//고객정보조회
	private String mbl_no_first;
	private String mbl_no_middle;
	private String mbl_no_end;
	private String email_start;
	private String email_end;
}
