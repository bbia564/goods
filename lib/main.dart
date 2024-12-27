import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goods_storage/db_goods/db_goods.dart';
import 'package:goods_storage/pages/add_goods/add_goods_binding.dart';
import 'package:goods_storage/pages/add_goods/add_goods_view.dart';
import 'package:goods_storage/pages/add_product/add_product_binding.dart';
import 'package:goods_storage/pages/add_product/add_product_view.dart';
import 'package:goods_storage/pages/goods_first/goods_first_binding.dart';
import 'package:goods_storage/pages/goods_first/goods_first_view.dart';
import 'package:goods_storage/pages/goods_second/feedback/feedback_binding.dart';
import 'package:goods_storage/pages/goods_second/feedback/feedback_view.dart';
import 'package:goods_storage/pages/goods_second/goods_second_binding.dart';
import 'package:goods_storage/pages/goods_second/goods_second_view.dart';
import 'package:goods_storage/pages/goods_tab/goods_tab_binding.dart';
import 'package:goods_storage/pages/goods_tab/goods_tab_view.dart';

Color primaryColor = const Color(0xff243cfe);
Color bgColor = Colors.white;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBGoods().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Goods,
      initialRoute: '/goodsTab',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: const Color(0xfffcfcfc),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Goods = [
  GetPage(name: '/goodsTab', page: () => GoodsTabPage(), binding: GoodsTabBinding()),
  GetPage(name: '/goodsFirst', page: () => const GoodsFirstPage(), binding: GoodsFirstBinding()),
  GetPage(name: '/goodsSecond', page: () => GoodsSecondPage(), binding: GoodsSecondBinding()),
  GetPage(name: '/addGoods', page: () => AddGoodsPage(), binding: AddGoodsBinding()),
  GetPage(name: '/addProduct', page: () => AddProductPage(), binding: AddProductBinding()),
  GetPage(name: '/feedback', page: () => FeedbackPage(), binding: FeedbackBinding()),
];