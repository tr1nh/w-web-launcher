import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:w_web_launcher/screens/drawer/drawer_screen.dart';
import 'package:w_web_launcher/screens/home/components/menu.dart';
import 'package:w_web_launcher/screens/home/constants.dart';
import 'components/web_view_container.dart';

GlobalKey<WebViewContainerState> webViewKey = GlobalKey();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final String url;

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            brightness: Brightness.dark,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Menu(
                  menu: menu,
                  handler: (String value) {
                    switch (value) {
                      case 'applications':
                        openDrawer();
                        break;
                      case 'choose_folder':
                        updateWebsiteFolder();
                        break;
                      case 'restore_default':
                        restoreDefaultFolder();
                        break;
                      case 'homepage':
                        goHomePage();
                        break;
                      case 'help':
                        goHelpPage();
                        break;
                      default:
                    }
                  })
            ],
          ),
          body: WebViewContainer(key: webViewKey, url: url)),
    );
  }

  void loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String getUrl = prefs.getString('url') ?? 'assets/pages/index.html';
    setState(() {
      url = getUrl;
    });
  }

  void openDrawer() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DrawerScreen()));
  }

  void updateWebsiteFolder() async {
    String? folderPath = await FilePicker.platform.getDirectoryPath();
    String newUrl = 'file://' + folderPath! + '/index.html';
    webViewKey.currentState!.reloadUrl(newUrl);
    updatePreferences(newUrl);
  }

  void restoreDefaultFolder() async {
    String newUrl = 'assets/pages/index.html';
    webViewKey.currentState!.reloadUrl(newUrl);
    updatePreferences(newUrl);
  }

  void goHomePage() async {
    webViewKey.currentState!.reloadUrl(url);
  }

  void goHelpPage() async {
    String newUrl = 'assets/pages/help.html';
    webViewKey.currentState!.reloadUrl(newUrl);
  }

  void updatePreferences(String url) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('url', url);
  }
}
