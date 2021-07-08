package com.risata181.sizai.controllers;

import com.risata181.sizai.Util.MakeResponseHeader;
import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.services.StampService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @brief 入出庫一覧コントローラクラス。
 * @class StampController
 * @author masashi.takada
 */
@Controller
@RequestMapping(value = "/stamp")
public class StampController {

  @Autowired
  StampService stampService;

  /**
   * @brief 入出庫一覧画面の表示
   * @param model モデル
   * @return 入出庫一覧画面パス
   */
  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String list(Model model) {

    model.addAttribute("pageTitle", "入出庫一覧");

    return "/stamp/list";
  }

  /**
   * @brief 入出庫一覧のリストデータ
   * @param req リクエスト
   * @param res レスポンス
   * @param comBean 共通ビーン
   * @return リスト取得の結果
   * @throws Exception 例外
   */
  @RequestMapping(value = "/api/list", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> listAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody Combean comBean) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    List<HashMap<String, Object>> listObject = new ArrayList<HashMap<String, Object>>();

    try {
      listObject = stampService.getInOutStockList(comBean);
    } catch (Exception e) {
      e.printStackTrace();
    }

    resultMap.put("listObject", listObject);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

}
