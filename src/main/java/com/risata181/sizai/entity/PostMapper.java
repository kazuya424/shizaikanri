package com.risata181.sizai.entity;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblPost;
import com.risata181.sizai.config.Mapper;
import java.util.List;

/**
 * @brief 郵便マッパークラス
 * @class PostMapper
 * @author kana.kinoshita
 */

@Mapper
public interface PostMapper {

  /**
   * @brief 郵便一覧のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap 取得したリストデータ
   */
  List<TblPost> getPostList(Combean comBean);

  /**
   * @brief 排他処理
   * @param tblPost 画面の取得項目
   * @return ロックしたレコード
   */
  TblPost exclusiveCtrl(TblPost tblPost);

  /**
   * @brief 郵便一覧更新
   * @param tblPost 画面の取得項目
   * @return 処理件数
   */
  int updatePost(TblPost tblPost);

  /**
   * @brief 郵便一覧削除
   * @param tblPost 画面の取得項目
   * @return 処理件数
   */
  int deletePost(TblPost tblPost);

  /**
   * @brief 郵便受付登録
   * @param tblPost 画面の取得項目
   * @return 処理件数
   */
  int insertPost(TblPost tblPost);

}
