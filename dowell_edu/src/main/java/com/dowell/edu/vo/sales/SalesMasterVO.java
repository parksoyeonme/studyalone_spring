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
public class SalesMasterVO {
	/*
	 * 매장코드	VARCHAR2(8)	prt_cd
		판매일자	VARCHAR2(8)	SAL_DT
		판매번호	NUMBER(10)	SAL_NO
		판매구분코드	VARCHAR2(10)	SAL_TP_CD
		총판매수량	NUMBER(6)	TOT_SAL_QTY
		총판매금액	NUMBER(12)	TOT_SAL_AMT
		총공급가액	NUMBER(12)	TOT_VOS_AMT
		총부가세액	NUMBER(12)	TOT_VAT_AMT
		현금결제금액	NUMBER(12)	CSH_STLM_AMT
		카드결제금액	NUMBER(12)	CRD_STLM_AMT
		포인트사용금액	NUMBER(12)	PNT_STLM_AMT
		고객번호	VARCHAR2(20)	CUST_NO
		카드번호	VARCHAR2(16)	CRD_NO
		유효년월	VARCHAR2(6)	VLD_YM
		카드회사	VARCHAR2(10)	CRD_CO_CD
		최초등록일자	DATE	FST_REG_DT
		최초등록자	VARCHAR2(20)	FST_USER_ID
		최종수정일자	DATE	LST_UPD_DT
		최종수정자	VARCHAR2(20)	LST_UPD_ID

	 * 
	 * */
	private String prt_cd;
	private String sal_dt;
	private int sal_no;
	private String sal_tp_cd;
	private int tot_sal_qty;
	private int tot_sal_amt;
	private double tot_vos_amt;
	private double tot_vat_amt;
	private int csh_stlm_amt;
	private int crd_stlm_amt;
	private int pnt_stlm_amt;
	private String cust_no;
	private String crd_no;
	private String vld_ym;
	private String crd_co_cd;
	private Date fst_reg_dt;
	private String fst_user_id;
	private Date lst_upd_dt;
	private String lst_upd_id;
	
	
	private String prt_nm;
	private String cust_nm;
	private String user_nm;
	private String lst_upd_dt_time;
	private int sal_seq;
	
	private String prd_cd;
	private String prd_nm;
	private String sal_qty;
	private String sal_amt;
	private String user_id;
	

	
	public SalesMasterVO(String prt_cd, String sal_dt, int sal_no, String sal_tp_cd, int tot_sal_qty, int tot_sal_amt,
			double tot_vos_amt, double tot_vat_amt, int csh_stlm_amt, int crd_stlm_amt, int pnt_stlm_amt,
			String cust_no, String crd_no, String vld_ym, String crd_co_cd, String user_id) {
		super();
		this.prt_cd = prt_cd;
		this.sal_dt = sal_dt;
		this.sal_no = sal_no;
		this.sal_tp_cd = sal_tp_cd;
		this.tot_sal_qty = tot_sal_qty;
		this.tot_sal_amt = tot_sal_amt;
		this.tot_vos_amt = tot_vos_amt;
		this.tot_vat_amt = tot_vat_amt;
		this.csh_stlm_amt = csh_stlm_amt;
		this.crd_stlm_amt = crd_stlm_amt;
		this.pnt_stlm_amt = pnt_stlm_amt;
		this.cust_no = cust_no;
		this.crd_no = crd_no;
		this.vld_ym = vld_ym;
		this.crd_co_cd = crd_co_cd;
		this.user_id = user_id;
	}

	//현금만
	public SalesMasterVO(String prt_cd, String sal_dt, int sal_no, String sal_tp_cd, int tot_sal_qty, int tot_sal_amt,
			double tot_vos_amt, double tot_vat_amt, int csh_stlm_amt, int pnt_stlm_amt, String cust_no,
			 String user_id) {
		this.prt_cd = prt_cd;
		this.sal_dt = sal_dt;
		this.sal_no = sal_no;
		this.sal_tp_cd = sal_tp_cd;
		this.tot_sal_qty = tot_sal_qty;
		this.tot_sal_amt = tot_sal_amt;
		this.tot_vos_amt = tot_vos_amt;
		this.tot_vat_amt = tot_vat_amt;
		this.csh_stlm_amt = csh_stlm_amt;
		this.pnt_stlm_amt = pnt_stlm_amt;
		this.cust_no = cust_no;
		this.user_id = user_id;
	}

	//카드만
	public SalesMasterVO(String prt_cd, String sal_dt, int sal_no, String sal_tp_cd, int tot_sal_qty, int tot_sal_amt,
			double tot_vos_amt, double tot_vat_amt, int crd_stlm_amt, int pnt_stlm_amt, String cust_no, String crd_no,
			String vld_ym, String crd_co_cd, String user_id) {
		this.prt_cd = prt_cd;
		this.sal_dt = sal_dt;
		this.sal_no = sal_no;
		this.sal_tp_cd = sal_tp_cd;
		this.tot_sal_qty = tot_sal_qty;
		this.tot_sal_amt = tot_sal_amt;
		this.tot_vos_amt = tot_vos_amt;
		this.tot_vat_amt = tot_vat_amt;
		this.crd_stlm_amt = crd_stlm_amt;
		this.pnt_stlm_amt = pnt_stlm_amt;
		this.cust_no = cust_no;
		this.crd_no = crd_no;
		this.vld_ym = vld_ym;
		this.crd_co_cd = crd_co_cd;
		this.user_id = user_id;
	}

	
	
	
}
