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
public class CodeMaterVO {

	private String code_cd;
	private String code_nm;
	private Date fst_reg_dt;
	private String fst_user_dt;
	private Date lst_upd_dt;
	private String lst_upd_id;
	
}
