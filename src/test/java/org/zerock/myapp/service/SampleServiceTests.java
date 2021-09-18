package org.zerock.myapp.service;

import java.io.IOException;
import java.util.Scanner;

import org.apache.http.client.ClientProtocolException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.korea.gfair.util.ApiCaptchaImage;
import com.korea.gfair.util.ApiCaptchaNkey;
import com.korea.gfair.util.ApiCaptchaNkeyResult;
import com.korea.gfair.util.HomeTaxCBNO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml", "file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class SampleServiceTests {

	@Test
	public void test() {
		Scanner sc = new Scanner(System.in);
		String key = ApiCaptchaNkey.captchaNkey();
		log.info("this key : " + key);
		
		
		
		String imgPathAndName = ApiCaptchaImage.getImageRequest(key);
		log.info("imgPathAndName : " + imgPathAndName);
		String value = sc.next();
		String result = ApiCaptchaNkeyResult.getResult(key, value, "");
		log.info("result : " + result);
	}
	
	@Test
	public void test2() throws ClientProtocolException, IOException {
		HomeTaxCBNO.homeTaxCBNO("2150893029");
		
	}
	
	@Test
	public void test3() throws Exception {


	}
	@Test
	public ResponseEntity<Resource> downloadFile(String fileName) throws Exception {
		fileName = "9402400b-0887-46cd-bc09-240b6c8e6258_6-2.png";
		
		//업로드할 폴더 경로
		String uploadFolder = "/Users/jinsung/Desktop/opt/eclipse/workspace/PROJECT/G-Fair-BackEnd/src/main/webapp/resources/img/";
		
		//파일에 관한 소스 얻기(해당 파일에 대한 풀경로를 얻는다)
		Resource resource = new FileSystemResource(uploadFolder+fileName);
		log.info("resource : "+resource);
		
		//소스에서 파일명만 추출한다.
		String resourceName = resource.getFilename();
		log.info(resourceName);
		
		//파일명 변환후 전송을 위해 헤더에 넣는다
		HttpHeaders headers = new HttpHeaders();
		headers.add( "content-Disposition",
		"attachment; filename="
		+new String(resourceName.getBytes("utf-8"),"iso-8859-1"));
	
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}//downloadFile
}
