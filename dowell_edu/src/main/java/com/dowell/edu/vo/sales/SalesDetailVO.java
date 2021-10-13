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
		최초등록일자	DATE	FST_REG_DT
		최초등록자	VARCHAR2(20)	FST_USER_ID
		최종수정일자	DATE	LST_UPD_DT
		최종수정자	VARCHAR2(20)	LST_UPD_ID
	*/
	
	private String prt_cd;
	private String sal_dt;
	private int sal_no;
	private int sal_seq;
	private String prd_cd;
	private int prd_csmr_upr;
	private int sal_qty;
	private int sal_amt;
	private double sal_vos_amt;
	private double sal_vat_amt;
	private Date fst_reg_dt;
	private String fst_user_id;
	private Date lst_upd_dt;
	private String lst_upd_id;
	
	private String user_id;

	public SalesDetailVO(String prt_cd, String sal_dt, int sal_no, int sal_seq, String prd_cd, int prd_csmr_upr,
			int sal_qty, int sal_amt, double sal_vos_amt, double sal_vat_amt, String user_id) {
		super();
		this.prt_cd = prt_cd;
		this.sal_dt = sal_dt;
		this.sal_no = sal_no;
		this.sal_seq = sal_seq;
		this.prd_cd = prd_cd;
		this.prd_csmr_upr = prd_csmr_upr;
		this.sal_qty = sal_qty;
		this.sal_amt = sal_amt;
		this.sal_vos_amt = sal_vos_amt;
		this.sal_vat_amt = sal_vat_amt;
		this.user_id = user_id;
	}

	
	
}
