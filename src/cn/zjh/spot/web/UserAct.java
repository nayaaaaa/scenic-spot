package cn.zjh.spot.web;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.zjh.spot.entity.User;
import cn.zjh.spot.service.UserSvc;
import cn.zjh.spot.utils.BaseUtil;



@Controller
@RequestMapping("/user")
public class UserAct {
	@Autowired
	private UserSvc userSvc;
	private HashMap<String,Object> jsonobj=new HashMap<String,Object>();
	@RequestMapping(value="/doLogin",method=RequestMethod.POST)
	public void doLogin(String uid,String pwd,HttpSession session,HttpServletResponse response,Model model){
		try{
			Long n=userSvc.getCount();
			if(n==0){
				User user=new User();
				user.setUid("123");
				user.setName("赵佳豪");
				user.setPwd(BaseUtil.lrwCode("123",""));
				user.setRole(1);
				userSvc.addU(user);
			}
			pwd=BaseUtil.lrwCode(pwd,"");
			User user0 = userSvc.findU(uid,pwd);
			jsonobj.clear();
			if(user0 != null){
				int a = user0.getRole();
				if(a == 1){
					jsonobj.put("ok",true);
					jsonobj.put("msg","user/goIndex");
					session.setAttribute("me",user0);
				}
				if(a == 0){
					jsonobj.put("ok", true);
					jsonobj.put("msg","user/goUser");
					session.setAttribute("me",user0);
				}
			}else
			{
				jsonobj.put("ok", false);
				jsonobj.put("msg", "账号或密码输入错误，请重新输入！");
			}
		}catch(Exception e){
			jsonobj.put("ok", false);
			jsonobj.put("msg","系统错误2-useract-dologin");
		}
		BaseUtil.outPrint(response,BaseUtil.toJson(jsonobj));
	}
	@RequestMapping(value="/doSameid",method=RequestMethod.POST)
	public void doSameid(String uid,HttpSession session,HttpServletResponse response,Model model){
		try{
			User user1 = userSvc.sameID(uid);
			jsonobj.clear();
			if(user1 == null){
					jsonobj.put("ok",true);
					jsonobj.put("msg","1");
			}else
			{
				jsonobj.put("ok", false);
				jsonobj.put("msg", "0");
			}
		}catch(Exception e){
			jsonobj.put("ok", false);
			jsonobj.put("msg","系统错误2-useract-doSameid");
		}
		BaseUtil.outPrint(response,BaseUtil.toJson(jsonobj));
	}
	@RequestMapping(value="/doLogout",method=RequestMethod.GET)
	public String doLogout(HttpSession session){
		session.invalidate();
		return "redirect:/#";
	}
	@RequestMapping(value="/goIndex")
	public String goIndex(){
		return "/admin";
	}
	@RequestMapping(value="/goUser")
	public String goUser(){
		return "/userview";
	}
	@RequestMapping(value="/doSignup",method=RequestMethod.POST)
	public void doSignup(String uid,String pwd,String name,HttpSession session,HttpServletResponse response,Model model){
		try{
				User user=new User();
				user.setUid(uid);
				user.setName(name);
				user.setPwd(BaseUtil.lrwCode(pwd,""));
				user.setRole(0);
				userSvc.addU(user);
				jsonobj.clear();
				jsonobj.put("ok",true);	
				jsonobj.put("msg","注册成功~");
			}catch(Exception e){
				jsonobj.put("ok", false);
				jsonobj.put("msg","不好意思，由于系统原因注册失败！");
			}
		BaseUtil.outPrint(response,BaseUtil.toJson(jsonobj));
	}
	@RequestMapping(value="/goSignup")
	public String goSignup(){
		return "/adminsignup";
	}
	@RequestMapping(value="/doAdminsignup",method=RequestMethod.POST)
	public void doLogin(String uid,String pwd,String name,HttpSession session,HttpServletResponse response,Model model){
		try{
				User user=new User();
				user.setUid(uid);
				user.setName(name);
				user.setPwd(BaseUtil.lrwCode(pwd,""));
				user.setRole(1);
				userSvc.addU(user);
				jsonobj.clear();
				jsonobj.put("ok",true);	
				jsonobj.put("msg","注册成功~");
			}catch(Exception e){
				jsonobj.put("ok", false);
				jsonobj.put("msg","不好意思，由于系统原因注册失败！");
			}
		BaseUtil.outPrint(response,BaseUtil.toJson(jsonobj));
	}
	@RequestMapping(value="/goAdjust")
	public String goAdjust(){
		return "/useredit";
	}
	@RequestMapping(value="/doAdjustuser",method=RequestMethod.POST)
	public void doAdjustuser(String uid,String pwd1,String pwd2,HttpSession session,HttpServletResponse response,Model model){
		try{
			User user = userSvc.sameID(uid);
			String pwd0 = user.getPwd();
			if(pwd1 == BaseUtil.lrwCode(pwd0,"")){
				user.setPwd(BaseUtil.lrwCode(pwd2,""));
				userSvc.updateU(user);
				jsonobj.clear();
				jsonobj.put("ok",true);	
				jsonobj.put("msg","密码修改成功~");

			}else{
				jsonobj.put("ok", false);
				jsonobj.put("msg","原密码错误，请重新输入！");
			}
		}catch(Exception e){
			jsonobj.put("ok", false);
			jsonobj.put("msg","不好意思，由于系统原因密码修改失败！");
		}
		BaseUtil.outPrint(response,BaseUtil.toJson(jsonobj));
	}
}
