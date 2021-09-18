package com.korea.gfair.domain;

import java.sql.Timestamp;

import lombok.Value;

@Value
public class ReplyVO {
	private Integer reno;
	private Integer bno;
	private String recontent;
	private String memberid;
	private Timestamp redate;
	
}
