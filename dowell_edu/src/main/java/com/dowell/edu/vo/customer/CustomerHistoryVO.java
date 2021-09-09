package com.dowell.edu.vo.customer;

import java.util.Date;
import java.util.List;

import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.common.CodeMaterVO;
import com.dowell.edu.vo.common.PartnerVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CustomerHistoryVO {

	/**
	 * SD_CUST01_HT	고객이력			
		SD_CUST01_HT		고객번호	VARCHAR2(10)	CUST_NO
		SD_CUST01_HT		변경일자	VARCHAR2(8)	CHG_DT
		SD_CUST01_HT		일련번호	NUMBER(3)	CHG_SEQ
		SD_CUST01_HT		변경코드	VARCHAR2(30)	CHG_CD
		SD_CUST01_HT		변경전내용	VARCHAR2(100)	CHG_BF_CNT
		SD_CUST01_HT		변경후내용	VARCHAR2(100)	CHG_AFT_CNT
		SD_CUST01_HT		최초등록일자	DATE	FST_REG_DT
		SD_CUST01_HT		최초등록자	VARCHAR2(20)	FST_USER_ID
		SD_CUST01_HT		최종수정일자	DATE	LST_UPD_DT
		SD_CUST01_HT		최종수정자	VARCHAR2(20)	LST_UPD_ID
	 */
	
	private String cust_no;
	private String chg_dt;
	private int chg_seq;
	private String chg_cd;
	private String chg_bf_cnt;
	private String chg_aft_cnt;
	private Date fst_reg_dt;
	private String fst_user_id;
	private Date lst_upd_dt;
	private String lst_upd_id
	; 
	private String chg_bf_cd_nm;
	
	private String code_nm;
	private String code_cd;
	
	private String prt_cd;
	private String prt_nm;
	
	private String lst_upd_dt_time;
	

	
	
}
