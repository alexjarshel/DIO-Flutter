import 'package:first_proect_dio/pages/registration_data.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
    ));
  }
}
