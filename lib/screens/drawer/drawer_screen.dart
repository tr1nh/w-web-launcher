import 'package:flutter/material.dart';
import 'package:w_web_launcher/screens/drawer/components/app_drawer.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text('Applications', style: TextStyle(fontSize: 25)),
      ),
      body: AppDrawer(),
    );
  }
}
