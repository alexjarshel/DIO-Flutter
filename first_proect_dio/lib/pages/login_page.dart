import 'package:first_proect_dio/pages/main_page.dart';
import 'package:flutter/material.dart';

class LgginPage extends StatefulWidget {
  const LgginPage({super.key});

  @override
  State<LgginPage> createState() => _LgginPageState();
}

class _LgginPageState extends State<LgginPage> {
  TextEditingController emailControler = TextEditingController(text: "");
  TextEditingController passwordControler = TextEditingController(text: "");
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                ),
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
                      child: TextField(
                        controller: emailControler,
                        onChanged: (value) {},
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
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
                      child: TextField(
                        obscureText: isObscureText,
                        controller: passwordControler,
                        onChanged: (value) {},
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 0),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 141, 79, 151))),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 141, 79, 151),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: Icon(
                                isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color.fromARGB(255, 141, 79, 151),
                              ),
                            )),
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
                            onPressed: () {
                              if (emailControler.text == 'email@email.com' &&
                                  passwordControler.text == '123') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Login OK')));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MainPage()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Login error')));
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
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
                        style: TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      //color: Colors.red,
                      height: 30,
                      alignment: Alignment.center,
                      child: const Text(
                        'Create account',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )));
  }
}
