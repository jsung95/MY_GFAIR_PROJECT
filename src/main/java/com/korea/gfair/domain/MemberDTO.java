package com.korea.gfair.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberDTO {
	private Integer mno;
	private String memberid;
	private String memberpw;
	private String membername;
	private String memberaddress;
	
	private String phone;
	private String email;
	
	private Long cbno;
	private Integer fid;
	private Timestamp signdate;
	private String drop_tf;
	private Timestamp dropdate;
	private String membertype;
	
	
}
