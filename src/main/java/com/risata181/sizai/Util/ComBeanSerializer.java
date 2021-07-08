package com.risata181.sizai.Util;

import com.google.gson.JsonElement;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.risata181.sizai.bean.Combean;
import java.lang.reflect.Type;

public class ComBeanSerializer implements JsonSerializer<Combean> {

  @Override
  public JsonElement serialize(Combean vo, Type typeOfVo, JsonSerializationContext context) {
    return context.serialize((Object) vo);
  }

}
