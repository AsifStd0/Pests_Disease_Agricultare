import 'dart:convert';

import 'package:agricultare_weather_pests/utils/string_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class LocalStorageService {
//     final SharedPreferences _prefs;

//   LocalStorageService(this._prefs);
//   Future<void> saveCrops(List<String> listCrops) async {

//     await _prefs.setStringList('listCrops', listCrops);
//   }
//   List<String>? getCrops(){
//     return _prefs.getStringList('listCrops');
//   }

// }

class LocalStorageService {
  final SharedPreferences _prefs;

  LocalStorageService(this._prefs);

  Future<void> saveCrops(List<SelectCropsData> listCrops) async {

    
    List<String> serializedCrops = listCrops.map((crop) {
      return jsonEncode({'name': crop.name, 'image': crop.image});
    }).toList();
    
    await _prefs.setStringList('listCrops', serializedCrops);
  }

  // List<SelectCropsData>? getCrops() {
  //   List<String>? serializedCrops = _prefs.getStringList('listCrops');

  //   return serializedCrops.map((cropString) {
  //     Map<String, dynamic> cropMap = jsonDecode(cropString);
  //     return SelectCropsData(name: cropMap['name'], image: cropMap['image']);
  //   }).toList();
  // }
}

