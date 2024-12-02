import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/signup/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  TextEditingController otpController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Phone'),
      ),
      body:
       Consumer<SignupProvider>(
              builder: (context, model, child) => Scaffold(
                  body: ModalProgressHUD(
                      inAsyncCall: model.state == ViewState.busy,
                      child:
       Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.all(20.0),
            child: TextFormField(
              controller: otpController,


              decoration: InputDecoration(
                labelText: 'Enter Phone',
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.cyan,
                    width: 3
                  )
                ),

                ),
            ),

          ),
          ElevatedButton(onPressed: () async {
            await model.getVerficationCode(context,otpController.text);
          }, 
          
           child: Text('Submit'))

        ],
      ),
                  ),
              ),
       ),
    );
  }
}