package com.risata181.sizai.services.impl;

import com.risata181.sizai.bean.TblOutgoing;
import com.risata181.sizai.entity.StampAnalyzeMapper;
import com.risata181.sizai.services.StampAnalyzeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @brief 切手・印紙集計サービスクラス
 * @class StampAnalyzeServiceImpl
 * @author kana.kinoshita
 */

@Service("StampAnalyzeService")
public class StampAnalyzeServiceImpl implements StampAnalyzeService {

  /** StampAnalyzeのマッパー . */
  @Autowired
  StampAnalyzeMapper stampAnalyzeMapper;

  /**
   * @brief 集計のリストデータ取得
   * @param tblOutgoing 画面の取得項目
   * @return tblOutgoingResult リストデータ
   */
  @Override
  public List<TblOutgoing> getAnalyzeList(TblOutgoing tblOutgoing) {
    tblOutgoing.setOutgoingDate(tblOutgoing.getOutgoingDate().replace("/", "-"));
    List<TblOutgoing> tblOutgoingResult = stampAnalyzeMapper.getAnalyzeList(tblOutgoing);

    return tblOutgoingResult;
  }
}
