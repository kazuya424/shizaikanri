package com.risata181.sizai.services;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblPost;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 * @brief 郵便サービスインターフェース
 * @class PostService
 * @author kana.kinoshita
 */
public interface PostService {

  /**
   * @brief 郵便一覧のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  public List<TblPost> getPostList(Combean comBean);

  /**
   * @brief 郵便一覧更新
   * @param tblPostList 画面の取得項目
   * @return code 処理結果
   * @exception Exception 1件でも更新できなかった場合エラー
   */
  @Transactional
  public String updatePost(TblPost[] tblPostList) throws Exception;

  /**
   * @brief 郵便一覧削除
   * @param tblPostList 画面の取得項目
   * @return code 処理結果
   * @exception Exception 1件でも削除できなかった場合エラー
   */
  @Transactional
  public String deletePost(TblPost[] tblPostList) throws Exception;

  /**
   * @brief 郵便受付登録
   * @param tblPostList 画面の取得項目
   * @return code 処理結果
   * @exception Exception 1件でも更新できなかった場合エラー
   */
  @Transactional
  public String insertPost(TblPost[] tblPostList) throws Exception;

}
