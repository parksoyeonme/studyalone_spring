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
public class SalesDetailVO {

	
	/*
		CS_SAL01_DT	고객판매상세
		매장코드	VARCHAR2(20)	PRT_CD
		판매일자	VARCHAR2(8)	SAL_DT
		판매번호	NUMBER(10)	SAL_NO
		판매일련번호	NUMBER(5)	SAL_SEQ
		상품코드	CHAR(9)	PRD_CD
		소비자단가	NUMBER(10)	PRD_CSMR_UPR
		판매수량	NUMBER(5)	SAL_QTY
		판매금액	NUMBER(10)	SAL_AMT
		판매공급가액	NUMBER(10)	SAL_VOS_AMT
		판매부가세액	NUMBER(10)	SAL_VAT_AMT
	*/
	
	private String prt_cd;
	private String sal_dt;
	private int sal_no;
	private int sal_seq;
	private String prd_cd;
	private int prd_csmr_upr;
	private int sal_qty;
	private int sal_amt;
	private int sal_vos_amt;
	private int sal_vat_amt;
	private Date fst_reg_dt;
	private String fst_user_id;
	private Date lst_upd_dt;
	private String lst_upd_id;
	
	private String user_id;
}
