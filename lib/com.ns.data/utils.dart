
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
   static String nonNull(dynamic arg){
      return '$arg';
   }
   static bool isNull(dynamic? arg){
      return arg==null?true:false;
   }
   static T? cast<T>(x) {
      return x is T ? x : null;
   }
   static T castNonNull<T>(x, T def) {
      return  cast(x)??def;
   }

   static Future<bool> delSetting(String key) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.remove(key) ;
   }
   static Future<String> getSetting(String key) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key) ?? '';
   }
   static Future<bool> setSetting(String key, String value) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setString(key, value);
   }
   static bool isEmail(String em) {
      String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(p);
      return regExp.hasMatch(em);
   }
   static int getInt(String str){
      try{
         if(intRegex.hasMatch(str)){
            return int.parse(str);
         }

      }  on Exception catch (_){}
      return 0;
   }
   static final numberRegex = RegExp(r'-?\d+(\.\d+)?');
   static final doubleRegex = RegExp(r'^[-+]?[0-9]*.?[0-9]+([eE][-+]?[0-9]+)?$' );
   static final intRegex = RegExp(r'-?\d+' );
}