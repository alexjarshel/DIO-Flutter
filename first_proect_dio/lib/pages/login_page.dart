import 'package:flutter/material.dart';

class LgginPage extends StatefulWidget {
  const LgginPage({super.key});

  @override
  State<LgginPage> createState() => _LgginPageState();
}

class _LgginPageState extends State<LgginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 241, 243),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            const Icon(
              Icons.person,
              size: 150,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                //color: Colors.green,
                height: 30,
                alignment: Alignment.center,
                child: const Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text('Inform  your email'),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text('email'),
                    ),
                  ],
                )),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                //color: Colors.green,
                height: 30,
                alignment: Alignment.center,
                child: const Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text('Inform  your password'),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text('password'),
                    ),
                  ],
                )),
            Expanded(child: Container()),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              color: Colors.green,
              height: 30,
              alignment: Alignment.center,
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              //color: Colors.red,
              height: 30,
              alignment: Alignment.center,
              child: const Text('Subscribe'),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
