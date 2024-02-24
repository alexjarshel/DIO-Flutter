import 'package:first_proect_dio/pages/page1.dart';
import 'package:first_proect_dio/pages/page2.dart';
import 'package:first_proect_dio/pages/page3.dart';
import 'package:first_proect_dio/pages/registration_data.dart';
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
    var space = SizedBox(
      height: 10,
    );
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Main Page'),
      ),
      drawer: Drawer(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(children: [
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              child: Text('registration data'),
            ),
            onTap: () {
              Navigator.pop;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegistrationData(
                          txt: 'registration data', data: ['Alex', '22'])));
            },
          ),
          space,
          Divider(),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              child: Text('terms of use'),
            ),
            onTap: () {},
          ),
          space,
          Divider(),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              child: Text('settings'),
            ),
            onTap: () {},
          ),
          space,
          Divider(),
        ]),
      )),
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
              children: [Page1Page(), Page2Page(), Page3Page()],
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
