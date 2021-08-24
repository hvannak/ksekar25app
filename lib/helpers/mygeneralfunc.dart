import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getsharedPref(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? "";
}

setsharedPref(String key,String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

removesharedPref(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}
  
reInstantiateImagesCodec(List<int> buffer){
  String strValue = new String.fromCharCodes(buffer);
  if(strValue.startsWith("data:image/png;base64,")){
    strValue = strValue.split(",")[1];
    return base64Decode(strValue);
  } else {
    return buffer;
  }            
}