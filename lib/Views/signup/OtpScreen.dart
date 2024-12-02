// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otpscreen extends StatefulWidget {
  String? verificationId;
   Otpscreen({
    Key? key,
    this.verificationId,
  }) : super(key: key);

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
    TextEditingController snmController =TextEditingController();
String? currentText= '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
          
          PinCodeTextField(
            length: 6,
            keyboardType: TextInputType.number,
          
            obscureText: false,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
              inactiveColor: Colors.amber,
              activeColor: Colors.black,
              selectedColor: Colors.red
            ),
            
            animationDuration: Duration(milliseconds: 300),
            backgroundColor: Colors.white,
            enableActiveFill: false,
            
            // errorAnimationController: errorController,
            controller: snmController,
            onCompleted: (v) { 
              print("Completed");
            },
            onChanged: (value) {
              print(value);
              setState(() {
                currentText = value;
              });
            },
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            }, appContext: context, 
            // appContext: null,
          ),
            ElevatedButton(onPressed: () async {
              try{
                  // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationId.toString(),
     smsCode: snmController.text);

    // Sign the user in (or link) with the credential
    await FirebaseAuth.instance.signInWithCredential(credential);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successful Login')));
    Get.to(()=>HomeScreen());
              }
             on FirebaseException  catch(e){
                log(e.message.toString());
              }
            }, child: Text('Submit'))
          
          ],),
        ),
    );
  }
}