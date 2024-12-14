import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:revaconnect/User/profile.dart';
import 'package:revaconnect/common/wrapper.dart';

class Optpage extends StatefulWidget {
  final String vid;
  final String phoneNumber;
  const Optpage({super.key, required this.vid , required this.phoneNumber});

  @override
  State<Optpage> createState() => _OptpageState();
}

class _OptpageState extends State<Optpage> {

  var code = '';

  signIn() async {


    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.vid, 
      smsCode: code,
      );
      try{
        await FirebaseAuth.instance.signInWithCredential(credential);
        Get.to(() => Wrapper());
  }on  FirebaseAuthException catch(e){
    Get.snackbar('Error occured', e.code);
  }catch(e){
    Get.snackbar('Error occured', e.toString());
  }
    
  }
      
      


Widget button() {
  return Center(
    child: ElevatedButton(
      onPressed: (){
        signIn();
        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),);
      }, 
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.all(6),
      ), child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child:Text("verify and proceed",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,

        ),),),
      )
  );
}

  Widget textcode() {
    return Center(
      child: Padding(padding: 
      const EdgeInsets.all(6),
      child: Pinput(
        length: 6,
        onChanged: (Value){
          setState(() {
            code = Value;
          },
          );
        },
      ),
      ),
    );
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Text("Otp verificatin",
              style: TextStyle(fontSize: 20),
              ), 
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 6),
              child: Text("Enter the otp sent to your number",
              textAlign: TextAlign.center,),
              ),
              SizedBox(height: 20),
              textcode(),
              SizedBox(height: 80),
              button(),
          ],
        ),
      ),
    );
  }






}