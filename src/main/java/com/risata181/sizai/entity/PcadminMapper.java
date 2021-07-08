package com.risata181.sizai.entity;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblPcadmin;
import com.risata181.sizai.config.Mapper;
import java.util.List;

/**
 * @brief PC管理マッパークラス
 * @class PcadminMapper
 * @author kazuya.iwayama
 */

@Mapper
public interface PcadminMapper {

  /**
   * @brief PC管理のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap 取得したリストデータ
   */
  List<TblPcadmin> getPcadminList(Combean comBean);

  /**
   * @brief 排他処理
   * @param tblPcadmin 画面の取得項目
   * @return ロックしたレコード
   */
  TblPcadmin exclusiveCtrl(TblPcadmin tblPcadmin);

  /**
   * @brief PC管理更新
   * @param tblPcadmin 画面の取得項目
   * @return 処理件数
   */
  int updatePcadmin(TblPcadmin tblPcadmin);

  /**
   * @brief PC管理一覧削除
   * @param tblPcadmin 画面の取得項目
   * @return 処理件数
   */
  int deletePcadmin(TblPcadmin tblPcadmin);

  /**
   * @brief PC管理登録
   * @param tblPcadmin 画面の取得項目
   * @return 処理件数
   */
  int insertPcadmin(TblPcadmin tblPcadmin);

}
