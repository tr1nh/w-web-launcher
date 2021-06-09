import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final app;

  const DrawerItem({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(app.appName,
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
        Text(app.packageName, style: TextStyle(color: Colors.white60))
      ],
    );
  }
}
