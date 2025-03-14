
import 'package:agricultare_weather_pests/Model/base_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EditprofileProvider extends BaseViewModel {
  // // Controllers
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordControllerEdit = TextEditingController();
  // TextEditingController firstNameControllerEdit = TextEditingController();
  // TextEditingController lastNameControllerEdit = TextEditingController();
  // TextEditingController confirmpasswordControllerEdit = TextEditingController();

  // // Load user data from local storage
  // Future<void> loadUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userData = prefs.getString('user_data');

  //   if (userData != null) {
  //     UserDataModel user = UserDataModel.fromJson(json.decode(userData));
  //     emailController.text = user.email ?? '';
  //     firstNameControllerEdit.text = user.firstName ?? '';
  //     lastNameControllerEdit.text = user.lastName ?? '';
  //     passwordControllerEdit.text = user.password ?? '';
  //     confirmpasswordControllerEdit.text = user.password ?? '';
  //   }
  //   notifyListeners();
  // }

  // // Update user profile
  // Future<void> editprofile(BuildContext context) async {
  //   setState(ViewState.busy);

  //   // Prepare data for API
  //   final Map<String, String> userData = {
  //     "first_name": firstNameControllerEdit.text,
  //     "last_name": lastNameControllerEdit.text,
  //     "email": emailController.text,
  //     "password": passwordControllerEdit.text,
  //   };

  //   try {
  //     final response = await http.put(
  //       Uri.parse('https://yourapi.com/v1/auth/update-profile'),
  //       headers: {"Content-Type": "application/json"},
  //       body: json.encode(userData),
  //     );

  //     if (response.statusCode == 200) {
  //       final responseData = json.decode(response.body);
  //       log('Update Success: ${responseData}');

  //       // Update local storage
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setString('user_data', json.encode(responseData['data']));

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Profile Updated Successfully')),
  //       );
  //     } else {
  //       log('Update Failed: ${response.body}');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Failed to update: ${response.body}')),
  //       );
  //     }
  //   } catch (e) {
  //     log('Error: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('An error occurred: $e')),
  //     );
  //   } finally {
  //     setState(ViewState.idle);
  //     notifyListeners();
  //   }
  // }
}
