import 'package:flutter/material.dart';

class Task {
  final String _id = UniqueKey().toString();
  String _description = "";
  bool _finised = false;

  Task(this._description, this._finised);

  String getId() {
    return _id;
  }

  String getDescription() {
    return _description;
  }

  void setDescription(String descriptions) {
    _description = descriptions;
  }

  bool getFinish() {
    return _finised;
  }

  void setFinish(value) {
    _finised = value;
  }
}
