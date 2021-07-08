package com.risata181.sizai.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @brief 郵便管理メニューコントローラークラス
 * @class PostMenuControler。
 * @author masashi.takada
 */

@Controller
@RequestMapping(value = "/pcadmin/menu")
public class PcadminMenuController {

  /**
   * @brief 郵便管理メニュー画面表示
   * @return 郵便管理メニュー画面のurl
   */
  @RequestMapping(value = "", method = RequestMethod.GET)
  public String menu(Model model) {

    model.addAttribute("pageTitle", "PC管理メニュー");
    return "/pcadmin/menu/menu";
  }

}