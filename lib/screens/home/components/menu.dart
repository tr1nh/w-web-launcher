import 'package:flutter/material.dart';
import '../constants.dart';

class Menu extends StatelessWidget {
  final handler;

  const Menu({
    Key? key,
    required this.menu,
    required this.handler,
  }) : super(key: key);

  final List<CustomPopupMenu> menu;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return menu.map((item) {
          return PopupMenuItem(child: Text(item.title), value: item.value);
        }).toList();
      },
      onSelected: handler,
    );
  }
}
