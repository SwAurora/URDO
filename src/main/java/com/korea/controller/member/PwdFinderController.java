package com.korea.controller.member;

import java.util.Objects;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.dto.MemberDTO;
import org.mindrot.jbcrypt.BCrypt;

import com.korea.controller.SubController;
import com.korea.service.MemberService;

public class PwdFinderController implements SubController
{
    MemberService service = MemberService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String flag = req.getParameter("flag");
        String id = req.getParameter("id"); // id PwdFinder.jsp로부터 받아오기
        String email = req.getParameter("email"); // email PwdFinder.jsp로부터 받아오기

        try
        {
            if(flag == null)
            {
                req.getRequestDispatcher("/WEB-INF/member/PwdFinder.jsp").forward(req, resp);
            }
            else
            {
                MemberDTO dto = service.MemberSearch(id);
                if(dto == null)
                {
                    req.setAttribute("msg", "가입되지 않은 아이디 입니다.");
                    req.getRequestDispatcher("/WEB-INF/member/PwdFinder.jsp").forward(req, resp);
                }
                if(!Objects.requireNonNull(dto).getEmail().equals(email))
                {
                    req.setAttribute("msg", "가입된 아이디와 맞지않은 이메일입니다.");
                    req.getRequestDispatcher("/WEB-INF/member/PwdFinder.jsp").forward(req, resp);
                }
                else
                {
                    try
                    {
                        // 랜덤함수 구현
                        int f_length = 48; // numeral '0' 아스키코드  처음
                        int l_length = 122; // letter 'z'아스키코드  끝
                        int alllength = 10; // 랜덤함수의 길이
                        Random random = new Random();
                        String randomNum = random.ints(f_length, l_length + 1).filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97)).limit(alllength).collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();
                        System.out.println(randomNum); // 랜덤함수값 확인용

                        String pw = randomNum; //pw값 랜덤으로 정하기
                        pw = BCrypt.hashpw(pw, BCrypt.gensalt()); //pw를 암호화.

                        service.temporaryPw(id, pw);

                        String sbj = "URDO 임시 비밀번호입니다."; //메일 제목
                        String sMsg = "임시 비밀번호[" + randomNum + "] - 새로운 비밀번호로 접속 후 비밀번호를 변경해주세요."; //메일 내용

                        Properties p = new Properties(); // 정보를 담을 객체

                        p.put("mail.smtp.host", "smtp.daum.net"); // daum SMTP 서버명 : smtp.daum.net

                        p.put("mail.smtp.port", "465");
                        // p.put("mail.smtp.starttls.enable", "false");   // 이부분은 true,false든 일단 제외시키니깐 정상작동되네...
                        p.put("mail.smtp.auth", "true");
                        p.put("mail.smtp.debug", "true");
                        p.put("mail.smtp.socketFactory.port", "465"); //daum SMTP 포트 : 465, 보안 연결(SSL) 필요
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
                                    return new PasswordAuthentication("eee1717test", "q1!w2@e3#r4$");    // 다음  메일 ID / PWD 실제계정아이디및 비밀번호
                                }
                            });

                            mailSession.setDebug(true);

                            // Create a default MimeMessage object.
                            Message message = new MimeMessage(mailSession);

                            // Set From: header field of the header.
                            message.setFrom(new InternetAddress(email)); // email : 받는 사람 이메일

                            // Set To: header field of the header.
                            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

                            // Set Subject: header field
                            message.setSubject(sbj);

                            // Send the actual HTML message, as big as you like
                            message.setContent("<h1>This is actual message</h1>", "text/html;charset=utf-8");

                            // Now set the actual message  문자만 보내기  (html보내기도 가능하니 찾아볼것)
                            message.setContent(sMsg, "text/html;charset=utf-8"); // 내용(메세지만보냄)과 인코딩

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
