package com.baizhi.controller;

import com.baizhi.entity.Carousel;
import com.baizhi.service.CarouselService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("carousel")
public class CarouselController {
    @Resource(name="carouselServiceImpl")
    private CarouselService carouselService;

    @RequestMapping("findAllByPageAndRows")
    public @ResponseBody Map<String,Object> findAllByPageAndRows(int page,int rows){
        Map<String,Object> map = new HashMap<String,Object>();
        int start=(page-1)*rows;
        Integer total = carouselService.total();
        List<Carousel> carousel_all = carouselService.findAllByPageAndRows(start,rows);
        map.put("total",total);
        map.put("rows",carousel_all);
        return map;
    }

    @RequestMapping("picUpload")
    public @ResponseBody Map<String,Object> addCarousel(Carousel carousel, HttpServletRequest request, MultipartFile file){
        Map<String,Object> map = new HashMap<String,Object>();
        //获取服务器中路径
        String realPath = request.getSession().getServletContext().getRealPath("/picUpload");

        String fileName = file.getOriginalFilename();
        try {
            if(!file.isEmpty()) {
                carousel.setName(fileName);
                carousel.setCreate_timeDate(new Date());
                carousel.setType(file.getContentType());
                carouselService.insert(carousel);
                file.transferTo(new File(realPath, fileName));
                map.put("success", true);
            }else{
                map.put("success",false);
                map.put("message","上传的图片不能为空!!!");
            }
        }catch(Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }

    @RequestMapping("updateCarousel")
    public @ResponseBody Map<String,Object> updateRows(Carousel carousel, HttpServletRequest request, MultipartFile file){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            String realPath = request.getSession().getServletContext().getRealPath("/picUpload");
            File file_option = new File(realPath,carousel.getName());
            String fileName = file.getOriginalFilename();
            file_option.delete();
            carousel.setType(file.getContentType());
            carousel.setModify_timeDate(new Date());
            carousel.setName(fileName);
            carouselService.update(carousel);
            file.transferTo(new File(realPath,fileName));
            map.put("success",true);
        }catch(Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }

    @RequestMapping("delRow")
    public @ResponseBody Map<String,Object> delCarousel(String id,String name,HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        String realPath = request.getSession().getServletContext().getRealPath("/picUpload");
        try{
           carouselService.delete(id);
           File file_option = new File(realPath,name);
           file_option.delete();
           map.put("success",true);
       }catch(Exception e){
           e.printStackTrace();
           map.put("success",false);
           map.put("message",e.getMessage());
       }
       return map;
    }

    @RequestMapping("delRows")
    public @ResponseBody Map<String,Object> delRows(String[] id,String[] names,HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        String realPath = request.getSession().getServletContext().getRealPath("/picUpload");
        try{
            for (String s : id) {
                carouselService.delete(s);
            }
            for(String name : names){
                File file_option = new File(realPath,name);
                file_option.delete();
            }
            map.put("success",true);
        }catch(Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }

    @RequestMapping("queryOne")
    public @ResponseBody Carousel queryOne(String id){
        Carousel carousel = carouselService.queryOne(id);
        return carousel;
    }
}
