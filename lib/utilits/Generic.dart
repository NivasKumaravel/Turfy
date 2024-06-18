import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Common_Colors.dart';



final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
String? accesstokens = 'accessToken';
String? userId ='user_id';
String Storage = 'storage';
String? routes = "routes_Log";


AndroidOptions _androidOptions() =>
    AndroidOptions();
IOSOptions _getIOSOptions() => IOSOptions(
  accountName: Storage,
);

void deleteAll() async {
  await _secureStorage.deleteAll(iOptions: _getIOSOptions());
}

accessToken(dynamic val) async {
  await _secureStorage.write(
      key: accesstokens!, value: val, aOptions: _androidOptions());
  print("val!:$val"+"$accesstokens");
}

Future<dynamic> getToken() async {
  final String? gettoken =
  await _secureStorage.read(key: accesstokens!, aOptions: _androidOptions());
  print("valu:$gettoken");
  return gettoken!;

}

UserId(dynamic val)async{
  await _secureStorage.write(key: userId!, value: val!,aOptions: _androidOptions());
  print("value!:${val!}"+"$userId");
}

Future<dynamic> getuserId()async{
  dynamic user_id = await _secureStorage.read(key: userId!,aOptions: _androidOptions());
  print("valuesss:$user_id");
  return user_id;
}

Routes(dynamic val) async{
  await _secureStorage.write(key: routes!, value: val!,aOptions: _androidOptions());
  print("valuesss:$routes");
  return routes;
}

Future<dynamic> getRoutes()async{
  dynamic routes_Log = await _secureStorage.read(key: routes!,aOptions: _androidOptions());
  print("valuesss:$routes_Log");
  return routes_Log;
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
void ShowToastMessage(String message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0
);
void MotionToastErr(String message) {
  MotionToast.error(description: Text(message),height: 60,width: 280,)
      .show(NavigationService.navigatorKey.currentContext!);
}

void MotionToastErrwithoutTitle(String message) {
  MotionToast.error(description: Text(message),height: 60,width: 280,)
      .show(NavigationService.navigatorKey.currentContext!);
}

void MotionToastErrwithTitle(String title,String message) {
  MotionToast.error(title:Text(title),description: Text(message),height: 60,width: 280,)
      .show(NavigationService.navigatorKey.currentContext!);
}

void MotionToastSuccess(String message) {
  MotionToast.success(description: Text(message),height: 60,width: 280)
      .show(NavigationService.navigatorKey.currentContext!);
}

void MotionToastSuccessDuration(String message,int duration) {
  MotionToast.success(description: Text(message),height: 60,width: 280,toastDuration:Duration(seconds: duration) ,)
      .show(NavigationService.navigatorKey.currentContext!);
}
void MotionToastCustom(String message){
  MotionToast(
    icon:  Icons.alarm,
    primaryColor:  Colors.pink,
    title:  Text(message),
    description:  Text(""),
    width:  300,
    height:  100,
  ).show(NavigationService.navigatorKey.currentContext!);
}

class GetterSetter{
  String? _myValue;

  String get myValue {
    return _myValue ?? "";
  }

  set myValue(String value) {
    _myValue = value;
  }
}

class SingleTon{
  static final SingleTon qwerty = SingleTon._internal();
  factory SingleTon(){
    return qwerty;
  }
  SingleTon._internal();
  String setLocation = "";
  bool isLoading = true;
  String lattidue = "";
  String longitude = "";
  String totalAmnt = '';
  LatLng locationLat = LatLng(0.0, 0.0);


}

Widget buildLoadingIndicator() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: SpinKitWave(
        type: SpinKitWaveType.center,
        size: 50,
        itemBuilder: (_, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? brown1 : Colors.black,
            ),
          );
        },
      ),
    ),
  );
}

// Future<void> readall() async{
// final all =await _secureStorage.readAll(aOptions: _androidOptions());
// }

// void tokenVal(tokens, farmerId) async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString("tokenval", tokens);
//   await prefs.setInt("farmerID", farmerId);
//   final _tokenval = await prefs.getString("tokenval");
//   final _idVal = await prefs.getInt("farmerID");
//   print(_tokenval);
//   print(_idVal);
// }


