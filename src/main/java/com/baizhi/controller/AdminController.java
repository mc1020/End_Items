package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Resource(name="adminServiceImpl")
    private AdminService adminService;

    @RequestMapping("login")
    public String login(Admin admin,String enCode, HttpServletRequest request){
        HttpSession session = request.getSession();
        String code =(String)session.getAttribute("validationCode");
        if(enCode.equalsIgnoreCase(code)){
            Admin login_admin = adminService.findByAccountAndPassword(admin.getAccount(), admin.getPassword());
            if (login_admin != null && login_admin.getStatus().equals("true")) {
                session.setAttribute("login_admin", login_admin);
                return "back/main/main";
            } else {
                return "back/admin/login";
            }
        }else{
            return "back/admin/login";
        }
    }

    @RequestMapping("updatePassword")
    public @ResponseBody Map<String,Object> updatePassword(String oldPassword, String newPassword,HttpServletRequest request){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            HttpSession session = request.getSession();
            Admin login_admin = (Admin) session.getAttribute("login_admin");
            if (login_admin.getPassword().equals(oldPassword)) {
                login_admin.setPassword(newPassword);
                adminService.updatePassword(login_admin);
                session.invalidate();
                map.put("success",true);
            }else{
                map.put("success",false);
                map.put("message","输入密码有误!!!");
            }
        }catch(Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }

    @RequestMapping("quit")
    public String quit(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "/back/admin/login";
    }
}
