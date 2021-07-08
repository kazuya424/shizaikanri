package com.risata181.sizai.controllers;

import com.risata181.sizai.services.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/main")
public class MainController {

  @Autowired
  MainService mainService;

  @RequestMapping(value = "", method = RequestMethod.GET)
  public String main(Model model) {

    model.addAttribute("pageTitle", "ダッシュボード");
    return "/main";
  }
}
