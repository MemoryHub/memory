import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil{
  static show(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM);
  }

  static error(){
     Fluttertoast.showToast(
        msg: '这段回忆，一片空白',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM);
  }

}