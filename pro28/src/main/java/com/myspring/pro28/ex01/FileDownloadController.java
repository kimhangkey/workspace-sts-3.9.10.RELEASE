package com.myspring.pro28.ex01;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


//@Controller
public class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH = "c:\\spring\\image_repo";

	@RequestMapping("/download")
	public void download(@RequestParam String imageFileName,
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
		File file = new File(downFile);
		
		String encodeName = URLEncoder.encode(imageFileName, "utf-8");
		// Spring MVC에서 xml의 필터를 통해 유니코드 문자로 인코딩 된 한글은, 해당 값이 서버로 전달될 때 자동으로 URL 디코딩이 됨.
		// request.setCharacterEncoding 또한 서블릿에서 request.getParameter() 등을 통해 가져올 때 자동으로 디코딩.
		// 그렇기 때문에 인코딩으로 가져온 한글을 출력문에 바로 넣어도, 자동 디코딩 처리되어 한글 그대로 찍히는 것.
		// 따라서 인코딩해서 가져오더라도 유니코드 문자로 헤더 등에 전달하려면 다시 인코딩해야함.
		// 자동 디코딩은 서블릿 컨테이너의 기능이자 역할
		
		response.setHeader("Cache-Control", "no-cache");
		// 브라우저에게 해당 응답을 캐시하지 말라고 지시하는 헤더. 캐시를 사용하면 이전에 다운로드된 파일을 재사용할 수 있기 때문에, 
		// 다운로드 링크를 클릭해도 파일이 업데이트되지 않은 경우 이전 파일이 표시될 수 있다. 
		// 따라서, 다운로드를 위해서는 항상 최신 버전의 파일을 다운로드 받아야 하므로, 캐시를 사용하지 않도록 설정.
		
		response.addHeader("Content-disposition", "attachment; fileName=" + encodeName);
		// 파일을 첨부파일 형태로 다운받기 위한 헤더 추가 설정.
		// ontent-disposition 헤더의 attachment 값은 파일을 첨부 파일로 다운로드하라는 의미이며, 
		// fileName 값은 다운로드될 파일의 이름을 지정.
		// 따라서 이미지 태그 src 경로에 이미지 출력을 위한 다운로드 경로를 설정하는 경우, 위의 헤더 첨부 설정이 필요가 없다.
		
		
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); // 버퍼에 읽어들인 문자개수
			if (count == -1) // 버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

}
