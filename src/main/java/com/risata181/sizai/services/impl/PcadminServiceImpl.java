package com.risata181.sizai.services.impl;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblPcadmin;
import com.risata181.sizai.entity.PcadminMapper;
import com.risata181.sizai.exception.SizaiRuntimeException;
import com.risata181.sizai.services.PcadminService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.CannotAcquireLockException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @brief PC管理サービスクラス
 * @class PcadminServiceImpl
 * @author kazuya.iwayama
 */
@Service("PcadminService")
public class PcadminServiceImpl implements PcadminService {

  @Autowired
  PcadminMapper pcadminMapper;


  /**
   * @brief PC管理のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  @Override
  public List<TblPcadmin> getPcadminList(Combean comBean) {
    List<TblPcadmin> tblManager = pcadminMapper.getPcadminList(comBean);

    return tblManager;
  }


  /**
   * @brief PC管理一覧更新
   * @param tblPcadminList 画面の取得項目
   * @return code 処理結果
   * @exception Exception 1件でも更新できなかった場合エラー
   */
  @Override
  @Transactional
  public String updatePcadmin(TblPcadmin[] tblPcadminList) throws Exception {
    String code = "";
    int countOfUpdated = 0;
    int i = 0;

    try {
    for (TblPcadmin bean : tblPcadminList) {
      TblPcadmin work = pcadminMapper.exclusiveCtrl(bean);
      if ("".equals(bean.getPcadminRetDt())) {
        bean.setPcadminRetDt(null);
      }
      i = pcadminMapper.updatePcadmin(bean);
      // updateに失敗した場合
      if (i == 0) {
        throw new SizaiRuntimeException("failure");
      }
      countOfUpdated += i;
    }
    code = Integer.toString(countOfUpdated);
    }catch(DuplicateKeyException e){
      throw new SizaiRuntimeException("duplicate","重複しています",e);
    }catch(CannotAcquireLockException e){
      throw new SizaiRuntimeException("locked","他の人が更新中",e);
    }
    return code;
  }


  /**
   * @brief PC管理一覧削除
   * @param tblPcadminList 画面の取得項目
   * @return code 処理結果
   * @exception Exception 1件でも削除できなかった場合エラー
   */
  @Override
  @Transactional
  public String deletePcadmin(TblPcadmin[] tblPcadminList) throws Exception {
    String code = "";
    int countOfDeleted = 0;
    int i = 0;

    try {
      for (TblPcadmin bean : tblPcadminList) {
        i = pcadminMapper.deletePcadmin(bean);
        // deleteに失敗した場合
        if (i == 0) {
          throw new SizaiRuntimeException("failure");
        }
        countOfDeleted += i;
      }
      code = Integer.toString(countOfDeleted);
    } catch (CannotAcquireLockException e) {
      throw new SizaiRuntimeException("locked", "他の人が更新中", e);
    }
    return code;
  }

  /**
   * @brief PC管理登録
   * @param tblPcadminList 画面の取得項目
   * @return code 処理結果
   * @exception Exception 1件でも登録できなかった場合エラー
   */
  @Override
  @Transactional
  public String insertPcadmin(TblPcadmin[] tblPcadminList) throws Exception {
    String code = "";
    int countOfUpdated = 0;
    int i = 0;

    try {
      for (TblPcadmin bean : tblPcadminList) {
        if ("".equals(bean.getPcadminRetDt())) {
          bean.setPcadminRetDt(null);
        }

        i = pcadminMapper.insertPcadmin(bean);
        // insertに失敗した場合
        if (i == 0) {
          throw new RuntimeException();
        }
        countOfUpdated += i;
      }
      code = Integer.toString(countOfUpdated);
    } catch (DuplicateKeyException e) {
      throw new SizaiRuntimeException("duplicate", "重複しています", e);
    }
    return code;
  }

}
