package com.korea.gfair.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

import com.korea.gfair.domain.LoginDTO;
import com.korea.gfair.domain.MemberDTO;
import com.korea.gfair.domain.MemberVO;
import com.korea.gfair.mapper.MemberMapper;
import com.korea.gfair.util.UUIDGenerator;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@EnableAsync //Async로 딜레이 최대한 줄이기
@Service
public class MemberServiceImpl implements MemberService {

	//===========이진성===========//
	//===========이진성===========//
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Override
	public int checkCBNO(MemberDTO dto) {
		
		int check = this.mapper.selectCheckCBNO(dto);
		
		return check;
	}
	
	
	@Override
	public int checkID(MemberDTO dto) {
		
		int check = this.mapper.selectCheckID(dto);
		
		return check;
	} 
	
	@Override
	public int checkPhone(MemberDTO dto) {
		
		int check = this.mapper.selectCheckPhone(dto);
		
		return check;
	}


//	@Override
//	public Double homeTaxCBNO(MemberDTO dto) throws ClientProtocolException, IOException {
//		
//		CloseableHttpClient client = HttpClients.createDefault();
//		HttpPost httpPost = new HttpPost("https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=SaEtDV6V2ezASF4OroNIlotaYMp84VVz%2BYxZ%2BFvB9MlN%2F7DSCPLNnNRRTZrFKSffpip1B4BvtocfTS08%2F6Hm1Q%3D%3D");
//		
//		
//		try(client) {
//			String input = Long.toString(dto.getCbno());
//			String json = "{ \"b_no\":[\""+ input +"\"]}";
//			StringEntity entity = new StringEntity(json);
//			
//			httpPost.setEntity(entity);
//			httpPost.setHeader("Content-type", "application/json");
//			
//			CloseableHttpResponse response = client.execute(httpPost);
//			
//			try(response) {
//				log.info("STATUS : " + response.getStatusLine().getStatusCode());
//				
//				HttpEntity print = response.getEntity();
//				
//				String result = EntityUtils.toString(print);
//				log.info(result);
//				
//				Gson gson = new Gson();
//				Map map = new HashMap();
//				
//				map = (Map) gson.fromJson(result, map.getClass());
//				log.info("@@@ : " + map.get("match_cnt"));
//				
//				return (Double) map.get("match_cnt");
//				
//			}//try-with-resources
//			
//			
//		}//try-with-resources
//		
//		
//	}
	
	@Setter(onMethod_ = @Autowired)
	JavaMailSenderImpl mailSender;

	@Async //Async로 딜레이 최대한 줄이기 
	@Override
	public void sendMail(MemberDTO dto, HttpSession session) {
		try {
			MimeMessage msg = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(msg, "utf-8");
			
			
			String auth_key = getKey(false, 6);
			
			
			helper.setFrom("테스트메일<25800s10@gmail.com>");
			helper.setTo(dto.getEmail());
			helper.setSubject("테스트 제목asd");
			helper.setText("인증키 : " + auth_key);
			
//			msg.addRecipient(RecipientType.TO, new InternetAddress("jsung9912@gmail.com"));
//			
//			msg.setFrom(new InternetAddress("25800s10@gmail.com"));
//			msg.setSubject("테스트 제목asd", "utf-8");
//			msg.setText("본문입니다. asd", "utf-8");
			
			mailSender.send(msg);
			
			session.removeAttribute(dto.getEmail());
			session.setAttribute(dto.getEmail(), auth_key);
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	
	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	@Override
	public boolean emailCertifiation(HttpSession session, String inputCode, String userEmail) {
		
		try {
			
			String code = (String) session.getAttribute(userEmail);
			log.info("&&code : " + code);
			log.info("&&inputCode : " + inputCode);
			if(code.equals(inputCode)) {
				return true;
			} else {
				return false;
			}
			
		} catch (Exception e) {
			throw e;
		}
		
	}//

	@Override
	public void register(MemberDTO dto) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		dto.setMemberpw(UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest(dto.getMemberpw()));
		this.mapper.insertMember_c(dto);
		
	}//register


	
	
//	@Override
//	public String digest(String memberpw) throws NoSuchAlgorithmException, UnsupportedEncodingException {
//		String str = memberpw;
//		MessageDigest salt = MessageDigest.getInstance("SHA-256");
//        
//        salt.update(str.getBytes("UTF-8"));
//        
//        String digest = bytesToHex(salt.digest());
//		
//		return digest;
//	}//HASH
//	
//	private static final char[] hexArray = "0123456789ABCDEF".toCharArray();
//	
//    private static String bytesToHex(byte[] bytes) {
//        char[] hexChars = new char[bytes.length * 2];
//        
//        for (int j = 0; j < bytes.length; j++) {
//            int v = bytes[j] & 0xFF;
//            
//            hexChars[j * 2] = hexArray[v >>> 4];
//            hexChars[j * 2 + 1] = hexArray[v & 0x0F];
//        } // for
//        
//        return new String(hexChars);
//    }// bytesToHex

    
    
    
    

	@Override
	public MemberVO login(LoginDTO dto) throws Exception { 
		log.debug("login({}) invoked.", dto);
		
		return this.mapper.selectUser(dto);
	}


	//아이디찾기
	@Override
	public String find_id_c(MemberDTO dto) {
		
		String user = this.mapper.selectFindID(dto);
		if(user != null) {
			return user;
		} else {
			return "fail";
		}
	}
	


	@Override
	public int isExistEmail(MemberDTO dto) {
		Integer result = this.mapper.selectCountEmail(dto);
		
		return result;
	}

	//비번찾기
	@Override
	public int find_pw_c(MemberDTO dto) {
		int result = this.mapper.selectFindPW(dto);
		
		return result;
		
	}
	
	//임시비밀번호 메일로 발송
	@Async
	@Override
	public void sendMailForPw(MemberDTO dto) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		//임시비밀번호 생성
		String memberpw = getKey(false, 8);
		log.info("생성된 임시비밀번호 : " + memberpw);
		
		dto.setMemberpw(UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest(memberpw));

		try {
			MimeMessage msg = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(msg, "utf-8");
			
			helper.setFrom("다은메리호<25800s10@gmail.com>");
			helper.setTo(dto.getEmail());
			helper.setSubject("다은메리호 임시비밀번호 입니다.");
			helper.setText(dto.getMemberid() + "님의 임시비밀번호 : " + memberpw);
			mailSender.send(msg);
			
			this.mapper.updatePW(dto); //비번변경
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	//=================김희용====================//
	//=================김희용====================//
	@Async
	@Override
	public void sendMailAuth(MemberDTO dto,HttpSession session) throws MessagingException {
		String checkNum;
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,"UTF-8");
			
			Random random = new Random();
			checkNum = Integer.toString(random.nextInt(888888)+111111); 
			
			session.setAttribute(dto.getEmail(), checkNum);
			log.info("@@@@@@@@@@@"+session.getAttribute(dto.getEmail()));
			
			String text = "<h1>지페어코리아 가입 하기위해 요청하신 인증번호를 알려드립니다.<br> " + checkNum + " 입니다.</h1>";
			
			helper.setFrom("gmldyd0762@gmail.com");
			helper.setTo(dto.getEmail());
			helper.setSubject("Gfair 회원가입 진행을 위해 요청하신 인증번호를 알려드립니다.");
			helper.setText(text,true);
			
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}//try-catch
		
	}//sendMail
	
