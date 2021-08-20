package kr.co.vo.member;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberVO {

	private String userId;
	private String userPass;
	private String userName;
	private Date regDate;
}
