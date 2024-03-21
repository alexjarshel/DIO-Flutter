import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final USER_NAME_KEY = 'user_name';
  final USER_HEIGHT_KEY = 'user_height';
  final NOTIFICATION_KEY = 'notfication';
  final DARK_THEME_KEY = 'dark_theme';

  late SharedPreferences storage;
  TextEditingController userNameControler = TextEditingController();
  TextEditingController userHeigthControler = TextEditingController();
  String? name;
  double? height;
  bool pushNotification = false;
  bool darkTheme = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    print(darkTheme);
  }

  void loadData() async {
    storage = await SharedPreferences.getInstance();
    userNameControler.text = storage.getString(USER_NAME_KEY) ?? '';
    userHeigthControler.text =
        (storage.getDouble(USER_HEIGHT_KEY) ?? 0).toString();
    pushNotification = storage.getBool(NOTIFICATION_KEY) ?? false;
    darkTheme = storage.getBool(DARK_THEME_KEY) ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Configuration'),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: userNameControler,
                  decoration: const InputDecoration(hintText: "User Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: userHeigthControler,
                  decoration: const InputDecoration(hintText: "User Height"),
                ),
              ),
              SwitchListTile(
                  title: const Text('Recive Notification'),
                  value: pushNotification,
                  onChanged: (bool value) {
                    setState(() {
                      pushNotification = value;
                    });
                  }),
              SwitchListTile(
                  title: const Text('Dark Theme'),
                  value: darkTheme,
                  onChanged: (bool value) {
                    setState(() {
                      darkTheme = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 33, 150, 243))),
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    try {
                      await storage.setDouble(USER_HEIGHT_KEY,
                          double.parse(userHeigthControler.text));
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text('My app'),
                              content: Text('Please enter a valid height'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'))
                              ],
                            );
                          });
                      return;
                    }
                    await storage.setString(
                        USER_NAME_KEY, userNameControler.text);

                    await storage.setBool(NOTIFICATION_KEY, pushNotification);
                    await storage.setBool(DARK_THEME_KEY, darkTheme);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
