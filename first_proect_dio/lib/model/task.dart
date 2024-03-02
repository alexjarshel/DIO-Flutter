import 'package:flutter/material.dart';

class Task {
  final String _id = UniqueKey().toString();
  String _description = "";
  bool _finised = false;

  Task(this._description, this._finised);

  String get id => _id;

  String get description => _description;

  set descriptio(String description) {
    _description = description;
  }

  bool get finish => _finised;

  set finish(value) {
    _finised = value;
  }
}
