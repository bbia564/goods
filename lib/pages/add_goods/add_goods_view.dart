import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goods_storage/main.dart';
import 'package:goods_storage/pages/goods_second/feedback/goods_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'add_goods_logic.dart';

class AddGoodsPage extends GetView<AddGoodsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      appBar: AppBar(
        title: const Text('Add storage'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  child: <Widget>[
                    const Text(
                      'Storage name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: GoodsTextField(
                          maxLength: 20,
                          value: controller.name,
                          onChange: (value) {
                            controller.name = value;
                          }),
                    ).decorated(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xffdbdbdb))),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Maximum number of containers',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: <Widget>[
                        Image.asset(
                          'assets/sub.webp',
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ).gestures(onTap: () {
                          controller.subAdd(isAdd: false);
                        }),
                        Obx(() {
                          return Text(controller.quantityMax.value.toString());
                        }),
                        Image.asset(
                          'assets/add.webp',
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ).gestures(onTap: () {
                          controller.subAdd();
                        })
                      ].toRow(mainAxisAlignment: MainAxisAlignment
                          .spaceBetween),
                    ).decorated(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xffdbdbdb))),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Add storage',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                        .decorated(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12))
                        .gestures(onTap: () {
                          controller.addGoods();
                    })
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12))
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
            ).marginAll(15)),
      ),
    );
  }
}
