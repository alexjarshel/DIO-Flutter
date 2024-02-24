import 'package:flutter/material.dart';

class RegistrationData extends StatelessWidget {
  final String txt;
  final List<String> data;
  const RegistrationData({super.key, required this.txt, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(txt),
      ),
      body: Center(
        child: Text(data.length.toString()),
      ),
    );
  }
}



/*
class RegistrationData extends StatefulWidget {
  const RegistrationData({super.key});

  @override
  State<RegistrationData> createState() => _RegistrationDataState();
}

class _RegistrationDataState extends State<RegistrationData> {
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('registration data'),
      ),
    );
  }
}
*/
