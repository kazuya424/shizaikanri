package com.risata181.sizai.entity;

import com.risata181.sizai.bean.TblOutgoing;
import com.risata181.sizai.config.Mapper;
import java.util.List;

/**
 * @brief 切手・印紙集計マッパークラス
 * @class StampAnalyzeMapper
 * @author kana.kinoshita
 */

@Mapper
public interface StampAnalyzeMapper {

  /**
   * @brief 集計のリストデータ取得
   * @param tblOutgoing 画面の取得項目
   * @return 取得したリストデータ
   */
  List<TblOutgoing> getAnalyzeList(TblOutgoing tblOutgoing);
}
