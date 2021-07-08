package com.risata181.sizai.services.impl;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblPost;
import com.risata181.sizai.entity.PostMapper;
import com.risata181.sizai.services.PostService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @brief 郵便サービスクラス
 * @class PostServiceImpl
 * @author kana.kinoshita
 */
@Service("PostService")
public class PostServiceImpl implements PostService {

  @Autowired
  PostMapper postMapper;


  /**
   * @brief 郵便一覧のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  @Override
  public List<TblPost> getPostList(Combean comBean) {
    List<TblPost> tblManager = postMapper.getPostList(comBean);

    return tblManager;
  }


  /**
   * @brief 郵便一覧更新
   * @param tblPostList 画面の取得項目
   * @return code 処理結果
   * @exception Exception 1件でも更新できなかった場合エラー
   */
  @Override
  @Transactional
  public String updatePost(TblPost[] tblPostList) throws Exception {
    String code = "";
    int countOfUpdated = 0;
    int i = 0;

    for (TblPost bean : tblPostList) {
      TblPost work = postMapper.exclusiveCtrl(bean);
      i = postMapper.updatePost(bean);
      // updateに失敗した場合
      if (i == 0) {
        throw new RuntimeException();
      }
      countOfUpdated += i;
    }
    code = Integer.toString(countOfUpdated);
    return code;
  }


  /**
   * @brief 郵便一覧削除
   * @param tblPostList 画面の取得項目
   * @return code 処理結果
   * @exception Exception 1件でも削除できなかった場合エラー
   */
  @Override
  @Transactional
  public String deletePost(TblPost[] tblPostList) throws Exception {
    String code = "";
    int countOfDeleted = 0;
    int i = 0;

    for (TblPost bean : tblPostList) {
      TblPost work = postMapper.exclusiveCtrl(bean);
      i = postMapper.deletePost(bean);
      // deleteに失敗した場合
      if (i == 0) {
        throw new RuntimeException();
      }
      countOfDeleted += i;
    }
    code = Integer.toString(countOfDeleted);
    return code;
  }

  /**
   * @brief 郵便受付登録
   * @param tblPostList 画面の取得項目
   * @return code 処理結果
   * @exception Exception 1件でも登録できなかった場合エラー
   */
  @Override
  @Transactional
  public String insertPost(TblPost[] tblPostList) throws Exception {
    String code = "";
    int countOfUpdated = 0;
    int i = 0;

    for (TblPost bean : tblPostList) {
      i = postMapper.insertPost(bean);
      // insertに失敗した場合
      if (i == 0) {
        throw new RuntimeException();
      }
      countOfUpdated += i;
    }
    code = Integer.toString(countOfUpdated);
    return code;
  }
}
