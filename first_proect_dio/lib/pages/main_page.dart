import 'package:first_proect_dio/pages/card_page.dart';
import 'package:first_proect_dio/pages/image_assets.dart';
import 'package:first_proect_dio/pages/page3.dart';
import 'package:first_proect_dio/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int pagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Main Page'),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  pagePosition = value;
                });
              },
              children: [CardPage(), imageAssetsPage(), Page3Page()],
            ),
          ),
          BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: pagePosition,
              items: [
                BottomNavigationBarItem(label: 'home', icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: 'Page 1', icon: Icon(Icons.add)),
                BottomNavigationBarItem(
                    label: 'Page 2', icon: Icon(Icons.person))
              ])
        ],
      ),
    ));
  }
}
