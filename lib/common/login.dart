import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revaconnect/common/optpage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyWidgetState();
}


 TextEditingController phoneNumber = TextEditingController();
late Country selectedcountry;
class _MyWidgetState extends State<Login> {
  
   @override
  void initState() {
    super.initState();
    phoneNumber = TextEditingController();
  }
  @override
void dispose() {
  //phoneNumber.dispose();
  super.dispose();
}
  
  Country selectedcountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "e164Key");



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  
      Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo2.png',
                height: 275), // Replace with your  logo path
            SizedBox(height: 0),
            Text(
              "REVA's #1 Networking App",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '"Feel the Vibe, Meet the People"',
              style: TextStyle(fontSize: 12.0),
            ),
            SizedBox(height: 40),
            Text(
              "----------Login or sign up----------",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5.0),
            TextFormField(
              cursorColor: Colors.red,
              controller: phoneNumber,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Enter phone number",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.grey.shade600,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: const CountryListThemeData(
                            bottomSheetHeight: 400,
                          ),
                          onSelect: (value) {
                            setState(() {
                              selectedcountry = value;
                            });
                          });
                    },
                    child: Text(
                      "${selectedcountry.flagEmoji} + ${selectedcountry.phoneCode}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: MaterialButton(
                onPressed: () {
                  // Handle login/signup logic
                  sendcode();
                },
                minWidth: double.infinity,
                color: Colors.red,
                elevation: 2,
                
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Colors.red, // Set the background color to red
                //   foregroundColor: Colors.white, // Set the text color to white
                //   padding: EdgeInsets.symmetric(
                //       horizontal: 100.0,
                //       vertical:
                //           15.0), // Increase the padding to make the button bigger
                // ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text('or'),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Google login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.golf_course,
                      ),
                      SizedBox(width: 20.0),
                    ],
                  ),
                ),
                // SizedBox(width: 20.0),
                // ElevatedButton(
                //   onPressed: () {
                //     // Handle Facebook login
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.white,
                //     foregroundColor: Colors.black,
                //     padding: EdgeInsets.symmetric(horizontal: 30.0),
                //   ),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.facebook,
                //       ),
                //       SizedBox(width: 10.0),

                //     ],
                //   ),
                // ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle Facebook login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.facebook,
                      ),
                      SizedBox(width: 10.0),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 13),
            Text(
              " By continuing , you agree to our Content Policy Terms of Service Privacy Policy ",
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
    );
  }
}



sendcode() async {
  try{
    String phoneNumberText = phoneNumber.text.trim();
    if (phoneNumberText.isEmpty ||
        !RegExp(r'^[6789]\d{9}$').hasMatch(phoneNumberText)) {
      Get.snackbar('Error', 'Invalid phone number');
      return;
    }
    String fullPhoneNumber = '+91' + phoneNumber.text;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: fullPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print('Error: ${e.code} ${e.message}');
        Get.snackbar('Error occured', e.code);
      },
     codeSent: (String vid, int? forceResendingToken) {
         Get.to(Optpage(vid: vid, phoneNumber: fullPhoneNumber,),);
     }, 
      codeAutoRetrievalTimeout: (String vid) {  },
    );
  }on FirebaseAuthException catch(e){
    Get.snackbar('Error occured', e.code);
  }catch(e){
    Get.snackbar('Error occured', e.toString());
  }
}