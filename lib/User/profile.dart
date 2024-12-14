import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:revaconnect/User/homepage.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  String? _firstName;
  String? _userName;
  String? _srn;
  String? _branch;
  String? _mailId;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double padding = screenWidth < 400 ? 8.0 : 16.0; // Adjust padding based on screen width
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Profile",
        style: TextStyle(fontSize: 20.0,
        fontWeight: FontWeight.bold,
        ),),
      ),
      body: Padding(
        padding:  EdgeInsets.all(padding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _getImage,
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : AssetImage('assets/plus2.png'),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text(
                  "Profile Photo",
                  style: TextStyle(fontSize: 15.0,),
                ),
              ),
              
              SizedBox(height: 10.0),

              Padding(
                padding: EdgeInsets.all(padding),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color:  Colors.blue,
                        width: 2.0
                        ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blue, // Color when focused
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey, // Color when enabled
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.red, // Color when there is an error
                        width: 2.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.red, // Color when focused with error
                        width: 2.0,
                      ),
                    ),
                    labelText: "First Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your first name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _firstName = value;
                  }, ),
              ),
              Padding(
                padding:  EdgeInsets.all(padding),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0
                        ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blue, // Color when focused
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey, // Color when enabled
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.red, // Color when there is an error
                        width: 2.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.red, // Color when focused with error
                        width: 2.0,
                      ),
                    ),
                    labelText: "Lastname",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Last name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _userName = value;
                  },
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(padding),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0
                        ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blue, // Color when focused
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey, // Color when enabled
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.red, // Color when there is an error
                        width: 2.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.red, // Color when focused with error
                        width: 2.0,
                      ),
                    ),
                    labelText: "SRN",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your SRN";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _srn = value;
                  },
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(padding),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0
                        ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blue, // Color when focused
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey, // Color when enabled
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.red, // Color when there is an error
                        width: 2.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.red, // Color when focused with error
                        width: 2.0,
                      ),
                    ),
                    labelText: "Branch",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your branch";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _branch = value;
                  },
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(padding),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0
                        ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blue, // Color when focused
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey, // Color when enabled
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.red, // Color when there is an error
                        width: 2.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.red, // Color when focused with error
                        width: 2.0,
                      ),
                    ),
                    labelText: "Mail ID",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your mail ID";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _mailId = value;
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   _formKey.currentState!.save();
                    //   // Handle the submission of the profile data
                    // }
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  child: Text("Submit"),        
                  style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Colors.red, 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}