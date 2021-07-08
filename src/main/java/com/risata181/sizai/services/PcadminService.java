package com.risata181.sizai.services;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblPcadmin;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 * @brief PC管理サービスインターフェース
 * @class PcadminService
 * @author kazuya.iwayama
 */
public interface PcadminService {

  /**
   * @brief PC管理一覧のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  public List<TblPcadmin> getPcadminList(Combean comBean);

  /**
   * @brief PC管理更新
   * @param tblPcadminList 画面の取得項目
   * @return code 処理結果
   * @exception Exception 1件でも更新できなかった場合エラー
   */
  @Transactional
  public String updatePcadmin(TblPcadmin[] tblPcadminList) throws Exception;

  /**
   * @brief PC管理一覧削除
   * @param tblPcadminList 画面の取得項目
   * @return code 処理結果
   * @exception Exception 1件でも削除できなかった場合エラー
   */
  @Transactional
  public String deletePcadmin(TblPcadmin[] tblPcadminList) throws Exception;

  /**
   * @brief PC管理登録
   * @param tblPcadminList 画面の取得項目
   * @return code 処理結果
   * @exception Exception 1件でも更新できなかった場合エラー
   */
  @Transactional
  public String insertPcadmin(TblPcadmin[] tblPcadminList) throws Exception;

}