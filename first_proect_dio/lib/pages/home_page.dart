import 'package:first_proect_dio/service/random_number_creator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var generatedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('App'),
      ),
      body: Center(
        child: Text(generatedNumber.toString()),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_box_sharp),
          onPressed: () {
            setState(() {
              generatedNumber = RandomNumberCreator.generateRandomNumber(108);
            });
            print(generatedNumber);
          }),
    );
  }
}
