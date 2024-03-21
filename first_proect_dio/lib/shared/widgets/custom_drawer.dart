import 'package:first_proect_dio/pages/configuration_page.dart';
import 'package:first_proect_dio/pages/login_page.dart';
import 'package:first_proect_dio/pages/random_number_page.dart';
import 'package:first_proect_dio/pages/registration_data.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var space = const SizedBox(
      height: 10,
    );
    return Drawer(
      child: Column(children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                context: context,
                builder: (BuildContext bc) {
                  return Wrap(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: const Text('Ca mera'),
                        leading: const Icon(Icons.camera),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: const Text('Galery'),
                        leading: const Icon(Icons.archive_rounded),
                      )
                    ],
                  );
                });
          },
          child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                    'https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png'),
              ),
              accountName: const Text('Alex'),
              accountEmail: const Text('email@email')),
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 5,
                  ),
                  Text('registration data'),
                ],
              )),
          onTap: () {
            Navigator.pop;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegistrationData(
                        //txt: 'registration data', data: ['Alex', '22']
                        )));
          },
        ),
        space,
        const Divider(),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.info),
                  SizedBox(
                    width: 5,
                  ),
                  Text('terms of use'),
                ],
              )),
          onTap: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              'terms of use',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ));
                });
          },
        ),
        space,
        const Divider(),
        InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: double.infinity,
            child: const Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 5,
                ),
                Text('settings'),
              ],
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (bc) => const ConfigurationPage()));
          },
        ),
        const Divider(),
        InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: double.infinity,
            child: const Row(
              children: [
                Icon(Icons.numbers),
                SizedBox(
                  width: 5,
                ),
                Text('Rnadom number generator'),
              ],
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (bc) => const RandomNumberPage()));
          },
        ),
        space,
        const Divider(),
        InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: double.infinity,
            child: const Row(
              children: [
                Icon(Icons.exit_to_app),
                SizedBox(
                  width: 5,
                ),
                Text('Exit'),
              ],
            ),
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    alignment: Alignment.centerLeft,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: const Text('APP'),
                    content: const Wrap(
                      children: [
                        Text('You will exit the app'),
                        Text('Exit the app?'),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: const Text('Yes')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('No'))
                    ],
                  );
                });
          },
        ),
      ]),
    );
  }
}
