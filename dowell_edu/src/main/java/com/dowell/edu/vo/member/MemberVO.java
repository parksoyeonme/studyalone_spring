package com.dowell.edu.vo.member;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	
	private String user_id;
	private String user_nm;
	private String user_dt_cd;
	private String use_yn;
	private String use_pwd;
	private String st_dt;
	private String ed_dt;
	private String prt_cd;
	private String pwd_upd_dt;
	private Date fst_reg_dt;
	private String fst_user_id;
	private Date lst_upd_dt;
	private String lst_upd_id;

	private String prt_nm;
}
