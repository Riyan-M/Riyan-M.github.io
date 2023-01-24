import 'package:flutter/cupertino.dart';
import'package:provider/provider.dart';

class FormManager extends ChangeNotifier{
  bool _formIsComplete = false;
  get formIsComplete => _formIsComplete;

  List<String> _tags = [];
  List<String> get tags => _tags;

  set tags(List<String> value) {
    if (value != _tags) {
      _tags = value;
      print('Value Changed');
      print("tags: $tags");
      notifyListeners();
    }
  }



}