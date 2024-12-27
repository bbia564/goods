import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'goods_second_logic.dart';

class GoodsSecondPage extends GetView<GoodsSecondLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = [
      'Clean all records',
      'Feedback',
      'Version'
    ];
    return Container(
      width: double.infinity,
      height: 53,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: <Widget>[
        Text(titles[index]),
        index == 2 ? const Text('1.0.0').paddingOnly(right: 6) : const Icon(
          Icons.keyboard_arrow_right,
          size: 25,
          color: Colors.grey,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    )
        .decorated(
            color: const Color(0xfff7f7f7),
            borderRadius: BorderRadius.circular(12))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanGoodsData();
          break;
        case 1:
          Get.toNamed('/feedback');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
        leading: SizedBox(
          width: 100,
          child: const Text(
            'Set',
            style: TextStyle(fontWeight: FontWeight.bold),
          ).marginOnly(left: 20),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            _item(0, context),
            _item(1, context),
            _item(2, context),
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
