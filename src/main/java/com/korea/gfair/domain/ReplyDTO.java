package com.korea.gfair.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyDTO {
	private Integer reno;
	private Integer bno;
	private String recontent;
	private String memberid;
	private Timestamp redate;
	
}
