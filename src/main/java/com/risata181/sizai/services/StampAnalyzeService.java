package com.risata181.sizai.services;

import com.risata181.sizai.bean.TblOutgoing;
import java.util.List;

/**
 * @brief 切手・印紙集計サービスインターフェース
 * @class StampAnalyzeService
 * @author kana.kinoshita
 */
public interface StampAnalyzeService {

  /**
   * @brief 集計のリストデータ取得
   * @param tblOutgoing 画面の取得項目
   * @return resultMap リストデータ
   */
  public List<TblOutgoing> getAnalyzeList(TblOutgoing tblOutgoing);

}