	@Override
	public Integer memberIdCheck(String memberid) {

		return mapper.selectMemberId(memberid);
		
		
	}//memberIdCheck
	

	@Override
	public Integer emailCheck(String email) {
		
		return mapper.selectEmail(email);
		
		
	}//emailCheck
	
	@Override
	public Integer phoneCheck(String phone) {
		
		return mapper.selectPhone(phone);
		
	}//phoneCheck

	@Override
	public boolean authKeyCheck(HttpSession session, String email, String inputCode) {

		String code = (String)session.getAttribute(email);
		
		if(code.equals(inputCode)){
			return true;
		}else {
			return false;
		}//if else		
		
	}

	@Override
	public void memberJoin(MemberDTO dto) {

		mapper.insertMember(dto);
		
	}//authKeyCheck

	@Override
	public String memberIdFind(String email) throws IOException{
		

		String result = mapper.selectFindId(email);
		
		if(result == null) {
			return null;
		}else {
			log.info("!!!!!!!!!!!" + result);
			return result;
		}//if-else
		
	}//memberIdFind

	@Override
	public Integer memberPwFind(String memberid,String email) {
		
		
		return mapper.selectFindPw(memberid,email);
		
	}//memberPwFind

	@Override
	public Integer newPassword(String memberid, String email, String pw) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String newPw = UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest(pw);
		return mapper.updatePw(memberid,email,newPw);
	}//newPassWord
	
	@Async
	@Override
	public void sendMailPw(HttpSession session,String memberid, String email, String password) {
		

		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,"UTF-8");
			
			session.setAttribute(email, password);
			log.info("@@@@@@@@@@@"+session.getAttribute(email));
			
			String text = "<h1>지페어코리아 임시 비밀번호 알려드립니다.<br> "+ memberid + " 님의 임시비밀번호는 " + password + " 입니다. 로그인하여 변경 바랍니다.</h1>";
			
			helper.setFrom("지페어코리아<gfairkor@gmail.com>");
			helper.setTo(email);
			helper.setSubject("Gfair 회원가입 진행을 위해 요청하신 인증번호를 알려드립니다.");
			helper.setText(text,true);
			
			mailSender.send(message);
			

		}catch(Exception e) {
			e.printStackTrace();
		}//try-catch
		
	}//sendMailPw
	
	
	
	
	//=================원승대====================//
	//=================원승대====================//
    @Override
    public MemberVO get(String memberid) {
       log.debug("get(mno) invoked.");
      
       return this.mapper.get(memberid);
    }//get




	
}
