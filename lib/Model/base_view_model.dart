import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier{
  ViewState _state =ViewState.idle;
    ViewState get state => _state;
    void setState(ViewState state){
      _state = state;
      notifyListeners();
    }
}