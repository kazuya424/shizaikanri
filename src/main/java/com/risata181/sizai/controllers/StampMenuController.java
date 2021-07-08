package com.risata181.sizai.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @brief 切手・印紙管理メニューコントローラークラス
 * @class StampMenuControler。
 * @author masashi.takada
 */

@Controller
@RequestMapping(value = "/stamp/menu")
public class StampMenuController {

  /**
   * @brief 切手・印紙管理メニュー画面表示
   * @return 切手・印紙管理メニュー画面のurl
   */
  @RequestMapping(value = "", method = RequestMethod.GET)
  public String menu(Model model) {

    model.addAttribute("pageTitle", "切手・印紙管理メニュー");
    return "/stamp/menu/menu";
  }

}