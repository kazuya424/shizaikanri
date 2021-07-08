package com.risata181.sizai.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @brief マスター管理メニューコントローラークラス
 * @class AdminMenuControler。
 * @author masashi.takada
 */

@Controller
@RequestMapping(value = "/admin/menu")
public class AdminMenuController {

  /**
   * @brief マスタ管理メニュー画面表示
   * @return マスタ管理メニュー画面のurl
   */
  @RequestMapping(value = "", method = RequestMethod.GET)
  public String menu(Model model) {

    model.addAttribute("pageTitle", "マスタ管理メニュー");
    return "/admin/menu/menu";
  }

}