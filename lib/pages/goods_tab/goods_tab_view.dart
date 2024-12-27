import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:goods_storage/db_goods/db_goods.dart';
import 'package:goods_storage/main.dart';
import 'package:goods_storage/pages/add_product/add_product_view.dart';
import 'package:goods_storage/pages/goods_first/goods_first_logic.dart';
import 'package:goods_storage/pages/goods_first/goods_first_view.dart';
import 'package:goods_storage/pages/goods_second/goods_second_view.dart';

import 'goods_tab_logic.dart';

class GoodsTabPage extends GetView<GoodsTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          GoodsFirstPage(),
          AddProductPage(),
          GoodsSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navGoodsBars()),
    );
  }

  Widget _navGoodsBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,color: primaryColor,size: 40,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Set',
        )
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) async {
        if (index == 1) {
          DBGoods dbGoods = Get.find<DBGoods>();
          final goods = await dbGoods.getGoodsAllData();
          if (goods.isEmpty) {
            Fluttertoast.showToast(msg: 'Please add storage first');
            return;
          }
          Get.toNamed('/addProduct')?.then((_) {
            GoodsFirstLogic firstLogic = Get.find<GoodsFirstLogic>();
            firstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
