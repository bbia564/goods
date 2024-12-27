import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goods_storage/main.dart';
import 'package:goods_storage/pages/goods_first/goods_item.dart';
import 'package:styled_widget/styled_widget.dart';

import 'goods_first_logic.dart';

class GoodsFirstPage extends StatefulWidget {
  const GoodsFirstPage({Key? key}) : super(key: key);

  @override
  State<GoodsFirstPage> createState() => _GoodsFirstPageState();
}

class _GoodsFirstPageState extends State<GoodsFirstPage>
    with TickerProviderStateMixin {
  final controller = Get.find<GoodsFirstLogic>();
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: <Widget>[
        <Widget>[
          const Text(
            'Goods storage',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            height: 34,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: <Widget>[
              const Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Add storage',
                style: TextStyle(color: Colors.white),
              )
            ].toRow(),
          )
              .decorated(
                  color: primaryColor, borderRadius: BorderRadius.circular(17))
              .gestures(onTap: () {
            Get.toNamed('/addGoods')?.then((_) {
              controller.getData();
            });
          })
        ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
        Container(
          width: double.infinity,
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: <Widget>[
            const Text(
              'Total items: ',
              style: TextStyle(fontSize: 12),
            ),
            Obx(() {
              return Text(
                controller.allCount.value.toString(),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              );
            })
          ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
        )
            .decorated(
                color: const Color(0xfff7f7f7),
                borderRadius: BorderRadius.circular(12))
            .marginOnly(top: 20),
        GetBuilder<GoodsFirstLogic>(builder: (_) {
          _tabController =
              TabController(length: controller.allGoods.length, vsync: this);
          return Expanded(
              child: Container(
            height: double.infinity,
            child: controller.allGoods.isEmpty
                ? const Center(
                    child: Text('No data'),
                  )
                : <Widget>[
                    SizedBox(
                      width: double.infinity,
                      child: Theme(
                        data: ThemeData(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            useMaterial3: true,
                            tabBarTheme: const TabBarTheme(
                                indicatorColor: Colors.transparent)),
                        child: TabBar(
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          controller: _tabController,
                          dividerColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          labelPadding: const EdgeInsets.only(right: 20),
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelStyle:
                              const TextStyle(color: Colors.grey, fontSize: 15),
                          indicatorColor: Colors.black,
                          tabs: controller.allGoods
                              .map((e) => Tab(
                                    text: e.name,
                                  ))
                              .toList(),
                        ),
                      ),
                    ).marginOnly(bottom: 10),
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      child: TabBarView(
                        controller: _tabController,
                        children: controller.allGoods
                            .map((e) => GoodsItem(e.products, () {
                                  controller.getData();
                                }))
                            .toList(),
                      ),
                    ))
                  ].toColumn(),
          ).decorated(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)));
        })
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
          .marginAll(15),
    );
  }
}
