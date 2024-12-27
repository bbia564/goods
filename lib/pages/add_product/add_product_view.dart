import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import '../goods_second/feedback/goods_text_field.dart';
import 'add_product_logic.dart';

class AddProductPage extends GetView<AddProductLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      appBar: AppBar(
        title: Text(controller.productEntity == null ? 'Add product' : 'Edit product'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<AddProductLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: <Widget>[
                  const Text(
                    'Product image',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 97,
                      height: 97,
                      child: controller.image == null
                          ? const Icon(
                              Icons.add_a_photo,
                              size: 40,
                              color: Colors.grey,
                            )
                          : Image.memory(
                              controller.image!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    )
                        .decorated(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12))
                        .gestures(onTap: () {
                      controller.imageSelected();
                    }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Storage area',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: <Widget>[
                      Expanded(
                        child: IgnorePointer(
                          child: GoodsTextField(
                              hintText: 'Please select',
                              value: controller.goodsEntity?.name ?? '',
                              onChange: (value) {
                          
                              }),
                        ),
                      ),
                     const SizedBox(width: 10,),
                     const Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Colors.grey,
                      )
                    ].toRow(),
                  )
                      .decorated(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xffdbdbdb)))
                      .gestures(onTap: () {
                    controller.showGoods();
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Product name',
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
                    'Quantity',
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
                        return Text(controller.quantityCount.value.toString());
                      }),
                      Image.asset(
                        'assets/add.webp',
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                      ).gestures(onTap: () {
                        controller.subAdd();
                      })
                    ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
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
                    child: Text(
                      controller.productEntity == null ? 'Add product' : 'Edit product',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                      .decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12))
                      .gestures(onTap: () {
                        controller.addProduct();
                  })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(12))
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          );
        }).marginAll(15)),
      ),
    );
  }
}
