import 'package:flutter/material.dart';
import 'drawer_item.dart';

class DrawerContent extends StatelessWidget {
  final List<DrawerItem> items;

  const DrawerContent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items,
    );
  }
}
