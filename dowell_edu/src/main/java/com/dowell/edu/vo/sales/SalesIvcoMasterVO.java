package com.dowell.edu.vo.sales;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalesIvcoMasterVO {

	/*
		SD_IVCO01_MT	매장현재고
		매장코드	VARCHAR2(8)	PRT_CD
		상품코드	CHAR(9)	PRD_CD
		재고수량	NUMBER(10)	IVCO_QTY
		최초등록일자	DATE	FST_REG_DT
		최초등록자	VARCHAR2(20)	FST_USER_ID
		최종수정일자	DATE	LST_UPD_DT
		최종수정자	VARCHAR2(20)	LST_UPD_ID
	 */
	
	private String prt_cd;
	private String prd_cd;
	private String Ivco_qty;
	private Date fst_reg_dt;
	private String fst_user_id;
	private Date lst_upd_dt;
	private String lst_upd_id;
	
	/*	MA_PRD01_MT	상품관리
		상품명	VARCHAR2(50)	PRD_NM
		상품유형코드	VARCHAR2(10)	PRD_TP_CD
		상품소비자단가	NUMBER(10)	PRD_CSMR_UPR

	*/
	private String prd_nm;
	private int prd_csmr_upr;
	private String prd_tp_cd;
	private String tax_cs_cd;
	private String prd_ss_cd;
	
	
}
