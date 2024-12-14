import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:revaconnect/common/login.dart';

class Myaccount extends StatelessWidget {

  signout() async {
  await FirebaseAuth.instance.signOut();
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile.png'),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                "randomxyz@gmail.com",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Personal Info",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("Placeholder for personal info"),
            ),
            SizedBox(height: 24),
            Text(
              "Settings",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            buildSettingButton("Blahhh"),
            SizedBox(height: 8),
            buildSettingButton("Blahhh"),
            SizedBox(height: 8),
            buildSettingButton("Blahhh"),
            SizedBox(height: 24),
            ElevatedButton(
                  onPressed: () {
                    // Handle Google login
                    signout();
                    //this push it back to login page
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.black                      ),
                      SizedBox(width: 20.0),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingButton(String text, {IconData? icon}) {
    return ElevatedButton.icon(
      onPressed: () {}, icon: icon != null ? Icon(icon) : SizedBox.shrink(),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        textStyle: TextStyle(fontSize: 16),
      ),
    );
  }

}