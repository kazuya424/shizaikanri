package com.risata181.sizai.Util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.risata181.sizai.bean.Combean;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;


public class MakeResponseHeader {

  /**
   * To json.
   *
   * @param obj the obj
   * @return the string
   */
  protected static String toJson(Object obj) {
    Gson gson = getGsonBuiler();
    return gson.toJson(obj);
  }

  /**
   * Gson Builder
   * 
   * @return Gson
   */
  protected static Gson getGsonBuiler() {
    GsonBuilder gbuilder = new GsonBuilder();
    gbuilder.registerTypeAdapter(Combean.class, new ComBeanSerializer());
    return gbuilder.create();
  }

  /**
   * Make json response header.
   *
   * @param obj the obj
   * @return the response entity
   */
  public static ResponseEntity<Object> makeJsonResponseHeader(Object obj) {
    HttpHeaders responseHeaders = new HttpHeaders();
    responseHeaders.set("Content-Type", MediaType.APPLICATION_JSON_VALUE + "; charset=utf-8");
    return new ResponseEntity<Object>(toJson(obj), responseHeaders, HttpStatus.OK);
  }

}
