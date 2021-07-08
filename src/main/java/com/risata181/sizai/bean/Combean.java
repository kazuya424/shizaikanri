package com.risata181.sizai.bean;

import java.util.HashMap;
import java.util.List;

/**
 * 
 * @author js-kim
 *
 *         テーブル共通 Bean
 */

public class Combean {

  private String page;
  private String listLength = "10";
  private String searchKey;
  private String sortField;
  private String sortOrder;
  private List<HashMap<String, Object>> searchObj;
  private List<HashMap<String, Object>> updateObj;

  public String getPage() {
    return page;
  }

  public void setPage(String page) {
    this.page = page;
  }

  public String getListLength() {
    return listLength;
  }

  public void setListLength(String listLength) {
    this.listLength = listLength;
  }

  public String getSearchKey() {
    return searchKey;
  }

  public void setSearchKey(String searchKey) {
    this.searchKey = searchKey;
  }

  public String getSortField() {
    return sortField;
  }

  public void setSortField(String sortField) {
    this.sortField = sortField;
  }

  public String getSortOrder() {
    return sortOrder;
  }

  public void setSortOrder(String sortOrder) {
    this.sortOrder = sortOrder;
  }

  public List<HashMap<String, Object>> getSearchObj() {
    return searchObj;
  }

  public void setSearchObj(List<HashMap<String, Object>> searchObj) {
    this.searchObj = searchObj;
  }

  public List<HashMap<String, Object>> getUpdateObj() {
    return updateObj;
  }

  public void setUpdateObj(List<HashMap<String, Object>> updateObj) {
    this.updateObj = updateObj;
  }

  @Override
  public String toString() {
    return "Combean [page=" + page + ", listLength=" + listLength + ", searchKey=" + searchKey
        + ", sortField=" + sortField + ", sortOrder=" + sortOrder + ", searchObj=" + searchObj
        + ", updateObj=" + updateObj + "]";
  }

}
