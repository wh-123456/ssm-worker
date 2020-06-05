package com.xcxy.system.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xcxy.affairs.dao.AffairsMapper;
import com.xcxy.affairs.entity.Affairs;
import com.xcxy.affairs.util.WaterMarkUtils;
import com.xcxy.practice.dao.PracticeMapper;
import com.xcxy.practice.entity.Practice;
import com.xcxy.shiro.util.MD5;
import com.xcxy.system.util.VerifyCode;
import com.xcxy.user.dao.UserMapper;
import com.xcxy.user.entity.User;
import com.xcxy.worker.dao.WorkerMapper;
import com.xcxy.worker.entity.Worker;
@RequestMapping("/system")
@Controller
public class SystemController {
	@Autowired
	private UserMapper um;
	@Autowired
	private WorkerMapper wm;
	@Autowired
	private PracticeMapper pm;
	@Autowired
	private AffairsMapper am;
	
	/**
	 * 权限不够显示页面
	 * @return
	 */
	@RequestMapping("/error")
	public String erro(){
		return "system/error";
	}
	/**
	 * 进入注册页面
	 */
	@RequestMapping("/register")
	public String register(){
		return "system/register";
	}
	/**
	 * 验证通过进入登录页面
	 * @return
	 */
	@RequestMapping("/gologin")
	public String gologin(){
		return "system/login";
	}
	/**
	 * 游客登录
	 */
	@RequestMapping("/gomain")
	public String gomain(){
		return "system/main";
	}
	/**
	 * 简历投递页面
	 */
	@RequestMapping("/gotoCV")
	public String gotoCV(HttpServletRequest request){
		/*查询所有发布招聘的部门，这里进行了去重*/
		//List<Affairs> as=am.getrecruitDnum();
		
		//request.getSession().setAttribute("recruitNums", as);
		return "practice/cvInfo";
	}
	
