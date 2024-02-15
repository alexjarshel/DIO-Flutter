import 'package:first_proect_dio/service/random_number_creator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var generatedNumber = 0;
  var clicks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'App',
          style: GoogleFonts.pacifico(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              " Random nnumber $generatedNumber",
              style: GoogleFonts.acme(fontSize: 30),
            ),
          ),
          Center(
            child: Text(
              "foi Clicado $clicks vezes",
              style: GoogleFonts.acme(fontSize: 30),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_box_sharp),
          onPressed: () {
            setState(() {
              clicks = clicks + 1;
              generatedNumber = RandomNumberCreator.generateRandomNumber(108);
            });
            print(clicks);
          }),
    );
  }
}
