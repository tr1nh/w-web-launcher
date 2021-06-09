import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:w_web_launcher/screens/drawer/components/drawer_item.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  var apps = [];

  @override
  void initState() {
    super.initState();
    getListApplications();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: apps.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: DrawerItem(app: apps[index]),
          ),
          onTap: () {
            DeviceApps.openApp(apps[index].packageName);
          },
        );
      },
    );
  }

  void getListApplications() async {
    List getApps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );
    setState(() {
      apps = getApps;
    });
  }
}
