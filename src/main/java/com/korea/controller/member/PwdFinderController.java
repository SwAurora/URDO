package com.korea.controller.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

import org.mindrot.jbcrypt.BCrypt;

import com.korea.controller.SubController;
import com.korea.dao.MemberDAO;
import com.korea.service.MemberService;

public class PwdFinderController implements SubController
{
    MemberService service = MemberService.getInstance();
    
    MemberDAO memberdao = MemberDAO.getInstance();  //dao 가져오기
    

    
    
    // UPDATE `urdo`.member_tbl  Set pw = '4321' where id='test123' ; 적용시켜야함.
    // parameter로 id랑 email값을 받아와야함.
    
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
            	

            	String driver = "com.mysql.cj.jdbc.Driver";
        		String url = "jdbc:mysql://localhost:3306/URDO";
        		String user = "root";
        		String password = "1234";
        		
        		
        		//연결에 사용될 참조변수
        		String sql; 					//sql 문저장
        		PreparedStatement pstmt =null;	//sql문 명령 전달하는 용도
        		ResultSet rs = null;			//쿼리 결과 저장
        		Connection con = null;			//연결 정보 저장
        			
        		
        		//email 보내기관련.               	
        	
        	    String id = req.getParameter("id");  //id PwdFinder.jsp로부터 받아오기
        	 
        	    String email = req.getParameter("email");// email PwdFinder.jsp로부터 받아오기
        		
        		
        	    
        	    // 랜덤함수 구현  
        	    int f_length = 48; // numeral '0' 아스키코드  처음
			    int l_length = 122; // letter 'z'아스키코드  끝
			    int alllength = 10; // 랜덤함수의 길이 
			    Random random = new Random(); 
			    String numcode = random.ints(f_length, l_length + 1)
			     .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))                    
			     .limit(alllength)
			     .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
			     .toString();
			    System.out.println(numcode); // 랜덤함수값 확인용.
        	    
        	    //랜덤함수끝
        	    
        	    
        	    String pw  = numcode; //pw값 랜덤으로 정하기 
        		
        		   String pw2 = BCrypt.hashpw(pw, BCrypt.gensalt()); //pw를 암호화.
        		
        		try {
        			Class.forName(driver);
        			System.out.println("Driver Loading Success");
        			con=DriverManager.getConnection(url,user,password);
        			System.out.println("DB Connected..");
        			sql="update member_tbl set pw=? where id=?";
        			pstmt = con.prepareStatement(sql);
        			pstmt.setString(1, pw2);//pwd 입력칸 이걸 pwdfindcontrooler에서받은걸로해야함
        			pstmt.setString(2, id); //where 지정  이건 id랑 연동되어있어야함.
        			
        			int num = pstmt.executeUpdate();
        			
        			if(num==1)
        			{
        				System.out.println("Update Succeed.성공!!");
        			}

        		
        		
        		}catch(Exception e){
        			e.printStackTrace();
        		}finally {
        			
        			try {
        				if(rs!=null)
        					rs.close();
        			}catch(Exception e1) {};
        			
        			try {
        				if(pstmt!=null)
        					pstmt.close();
        			}catch(Exception e2) {}
        			
        			try {
        				if(con !=null)
        					con.close();
        			}catch(Exception e) {}	
        		}
        		
        		//email 보내기관련.               	
              
                String result = service.checkEmail(email); //이메일관련
                if(result.equals(""))
                {
                    req.setAttribute("msg", "가입되지 않은 이메일 입니다.");
                    req.getRequestDispatcher("/WEB-INF/member/PwdFinder.jsp").forward(req, resp);
                }
                else
                {
                    String imsinum = numcode; //임시비밀번호보내기. 실제 임시비밀번호값이 메일에들어간다.
                    
                    // UPDATE `urdo`.member_tbl  Set pw = '4321' where id='test123' ; 적용시켜야함.
                    
                    try
                    {
                        String sbj = "URDO 임시 비밀번호입니다."; //메일 제목
                        String from = "eee1717test@daum.net";   // 보내는 사람(인증 정보와 동일한 email 주소여야 함!!)(from)
                        String sMsg = "인증번호[" + imsinum + "] - 인증번호확인란에 입력해주세요"; //메일 내용

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
                            message.setFrom(new InternetAddress(from));

                            // Set To: header field of the header.
                            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

                            // Set Subject: header field
                            message.setSubject(sbj);

                            // Send the actual HTML message, as big as you like
                            message.setContent("<h1>This is actual message</h1>", "text/html;charset=utf-8" );
                            
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
