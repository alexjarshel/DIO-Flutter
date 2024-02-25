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
  var selectedLanguages = [];
  double chosenSalary = 0;
  int experienceTime = 0;

  @override
  void initState() {
    levels = levelRepository.returnLevel();
    languages = languageRepository.returnLanguage();
    super.initState();
  }

  List<DropdownMenuItem> returnItens(int maxQuant) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= maxQuant; i++) {
      itens.add(DropdownMenuItem(
        child: Text(i.toString()),
        value: i,
      ));
    }

    return itens;
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
                            print(language['language']);
                            if (selectedLanguages
                                .contains(language['language'])) {
                              selectedLanguages.remove(language['language']);
                            } else {
                              selectedLanguages.add(language['language']);
                            }
                            language['isCheck'] = !language['isCheck'];
                          });
                        }))
                    .toList()),
            TextLabel(text: 'Exeperince Time'),
            DropdownButton(
                value: experienceTime,
                isExpanded: true,
                items: returnItens(50),
                onChanged: (value) {
                  setState(() {
                    experienceTime = int.parse(value.toString());
                  });
                }),
            TextLabel(
                text:
                    'Salary expectations: R\$  ${chosenSalary.round().toString()}'),
            Slider(
                min: 0,
                max: 10000,
                value: chosenSalary,
                onChanged: (double value) {
                  setState(() {
                    chosenSalary = value;
                  });
                }),
            TextButton(
                onPressed: () {
                  print(nameControler.text);
                  print(birthDateControler.text);
                  print(selectedLevel);
                  print(selectedLanguages);
                  print(chosenSalary);
                  print(experienceTime);
                },
                child: Text('save')),
          ],
        ),
      ),
    );
  }
}
