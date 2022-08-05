<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<%@page import="javax.mail.Authenticator" %>
<%@page import="javax.mail.PasswordAuthentication" %>
<%@page import="java.util.Properties" %>



<%
  // 받아온 변수...
  String sResult = "메일전송성공"; 

  String imsinum = "36987456321"; //인증번호  입력하기
 try{
      String to = "eee1717test@naver.com";    // 받는 사람(to)

      String sbj = "이메일 인증번호입니다."; //메일 제목
      String from = "eee1717test@naver.com";   // 보내는 사람(인증 정보와 동일한 email 주소여야 함!!)(from)
      String sMsg = "인증번호["+imsinum+"] - 인증번호확인란에 입력해주세요"; //메일 내용

      Properties p = new Properties(); // 정보를 담을 객체

      p.put("mail.smtp.host","smtp.naver.com"); // NAVER SMTP 서버명 : smtp.naver.com

      p.put("mail.smtp.port", "465");
      // p.put("mail.smtp.starttls.enable", "false");   // 이부분은 true,false든 일단 제외시키니깐 정상작동되네...
      p.put("mail.smtp.auth", "true");
      p.put("mail.smtp.debug", "true");
      p.put("mail.smtp.socketFactory.port", "465"); //naver SMTP 포트 : 465, 보안 연결(SSL) 필요
      p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
      p.put("mail.smtp.socketFactory.fallback", "false");
      // SMTP 서버에 접속하기 위한 정보들
      System.out.println(5678);

      //Get the Session object.
      try {

        Session mailSession = Session.getInstance(p,
                new javax.mail.Authenticator() {
                  protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("eee1717test","q1!w2@e3#");    // 네이버 메일 ID / PWD 실제계정아이디및 비밀번호 
                  }
                });

        mailSession.setDebug(true);

        // Create a default MimeMessage object.
        Message message = new MimeMessage(mailSession);

        // Set From: header field of the header.
        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

        // Set Subject: header field
        message.setSubject(sbj);

        // Now set the actual message
        message.setContent(sMsg, "text/html;charset=utf-8"); // 내용과 인코딩

        // Send message
        Transport.send(message);

        // System.out.println("Sent message successfully....");
        // sResult = "Sent message successfully....";

      } catch (MessagingException e) {
        e.printStackTrace();
        System.out.println("Error: unable to send message...." + e.toString());
        sResult = "ERROR입니다.";
      }
  }catch (Exception err){
    System.out.println(err.toString());
    sResult = "ERRROR입니다.";
  }finally {
    // dbhandle.close(dbhandle.con);
  }
%>
<% out.clear(); %><%=sResult%>








</body>
</html>