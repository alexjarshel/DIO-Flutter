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
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.green,
              child: Text(
                "User Actions",
                style: GoogleFonts.acme(fontSize: 30),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.amber,
                child: Text(
                  " Random nnumber $generatedNumber",
                  style: GoogleFonts.acme(fontSize: 30),
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              child: Text(
                "foi Clicado $clicks vezes",
                style: GoogleFonts.acme(fontSize: 30),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.blue,
                    child: Text(
                      "Nome",
                      style: GoogleFonts.acme(fontSize: 30),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.red,
                    child: Text(
                      "Alex Jarschel",
                      style: GoogleFonts.acme(fontSize: 30),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.yellow,
                    child: Text(
                      "30",
                      style: GoogleFonts.acme(fontSize: 30),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
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
