// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteapp/collectors/collector_home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import '../values/height.dart';

class CollectorInitiate extends StatefulWidget {
  const CollectorInitiate({Key? key}) : super(key: key);
  static const routeName = '/collector-initiate';

  @override
  State<CollectorInitiate> createState() => _CollectorInitiateState();
}

class _CollectorInitiateState extends State<CollectorInitiate> {
  final _numberFocusNode = FocusNode();
  final _locationFocusNode = FocusNode();
  
  TextEditingController dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  late String userId = user!.uid;
  late String? userEmail = user!.email;
  final String role = 'Collector';

  
  var _userData = UserModel(
   
      fullName: null,
      number: '',
      location: '',
      apartment: '',
      houses: null,
      date: null);

  @override
  void dispose() {
    _numberFocusNode.dispose();
    _locationFocusNode.dispose();
   

    super.dispose();
  }

  void _saveForm() async {
    _formKey.currentState!.save();

  

    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;
      UserModel userModel = UserModel();
      userModel.email = user!.email;
      userModel.wrool = role;
      userModel.uid = user.uid;
      userModel.fullName = _userData.fullName;
      userModel.number = _userData.number;
      userModel.location = _userData.location;
    
      userModel.date = _userData.date;

      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set(userModel.toMap(), SetOptions(merge: true))
          .then((value) => Navigator.of(context).pop());
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[800],
      body: SafeArea(
        child: Column(children: [
      
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),
              color: Colors.grey[300],
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'Collector start collection',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Container(
                            color: Colors.grey[300],
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CollectorBottomNavigationPage()));
                                },
                                icon: Icon(Icons.home, color: Colors.green))),
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_numberFocusNode);
                                },
                                decoration: InputDecoration(
                                  labelText: 'Full name',
                                  hintText: 'Full name',
                                  fillColor: Colors.white,
                                  errorStyle: TextStyle(fontSize: 15),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _userData = UserModel(
                                    fullName: value,
                                    number: _userData.number,
                                    location: _userData.location,
                                    apartment: _userData.apartment,
                                    houses: _userData.houses,
                                    date: _userData.date,
                                  );
                                },
                              ),
                              SizedBox(height: sizedboxheight),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_locationFocusNode);
                                },
                                keyboardType: TextInputType.number,
                                focusNode: _numberFocusNode,
                                decoration: InputDecoration(
                                  hintText: 'Your number',
                                  fillColor: Colors.white,
                                  labelText: 'Number',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your number';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _userData = UserModel(
                                    fullName: _userData.fullName,
                                    number: value,
                                    location: _userData.location,
                                    apartment: _userData.apartment,
                                    houses: _userData.houses,
                                    date: _userData.date,
                                  );
                                },
                              ),
                              SizedBox(height: sizedboxheight),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                         
                                focusNode: _locationFocusNode,
                                decoration: InputDecoration(
                                    labelText: 'Routes',
                                    hintText: 'Routes of collection'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your routes';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _userData = UserModel(
                                    fullName: _userData.fullName,
                                    number: _userData.number,
                                    location: value,
                                    apartment: null,
                                    houses: null,
                                    date: _userData.date,
                                  );
                                },
                              ),
                    
                              SizedBox(height: sizedboxheight),
                              TextFormField(
                                controller: dateController,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                    labelText: 'Collection date',
                                    hintText: 'Enter collection date'),
                                onTap: () async {
                                  DateTime? date = DateTime(1900);
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());

                                  date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2024),
                                  ).then((selectedDate) {
                                    if (selectedDate != null) {
                                      dateController.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(selectedDate);
                                    }
                                    // ignore: null_check_always_fails
                                    return null!;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter date';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _userData = UserModel(
                                    fullName: _userData.fullName,
                                    number: _userData.number,
                                    location: _userData.location,
                                    apartment: _userData.apartment,
                                    houses: _userData.houses,
                                    date: DateTime.parse(value!),
                                  );
                                },
                              ),
                              SizedBox(height: sizedboxheight),
                            ],
                          ),
                        ),
                      ],
                    )),
                    FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: _saveForm,
                      child: Icon(
                        Icons.app_registration,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
