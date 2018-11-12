package com.baizhi.controller;

import com.baizhi.entity.Menu;
import com.baizhi.service.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("menu")
public class MenuController {
    @Resource(name="menuServiceImpl")
    private MenuService menuService;

    @RequestMapping("findAll")
    public @ResponseBody List<Menu> findAll(){
        List<Menu> menu_all = menuService.findAll();
        return menu_all;
    }
}
