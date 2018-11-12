package com.baizhi.controller;

import com.baizhi.entity.Guru;
import com.baizhi.service.GuruService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("guru")
public class GuruController {
    @Resource(name="guruServiceImpl")
    private GuruService guruService;

    @RequestMapping("findAllByPageAndRows")
    public @ResponseBody Map<String,Object> findAllByPageAndRows(int page, int rows){
        Map<String,Object> map = new HashMap<String,Object>();
        Integer total = guruService.total();
        int start = (page-1)*rows;
        List<Guru> gurus = guruService.findAllByPageAndRows(start, rows);
        map.put("total",total);
        map.put("rows",gurus);
        return map;
    }

    @RequestMapping("editRow")
    public @ResponseBody Map<String,Object> editRow(Guru guru){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            guruService.update(guru);
            map.put("success",true);
        }catch(Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }

    @RequestMapping("addRow")
    public @ResponseBody Map<String,Object> addRow(Guru guru){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            guruService.insert(guru);
            map.put("success",true);
        }catch(Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }

    @RequestMapping("deleteRow")
    public @ResponseBody Map<String,Object> deleteRow(String id){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            guruService.delete(id);
            map.put("success",true);
        }catch(Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }

    @RequestMapping("headPicUpload")
    public @ResponseBody Map<String,Object> pic_upload(String id, MultipartFile file, HttpServletRequest request){
        Map<String,Object> map = new HashMap<String,Object>();
        String realPath = request.getSession().getServletContext().getRealPath("/guru_pic");
        String fileName =file.getOriginalFilename();
        try {
            Guru guru = new Guru();
            guru.setId(id);
            guru.setPicture(fileName);
            guruService.updatePicture(guru);
            file.transferTo(new File(realPath,fileName));
            map.put("success",true);
        }catch(Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }

}
