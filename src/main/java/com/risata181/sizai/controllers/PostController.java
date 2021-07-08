package com.risata181.sizai.controllers;

import com.risata181.sizai.Util.MakeResponseHeader;
import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblPost;
import com.risata181.sizai.services.PostService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
 * @brief 郵便コントローラークラス
 * @class PostController
 * @author kana.kinoshita
 */
@Controller
@RequestMapping(value = "/post")
public class PostController {

  @Autowired
  PostService postService;

  /**
   * @brief 郵便のリスト表示
   * @return リストのurl
   */

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String list(Model model) {

    model.addAttribute("pageTitle", "郵便一覧");

    return "/post/list";
  }

  /**
   * @brief 郵便一覧のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  @RequestMapping(value = "/api/list", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> postListAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody Combean comBean) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    List<TblPost> tblPost = new ArrayList<TblPost>();

    try {
      tblPost = postService.getPostList(comBean);
    } catch (Exception e) {
      e.printStackTrace();
    }

    resultMap.put("tblPost", tblPost);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }


  /**
   * @brief 郵便一覧更新
   * @param tblPostList 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/list/update", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> postUpdateAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblPost[] tblPostList) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String updater = session.getAttribute("Seq").toString();
    for (TblPost post : tblPostList) {
      post.setPostUpdId(updater);
    }

    try {
      code = postService.updatePost(tblPostList);
    } catch (Exception e) {
      e.printStackTrace();
      code = "failure";
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief 郵便一覧削除
   * @param tblPostList 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/list/delete", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> postDeleteAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblPost[] tblPostList) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String updater = session.getAttribute("Seq").toString();
    for (TblPost post : tblPostList) {
      post.setPostUpdId(updater);
    }

    try {
      code = postService.deletePost(tblPostList);
    } catch (Exception e) {
      e.printStackTrace();
      code = "failure";
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief 郵便受付表示
   * @return 郵便受付のurl
   */

  @RequestMapping(value = "/regist", method = RequestMethod.GET)
  public String regist(Model model) {

    model.addAttribute("pageTitle", "郵便受付");

    return "/post/regist";
  }

  /**
   * @brief 郵便受付登録
   * @param tblPostList 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/insert", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> postInsertAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblPost[] tblPostList) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String register = session.getAttribute("Seq").toString();
    for (TblPost post : tblPostList) {
      post.setPostRegId(register);
    }

    try {
      code = postService.insertPost(tblPostList);
    } catch (Exception e) {
      e.printStackTrace();
      code = "failure";
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }
}
