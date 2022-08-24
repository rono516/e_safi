// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import '../widgets/exercise_title.dart';
import 'package:intl/intl.dart';
import 'package:wasteapp/pages/login.dart';
import 'package:wasteapp/pages/main_screen.dart';
import 'dart:core';

import 'package:wasteapp/values/height.dart';

class CollectionRegister extends StatefulWidget {
  const CollectionRegister({Key? key}) : super(key: key);

  @override
  State<CollectionRegister> createState() => _CollectionRegisterState();
}

class _CollectionRegisterState extends State<CollectionRegister> {
  TextEditingController apartmentController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[800],
      body: SafeArea(
        child: Column(children: [
          SizedBox(height: 25),

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
                                onPressed: () => Navigator.of(context)
                                    .pushReplacementNamed(MainScreen.routeName),
                                icon: Icon(Icons.home, color: Colors.green))),
                      ],
                    ),
                    SizedBox(height: 20),

                    Expanded(
                        child: Column(
                      children: <Widget>[
                        Form(
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              TextFormField(
                                  controller: nameController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: 'Full name',
                                    hintText: 'Full name',
                                    fillColor: Colors.white,
                                  )),
                              SizedBox(height: sizedboxheight),

                              TextFormField(
                                  controller: numberController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Your number',
                                    fillColor: Colors.white,
                                    labelText: 'Number',
                                  )),
                              SizedBox(height: sizedboxheight),

                              TextFormField(
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    labelText: 'Location',
                                    hintText: 'Area of collection'),
                              ),
                              SizedBox(height: sizedboxheight),

                              TextFormField(
                                  controller: apartmentController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: 'Enter apartment',
                                    labelText: 'Apartment',
                                    fillColor: Colors.white,
                                  )),
                              SizedBox(height: sizedboxheight),

                              TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'Number of houses',
                                    hintText: 'No of houses'),
                              ),
                              SizedBox(height: sizedboxheight),

                              TextFormField(
                                controller: dateController,
                                decoration: InputDecoration(
                                    labelText: 'Collection date',
                                    hintText: 'Enter collection date'),
                                onTap: () async {
                                  DateTime? date = DateTime(1900);
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());

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
                              ),

                              SizedBox(height: sizedboxheight),
                            ],
                          ),
                        ),
                      ],
                    )),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'SignUp for collection',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
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
