package com.korea.controller.member;

import com.korea.controller.SubController;
import com.korea.service.MemberService;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Properties;

public class PwdFinderController implements SubController
{
    MemberService service = MemberService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String flag = req.getParameter("flag");
        try
        {
            if(flag == null)
            {
                req.getRequestDispatcher("/WEB-INF/member/PwdFinder.jsp").forward(req, resp);
            }
            else
            {
                String email = req.getParameter("email");
                String result = service.checkEmail(email);
                if(result.equals(""))
                {
                    req.setAttribute("msg", "가입되지 않은 이메일 입니다.");
                    req.getRequestDispatcher("/WEB-INF/member/PwdFinder.jsp").forward(req, resp);
                }
                else
                {
                    String imsinum = "a36987456321"; //인증번호  입력하기
                    try
                    {
                        String sbj = "URDO 임시 비밀번호입니다."; //메일 제목
                        String from = "eee1717test@naver.com";   // 보내는 사람(인증 정보와 동일한 email 주소여야 함!!)(from)
                        String sMsg = "인증번호[" + imsinum + "] - 인증번호확인란에 입력해주세요"; //메일 내용

                        Properties p = new Properties(); // 정보를 담을 객체

                        p.put("mail.smtp.host", "smtp.naver.com"); // NAVER SMTP 서버명 : smtp.naver.com

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
                        try
                        {

                            Session mailSession = Session.getInstance(p, new javax.mail.Authenticator()
                            {
                                protected PasswordAuthentication getPasswordAuthentication()
                                {
                                    return new PasswordAuthentication("eee1717test", "q1!w2@e3#");    // 네이버 메일 ID / PWD 실제계정아이디및 비밀번호
                                }
                            });

                            mailSession.setDebug(true);

                            // Create a default MimeMessage object.
                            Message message = new MimeMessage(mailSession);

                            // Set From: header field of the header.
                            message.setFrom(new InternetAddress(from));

                            // Set To: header field of the header.
                            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

                            // Set Subject: header field
                            message.setSubject(sbj);

                            // Now set the actual message
                            message.setContent(sMsg, "text/html;charset=utf-8"); // 내용과 인코딩

                            // Send message
                            Transport.send(message);
                        }
                        catch(MessagingException e)
                        {
                            e.printStackTrace();
                            System.out.println("Error: unable to send message...." + e.toString());
                        }
                    }
                    catch(Exception err)
                    {
                        System.out.println(err.toString());
                    }
                    req.setAttribute("msg", "이메일로 임시 비밀번호가 발송되었습니다.");
                    req.getRequestDispatcher("/login.jsp").forward(req, resp);
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
