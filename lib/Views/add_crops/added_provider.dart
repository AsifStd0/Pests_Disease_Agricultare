import 'package:agricultare_weather_pests/Model/base_view_model.dart';
import 'package:agricultare_weather_pests/utils/string_text.dart';
class AddedProvider extends BaseViewModel {
  List<SelectCropsData> _added = [];

  // Getter to access the list
  List<SelectCropsData> get added => _added;

  // Method to add a single crop
  void add(SelectCropsData item) {
    _added.add(item);
    notifyListeners(); // Notify listeners to rebuild widgets
  }

  // Method to remove a single crop
  void remove(SelectCropsData item) {
    _added.removeWhere((crop) => crop.name == item.name); // Match by name
    notifyListeners(); // Notify listeners to rebuild widgets
  }
}
