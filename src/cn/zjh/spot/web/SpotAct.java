package cn.zjh.spot.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.zjh.spot.entity.Spot;
import cn.zjh.spot.service.SpotSvc;
import cn.zjh.spot.utils.BaseUtil;

@Controller
@RequestMapping("/spot")
public class SpotAct {
    @Autowired
    private SpotSvc spotSvc;
    private String jsonResult;
    private  HashMap<String,Object> jsonobj=new HashMap<String,Object>();
    @RequestMapping(value="/goAdd")
    public String goAdd(){
        return "/spotadd";
    }
    @RequestMapping(value="/saveAdd",method=RequestMethod.POST)
    public void savaAdd(Spot spot, HttpServletResponse response){
        jsonobj.clear();
        try {
            spot.setTjdate(new Date());
            spot.setHitnum(0);
            spotSvc.addspot(spot);
            jsonobj.put("ok", true);
            jsonobj.put("msg","goadmin");
        } catch ( Exception e) {
            //TODO: handle exception
            e.printStackTrace();
            jsonobj.put("ok", false);
            jsonobj.put("msg", "系统错误-spotAct-saveadd");
        }
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
    
    @RequestMapping(value="/doDell",method=RequestMethod.POST)
    public void doDell( int id, HttpServletResponse response){
        jsonobj.clear();
        boolean delflag=false;
        try{
            spotSvc.deletespot(id);
            delflag=true;
        } catch(Exception e) {
            //TODO: handle exception
            e.printStackTrace();
            delflag=false;
        }
        jsonobj.put("delflag", delflag);
        BaseUtil.outPrint(response,BaseUtil.toJson(jsonobj));
    }
    
    @RequestMapping(value="/goEdit",method=RequestMethod.GET)
    public String goEdit(int id,Model model){
        model.addAttribute("spot",spotSvc.getspot(id));
        return "/spotedit";
    }
    @RequestMapping(value="/saveEdit",method=RequestMethod.POST)
    public void saveEdit(Spot spot,HttpServletResponse response){
        jsonobj.clear();
        try {
            Spot spot0 = spotSvc.getspot(spot.getId());
            spot0.setContent(spot.getContent());
            spot0.setCruser(spot.getCruser());
            spot0.setTitle(spot.getTitle());
            spot0.setPositionx(spot.getPositionx());
            spot0.setPositiony(spot.getPositiony());
            spot0.setCity(spot.getCity());
            spot0.setDistrict(spot.getDistrict());
            spot0.setAdate(new Date());
            spotSvc.updatespot(spot0);
            jsonobj.put("ok", true);
            jsonobj.put("msg", "goadmin");
        } catch (Exception e) {
            //TODO: handle exception
            e.printStackTrace();
            jsonobj.put("ok", false);
            jsonobj.put("msg", "系统错误2");
        }
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
    @RequestMapping(value="/goList")
    public String goList(){
        return "/spotlist";
    }
    @RequestMapping(value="/goBrowse")
    public String goBrowse(){
        return "/browse";
    }
    @RequestMapping(value="/getCount",method=RequestMethod.POST)
    public void getCount(HttpServletResponse response){
        int c=0;
        try {
            c=spotSvc.getspotCount();
        } catch (Exception e) {
            //TODO: handle exception
            e.printStackTrace();
            c=0;
        }
        jsonobj.clear();
        jsonobj.put("spotcount",c);
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
    @RequestMapping(value="/goCard")
    public String goRead(){
        return "/spotcard";
    }
    @RequestMapping(value="/getaSpot",method=RequestMethod.GET)
    public String getaSpot(int id,Model model){
        model.addAttribute("spot",spotSvc.getspot(id));
        return "/spot";
    }
    //有标题则按标题查找无标题则查找所有
    @RequestMapping(value="/listSpot",method=RequestMethod.POST)
    public void listSpot(String s_name,int page,int rows,HttpServletResponse response){
        List<Spot> spotlist = spotSvc.listDgSpot(s_name,page,rows);
        jsonobj.clear();
        jsonobj.put("total",spotlist.size());
        jsonobj.put("rows",spotlist);
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
    //地图显示获取所有景点
    @RequestMapping(value="/getallSpot",method=RequestMethod.POST)
    public void getallSpot(HttpServletResponse response){
        List<Spot> allspot = spotSvc.getallspot();
        jsonobj.clear();
        jsonobj.put("total",allspot.size());
        jsonobj.put("spot",allspot);
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
    @RequestMapping(value="/goCity")
    public String goCity(){
        return "/city";
    }
    //根据城市获取景点  
    @RequestMapping(value="/getcity",method=RequestMethod.POST)
    public void getcity(String c_name,int page,int rows,HttpServletResponse response){
        List<Spot> spotlist = spotSvc.listCSpot(c_name,page,rows);
        jsonobj.clear();
        jsonobj.put("total",spotlist.size());
        jsonobj.put("rows",spotlist);
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
    //根据区域获得景点
    @RequestMapping(value="/getdistrict",method=RequestMethod.POST)
    public void getdistrict(String d_name,int page,int rows,HttpServletResponse response){
        List<Spot> spotlist = spotSvc.listDSpot(d_name,page,rows);
        jsonobj.clear();
        jsonobj.put("total",spotlist.size());
        jsonobj.put("rows",spotlist);
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
}
