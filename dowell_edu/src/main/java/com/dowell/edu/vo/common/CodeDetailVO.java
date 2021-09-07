package com.dowell.edu.vo.common;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class CodeDetailVO {

	private String code_cd;
	private String dtl_cd;
	private String dtl_cd_nm;
	private String use_yn;
	private String use_st_dt;
	private String use_ed_dt;
	private int srt_seq;
	private Date fst_reg_dt;
	private String fst_user_dt;
	private Date lst_upd_dt;
	private String lst_upd_id;
	
}
