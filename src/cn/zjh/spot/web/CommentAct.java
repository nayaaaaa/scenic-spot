package cn.zjh.spot.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.zjh.spot.entity.Comment;
import cn.zjh.spot.service.CommentSvc;
import cn.zjh.spot.utils.BaseUtil;

@Controller
@RequestMapping("/comment")
public class CommentAct {
    @Autowired
    private CommentSvc commentSvc;
    private String jsonResult;
    private  HashMap<String,Object> jsonobj=new HashMap<String,Object>();
    @RequestMapping(value="/saveAdd",method=RequestMethod.POST)
    public void savaAdd(Comment comment, HttpServletResponse response){
        jsonobj.clear();
        try {
            commentSvc.addComment(comment);
            jsonobj.put("ok", true);
            jsonobj.put("msg", "申请成功");
        } catch ( Exception e) {
            //TODO: handle exception
            e.printStackTrace();
            jsonobj.put("ok", false);
            jsonobj.put("msg", "系统错误-申请添加");
        }
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
    @RequestMapping(value="/doDell",method=RequestMethod.POST)
    public void doDell( int id, HttpServletResponse response){
        jsonobj.clear();
        boolean delflag=false;
        try{
            commentSvc.deleteComment(id);
            delflag=true;
        } catch(Exception e) {
            //TODO: handle exception
            e.printStackTrace();
            delflag=false;
        }
        jsonobj.put("delflag", delflag);
        BaseUtil.outPrint(response,BaseUtil.toJson(jsonobj));
    }
    @RequestMapping(value="/getall",method=RequestMethod.POST)
    public void getall(HttpServletResponse response){
        List<Comment> allcomment = commentSvc.allComment();
        jsonobj.clear();
        jsonobj.put("total",allcomment.size());
        jsonobj.put("rows",allcomment);
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
    @RequestMapping(value="/getuser",method=RequestMethod.POST)
    public void getuser(String uid,HttpServletResponse response){
        List<Comment> userlist = commentSvc.alluser(uid);
        jsonobj.clear();
        jsonobj.put("total",userlist.size());
        jsonobj.put("rows",userlist);
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
    @RequestMapping(value="/golist")
    public String golist(){
        return "/commentlist";
    }
}
