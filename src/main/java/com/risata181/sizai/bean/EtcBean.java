package com.risata181.sizai.bean;

/**
 * 
 * @author js-kim
 *
 *         テーブルETC BEAN
 */

public class EtcBean extends Combean {

  private String tableName;
  private String tableColumn;
  private String tableSeq;
  private String tableDeleteCheck;
  private String tableOption;
  private String selectText;
  private String selectValue;

  public String getTableName() {
    return tableName;
  }

  public void setTableName(String tableName) {
    this.tableName = tableName;
  }

  public String getTableColumn() {
    return tableColumn;
  }

  public void setTableColumn(String tableColumn) {
    this.tableColumn = tableColumn;
  }

  public String getSelectText() {
    return selectText;
  }

  public void setSelectText(String selectText) {
    this.selectText = selectText;
  }

  public String getSelectValue() {
    return selectValue;
  }

  public void setSelectValue(String selectValue) {
    this.selectValue = selectValue;
  }

  public String getTableSeq() {
    return tableSeq;
  }

  public void setTableSeq(String tableSeq) {
    this.tableSeq = tableSeq;
  }

  public String getTableDeleteCheck() {
    return tableDeleteCheck;
  }

  public void setTableDeleteCheck(String tableDeleteCheck) {
    this.tableDeleteCheck = tableDeleteCheck;
  }

  public String getTableOption() {
    return tableOption;
  }

  public void setTableOption(String tableOption) {
    this.tableOption = tableOption;
  }

  @Override
  public String toString() {
    return "EtcBean [tableName=" + tableName + ", tableColumn=" + tableColumn + ", tableSeq="
        + tableSeq + ", tableDeleteCheck=" + tableDeleteCheck + ", selectText=" + selectText
        + ", selectValue=" + selectValue + "]";
  }

}
