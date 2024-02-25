import 'package:first_proect_dio/repositories/language_repositories.dart';
import 'package:first_proect_dio/repositories/level_repository.dart';
import 'package:first_proect_dio/shared/widgets/text_label.dart';
import 'package:flutter/material.dart';

class RegistrationData extends StatefulWidget {
  RegistrationData({super.key});

  @override
  State<RegistrationData> createState() => _RegistrationDataState();
}

class _RegistrationDataState extends State<RegistrationData> {
  TextEditingController nameControler = TextEditingController(text: '');
  TextEditingController birthDateControler = TextEditingController(text: '');
  DateTime? birthDate;
  var levelRepository = LevelRepository();
  var languageRepository = LanguageRepository();
  var levels = [];
  var selectedLevel = '';
  var languages = [];

  @override
  void initState() {
    levels = levelRepository.returnLevel();
    languages = languageRepository.returnLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('User Data'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ListView(
          children: [
            TextLabel(text: 'Name'),
            TextField(
              controller: nameControler,
            ),
            TextLabel(text: 'birth date'),
            TextField(
              controller: birthDateControler,
              readOnly: true,
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900, 1, 1),
                    lastDate: DateTime(2100, 12, 1));
                print(date);
                if (date != null) {
                  birthDateControler.text = date.toString();
                  birthDate = date;
                }
              },
            ),
            TextLabel(text: 'Exeperince Level'),
            Column(
                children: levels
                    .map((level) => RadioListTile(
                        title: Text(level.toString()),
                        value: level,
                        selected: selectedLevel == level,
                        groupValue: selectedLevel,
                        onChanged: (value) {
                          setState(() {
                            selectedLevel = level.toString();
                          });
                        }))
                    .toList()),
            TextLabel(text: 'Prefered languages'),
            Column(
                children: languages
                    .map((language) => CheckboxListTile(
                        title: Text(language['language']),
                        value: language['isCheck'],
                        onChanged: (value) {
                          setState(() {
                            language['isCheck'] = !language['isCheck'];
                          });
                          print(language['language']);
                        }))
                    .toList()),
            TextButton(
                onPressed: () {
                  print(nameControler.text);
                },
                child: Text('save')),
          ],
        ),
      ),
    );
  }
}
