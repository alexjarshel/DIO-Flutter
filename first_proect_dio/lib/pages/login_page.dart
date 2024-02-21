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
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Expanded(
                  flex: 8,
                  child: Image.network(
                    'https://hermes.digitalinnovation.one/assets/diome/logo.png',
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'is registered?',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Login here and make the change',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              //color: Colors.green,
              height: 30,
              alignment: Alignment.center,
              child: const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 141, 79, 151))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 141, 79, 151))),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 141, 79, 151),
                    )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              //color: Colors.green,
              height: 30,
              alignment: Alignment.center,
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 141, 79, 151))),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 141, 79, 151),
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: Color.fromARGB(255, 141, 79, 151),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 141, 79, 151))),
                    child: const Text('Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: Container()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              //color: Colors.red,
              height: 30,
              alignment: Alignment.center,
              child: const Text(
                'Forgot password',
                style:
                    TextStyle(color: Colors.amber, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              //color: Colors.red,
              height: 30,
              alignment: Alignment.center,
              child: const Text(
                'Create account',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    ));
  }
}
