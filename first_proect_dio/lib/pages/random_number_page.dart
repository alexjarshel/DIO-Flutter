import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({super.key});

  @override
  State<RandomNumberPage> createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  int? generatedNumber = 0;
  int? clicks = 0;
  final key_random_number = 'RandoNumber';
  final key_cliks = 'clicks_quantity';
  late SharedPreferences storage;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    storage = await SharedPreferences.getInstance();
    generatedNumber = storage.getInt(key_random_number);
    clicks = storage.getInt(key_cliks);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Random Numbers'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Random Number Created : ${generatedNumber == null ? "" : generatedNumber.toString()}',
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                'Clicks : ${clicks == null ? "" : clicks.toString()}',
                style: const TextStyle(fontSize: 22),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var random = Random();

            /*
            final Future<SharedPreferences> _storage =
                SharedPreferences.getInstance();
            storage = await _storage;
            */

            setState(() {
              generatedNumber = random.nextInt(1000);
              clicks = (clicks ?? 0) + 1;
              storage.setInt(key_random_number, generatedNumber!);
              storage.setInt(key_cliks, clicks!);
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
