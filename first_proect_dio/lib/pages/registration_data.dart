import 'package:first_proect_dio/repositories/language_repositories.dart';
import 'package:first_proect_dio/repositories/level_repository.dart';
import 'package:first_proect_dio/shared/widgets/text_label.dart';
import 'package:flutter/material.dart';

class RegistrationData extends StatefulWidget {
  const RegistrationData({super.key});

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
  bool isLoading = false;

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
        value: i,
        child: Text(i.toString()),
      ));
    }

    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('User Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(text: 'Name'),
                  TextField(
                    controller: nameControler,
                  ),
                  const TextLabel(text: 'birth date'),
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
                  const TextLabel(text: 'Exeperince Level'),
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
                  const TextLabel(text: 'Prefered languages'),
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
                                    selectedLanguages
                                        .remove(language['language']);
                                  } else {
                                    selectedLanguages.add(language['language']);
                                  }
                                  language['isCheck'] = !language['isCheck'];
                                });
                              }))
                          .toList()),
                  const TextLabel(text: 'Exeperince Time'),
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
                        setState(() {
                          isLoading = false;
                        });
                        if (nameControler.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('The name must be informed')));
                          return;
                        }
                        if (birthDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('birthDate invalid')));
                          return;
                        }
                        if (selectedLevel == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('You must select one level')));
                          return;
                        }
                        if (selectedLanguages.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'you must select at least one language')));
                          return;
                        }
                        if (chosenSalary < 1000) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'the salary claim cannot be lower than 1000')));
                          return;
                        }

                        setState(() {
                          isLoading = true;
                        });
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            isLoading = false;
                            Navigator.pop(context);
                          });
                        });

                        print("Registration OK");
                      },
                      child: const Text('save')),
                ],
              ),
      ),
    );
  }
}
