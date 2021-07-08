package com.risata181.sizai.entity;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblUser;
import com.risata181.sizai.config.Mapper;
import java.util.List;

/**
 * @brief 利用者マッパークラス
 * @class AdminUserMapper
 * @author masashi.takada
 */

@Mapper
public interface AdminUserMapper {

  /**
   * @brief 利用者一覧のリストデータ取得
   * @param comBean 共通ビーン
   * @return resultMap 取得したリストデータ
   */
  List<TblUser> getUserList(Combean comBean);

  /**
   * @brief 利用者新規登録
   * @param tblUser 管理者テーブル
   * @return 処理件数
   */
  int registUser(TblUser tblUser);

  /**
   * @brief 利用者一覧更新
   * @param tblUser 管理者テーブル
   * @return 処理件数
   */
  int updateUser(TblUser tblUser);

  /**
   * @brief 利用者一覧削除
   * @param tblUser 管理者テーブル
   * @return 処理件数
   */
  int deleteUser(TblUser tblUser);

  /**
   * @brief 利用者データ1件取得
   * @param seq 管理者番号
   * @return 管理者テーブル
   */
  TblUser getUserBySeq(String seq);

  /**
   * @brief 排他処理
   * @param tblUser 管理者テーブル
   */
  TblUser exclusiveCtrl(TblUser tblUser);
}
