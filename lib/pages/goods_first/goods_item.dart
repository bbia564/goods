import 'package:flutter/material.dart';
import 'package:goods_storage/db_goods/goods_entity.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class GoodsItem extends StatefulWidget {
  const GoodsItem(this.list, this.onTap, {Key? key}) : super(key: key);
  final List<ProductEntity> list;
  final VoidCallback onTap;

  @override
  State<GoodsItem> createState() => _GoodsItemState();
}

class _GoodsItemState extends State<GoodsItem> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: widget.list.isEmpty
          ? const Center(
              child: Text('No data'),
            )
          : ListView.builder(
              itemCount: widget.list.length,
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) {
                final item = widget.list[index];
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.memory(
                        item.image,
                        width: 41,
                        height: 41,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: <Widget>[
                      Text(item.name),
                      Text(
                        'ID: 0000${item.id + 1}',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      size: 25,
                      color: Colors.grey,
                    )
                  ].toRow(),
                )
                    .decorated(
                        color: const Color(0xfff7f7f7),
                        borderRadius: BorderRadius.circular(8))
                    .marginOnly(bottom: 10)
                    .gestures(onTap: () {
                  Get.toNamed('/addProduct',arguments: item)?.then((_) {
                    widget.onTap();
                  });
                });
              }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
