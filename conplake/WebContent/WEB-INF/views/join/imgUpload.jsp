<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setHeader("Access-Control-Allow-Origin", "*");
	// 허용 범위를 null로 해준다 <- 모든 사용자가 받을 수 있게 하려고
	response.setHeader("Access-Control-Allow-Headers", "X-File-Name");
	// X-File-Name: 헤더로 전송
	// 비동기식
	// 1. XMLHttpRequest Level2
	// 2. 제이슨..?
	System.out.println("Log: "+request.getMethod().toUpperCase());
	System.out.println("Log: "+request.getHeader("X-File-Name"));

			
	if(!"OPTIONS".equals(request.getMethod().toUpperCase())){
		String fileName = request.getHeader("X-File-Name"); // 헤더에서 온 것
		fileName = URLDecoder.decode(fileName, "utf-8");
		System.out.println(fileName);
		String ext = fileName.substring(fileName.lastIndexOf("."));

		String uploadFileName = fileName.substring(0,fileName.lastIndexOf(".")) +ext; // 중복 방지를 위해 파일 이름에 시간을 추가해줬다.

		System.out.println("redad"+application.getRealPath("/resources/memberImg"));
// 		File uploadDir = new File(application.getRealPath("/resources/memberImg")); // 임시 경로
		File uploadDir = new File("C:\\conplake\\ws\\conplake\\WebContent\\resources\\memberImg");

		// 업로드하기 위한 파일 객체 생성
		System.out.println("-------------------------"+uploadDir.getAbsolutePath());
		if(!uploadDir.exists()){
			uploadDir.mkdir();
		}
		File uploadFile = new File(uploadDir, uploadFileName);
		
		InputStream in = request.getInputStream();
		// 요청받은 객체로부터 파일을 읽어온다.
		OutputStream outFile = new FileOutputStream(uploadFile);
		// 파일 작성
		byte[] buf = new byte[1024*2];
		// 바이트 빼고 뭘 쓸 수 있나
		// 이건 버퍼 기능인데
		// 바이프 빼고 BufferedOutputStream 
		int size=0;
		while((size=in.read(buf)) != -1){
			outFile.write(buf,0,size);
		}
		outFile.close();
		in.close();
		
		String fileUrl = application.getContextPath()+
				"/memberImg/"+uploadFileName;
		System.out.println(fileUrl);
		out.write(uploadFileName);
		// out.println과 같음		
	}
%>