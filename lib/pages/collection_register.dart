// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import '../widgets/exercise_title.dart';
import 'package:intl/intl.dart';
import 'package:wasteapp/models/user_model.dart';
import 'package:wasteapp/pages/home_page.dart';
import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:wasteapp/values/height.dart';

class CollectionRegister extends StatefulWidget {
  const CollectionRegister({Key? key}) : super(key: key);

  @override
  State<CollectionRegister> createState() => _CollectionRegisterState();
}

class _CollectionRegisterState extends State<CollectionRegister> {
  final _numberFocusNode = FocusNode();
  final _locationFocusNode = FocusNode();
  final _apartmentFocusNode = FocusNode();
  final _housesFocusNode = FocusNode();
  //final _dateFocusNode = FocusNode();
  TextEditingController dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // final user = FirebaseAuth.instance.currentUser;
  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  late String userId = user!.uid;
  late String? userEmail = user!.email;
  final String role = 'Tenant';

  // var _userData = userModel.email = user.email

  //final _userId = user!.uid;
  var _userData = UserModel(
      // uid: userId,
      // email: user!.email,
      // wrool: wrool,
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
    _apartmentFocusNode.dispose();
    _housesFocusNode.dispose();
    //_dateFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() async {
    // final isValid = _formKey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    _formKey.currentState!.save();
    // print('fullName ${_userData.fullName}');
    // print('number ${_userData.number}');
    // print('location ${_userData.location}');
    // print('apartment ${_userData.apartment}');
    // print('houses ${_userData.houses}');
    // print('Date ' +
    //     DateFormat.yMMMMd('en_US')
    //         .format(DateTime.parse(_userData.date.toString())));

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
      userModel.apartment = _userData.apartment;
      userModel.houses = _userData.houses;
      userModel.date = _userData.date;
      // userModel.wrool = rool;
      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set(userModel.toMap(), SetOptions(merge: true))
          .then((value) => Navigator.of(context).pop());
      //, SetOptions(merge: true)
      // .then((value) => MaterialPageRoute(
      //     builder: ((context) => BottomNavigationPage())));
    } catch (error) {
      print('Error: $error');
    }

    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[800],
      body: SafeArea(
        child: Column(children: [
          //  SizedBox(height: 25),

          //white area
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
                          'SignUp for waste collection',
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
                                              BottomNavigationPage()));
                                },
                                // => Navigator.of(context)
                                //     .pushReplacementNamed(HomePage.routeName),
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
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_apartmentFocusNode);
                                },
                                focusNode: _locationFocusNode,
                                decoration: InputDecoration(
                                    labelText: 'Location',
                                    hintText: 'Area of collection'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter location';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _userData = UserModel(
                                    fullName: _userData.fullName,
                                    number: _userData.number,
                                    location: value,
                                    apartment: _userData.apartment,
                                    houses: _userData.houses,
                                    date: _userData.date,
                                  );
                                },
                              ),
                              SizedBox(height: sizedboxheight),
                              TextFormField(
                                //  controller: apartmentController,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_housesFocusNode);
                                },
                                focusNode: _apartmentFocusNode,
                                decoration: InputDecoration(
                                  hintText: 'Enter apartment',
                                  labelText: 'Apartment',
                                  fillColor: Colors.white,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter your apartment';
                                  }
                                  if (int.parse(value) <= 0) {
                                    return 'Enter a number greater than zero';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _userData = UserModel(
                                    fullName: _userData.fullName,
                                    number: _userData.number,
                                    location: _userData.location,
                                    apartment: value.toString(),
                                    houses: _userData.houses,
                                    date: _userData.date,
                                  );
                                },
                              ),
                              SizedBox(height: sizedboxheight),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                focusNode: _housesFocusNode,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'Number of houses',
                                    hintText: 'No of houses'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter number of houses';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _userData = UserModel(
                                    fullName: _userData.fullName,
                                    number: _userData.number,
                                    location: _userData.location,
                                    apartment: _userData.apartment,
                                    houses: int.parse(value!),
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
                      onPressed: _saveForm,
                      child: Icon(Icons.app_registration),
                    )
                    // Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: Colors.green),
                    //   width: double.infinity,
                    //   child: TextButton(
                    //     onPressed: () => _saveForm,

                    //     //     () {
                    //     //   if (_formKey.currentState!.validate()) {
                    //     //     //validate the form and show a dummy message || Registering you!
                    //     //     ScaffoldMessenger.of(context)
                    //     //         .showSnackBar(SnackBar(content: Text(userId)));
                    //     //   }
                    //     //   print(userId);
                    //     // },
                    //     child: Text(
                    //       'SignUp for collection',
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //   ),
                    // ),
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