	/**
	 * 登录验证
	 * @return
	 */
	@PostMapping("/login")
	public String login(String username,String password,HttpServletRequest request){
		// 获取页面提交的验证码
        String inputCode = request.getParameter("captcha");
        String num=(String)request.getSession().getAttribute("num");
        //验证验证码，这里设置不区分大小写
        if(num.toLowerCase().equals(inputCode.toLowerCase())==false){
        	request.getSession().setAttribute("error", "验证码输入错误");
        	return "system/login";
        }
		Subject subject=SecurityUtils.getSubject();
		UsernamePasswordToken token=new UsernamePasswordToken(username,password);
		try {
			/*用户验证*/
			subject.login(token);
			/*验证通过获取用户信息*/
			//获取user表的所有信息
			String pd=MD5.getMD5(password, username).toString();
			User user=new User();
			user.setuName(username);
			user.setuPassword(pd);
			User userall=um.getUserRoleId(user);/*user表所有信息*/
			String dNum = null;
			/*获取用户的姓名和部门名称和编号*/ 
			if(userall.getFkRoId()==4){
				Practice p=pm.selectpracticeByNum(userall.getuWnum());
				request.getSession().setAttribute("name", p.getpName());
				request.getSession().setAttribute("userDnum", p.getpDnum());
				dNum=p.getpDnum();
				request.getSession().setAttribute("userDname", p.getpDname());
			}else{
				Worker w=new Worker();
				if(userall.getFkRoId()==1){
					w=wm.selectBossbywNum(userall.getuWnum());	
					request.getSession().setAttribute("name", w.getwName());
				}else{
					w=wm.selectWorkerbywNum(userall.getuWnum());
					request.getSession().setAttribute("name", w.getwName());
					request.getSession().setAttribute("userDnum", w.getwDnum());
					dNum=w.getwDnum();
					request.getSession().setAttribute("userDname", w.getDepartment());
					/*员工当前的职位*/
					request.getSession().setAttribute("userPname", w.getwPname());
				}
				
				
				
			}
			/*获取登录时间*/
			/*判断是否处在已登录状态*/
			String uNum=(String) request.getSession().getAttribute("userwNum");
			Boolean b=userall.getuWnum().equals(uNum);
			if(b==false/*如果处于已登录状态，就不用创建新的时间*/){
			Date date =new Date();
			SimpleDateFormat dateformat = new SimpleDateFormat/*将日期格式转换*/("yyyy/MM/dd HH:mm:ss");
			String logintime = dateformat.format(date);
			/*传递给jsp页面*/
			request.getSession().setAttribute("logindate", logintime);
			}
			
			/*获取用户的角色登记*/
			request.getSession().setAttribute("userrole",userall.getFkRoId());//1为admin，2为主管，3为职员，4为实习生
			/*获取角色的员工编号*/
			request.getSession().setAttribute("userwNum", userall.getuWnum());
			
			/*输入用户名和密码*/
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("password", password);
			
			//获取部门公告
			Affairs a=new Affairs();
			a.setaDnum(dNum);
			a.setaNum(userall.getFkRoId());
			List<Affairs> as=am.selectnoticeByDnum(a);
			request.getSession().setAttribute("notices", as);
			
			/*登录成功，进入主页面*/
			return "system/main";
		} catch (AuthenticationException e) {
			/*登录失败，返回登录页面*/
			e.printStackTrace();
			request.getSession().setAttribute("error", "账号密码错误");
			return "system/login";
		}	
	}
	@RequestMapping("getInfo")
	public String getInfo(HttpServletRequest request){
		/*获取到所有招聘的事务*/
		List<Affairs> as=am.getrecruitList();
		request.getSession().setAttribute("recruits", as);
		return "system/getInfo";
	}
	/* 获取验证码图片*/ 
    @RequestMapping("/getVerifyCode")
    public void getVerificationCode(HttpServletResponse response,HttpServletRequest request) {
        try {
            int width=200;
            int height=69;
            BufferedImage verifyImg=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
    	    //生成对应宽高的初始图片
            String randomText = VerifyCode.drawRandomText(width,height,verifyImg);
            //单独的一个类方法，出于代码复用考虑，进行了封装。
            //功能是生成验证码字符并加上噪点，干扰线，返回值为验证码字符   
            request.getSession().setAttribute("num", randomText);//这里存入验证码
            
            response.setContentType("image/png");//必须设置响应内容类型为图片，否则前台不识别
            OutputStream os = response.getOutputStream(); //获取文件输出流    
            ImageIO.write(verifyImg,"png",os);//输出图片流
            os.flush();
            os.close();//关闭流
             } catch (IOException e) {
                       e.printStackTrace();
             }

    }
    /*获取广告轮播图*/
    @RequestMapping("/getImages")
    public void getImages(String tit,String type,String tel,HttpServletResponse response){
    	String classpath = this.getClass().getResource("/").getPath().replaceFirst("/", "");
    	String path = classpath.replaceAll("WEB-INF/classes/", "")+"static/images/招聘广告.jpg";
    	try {
			Image image=WaterMarkUtils.getImage(tit, type, tel,new File(path));
			response.setContentType("image/png");//必须设置响应内容类型为图片，否则前台不识别
            OutputStream os = response.getOutputStream(); //获取文件输出流 
			ImageIO.write((RenderedImage) image,"png",os);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    /*获取公告轮播图*/
    @RequestMapping("/getImages2")
    public void getImages2(String content,String author,HttpServletResponse response,HttpServletRequest request){
    	String classpath = this.getClass().getResource("/").getPath().replaceFirst("/", "");
    	String path = classpath.replaceAll("WEB-INF/classes/", "")+"static/images/花边.jpg";
    	try {
			Image image=WaterMarkUtils.getImage2(content, author,new File(path));
			response.setContentType("image/png");//必须设置响应内容类型为图片，否则前台不识别
            OutputStream os = response.getOutputStream(); //获取文件输出流 
			ImageIO.write((RenderedImage) image,"png",os);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
