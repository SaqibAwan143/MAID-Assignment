//import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DishAddForm extends StatefulWidget {
  @override
  _DishAddFormState createState() => _DishAddFormState();
}

class _DishAddFormState extends State<DishAddForm> {
  TextEditingController DishID = new TextEditingController();
  TextEditingController DishName = new TextEditingController();
  TextEditingController DishPrice = new TextEditingController();
  TextEditingController RestaurantID = new TextEditingController();
  //int IsAvailable = 0;  String colorGroupValue = '';
  String? valueChoose;
  List listItem = ["starter", "main course", "desserts"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff409439),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Center(child: Text("ADD DISH")),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: TextField(
                //controller: DishID,
                style: TextStyle(
                  color: Colors.black,
                ),

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Dish ID*",
                ),
                onChanged: (value) {},
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Text(
                  "generated automatically",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            Card(
              child: TextField(
                controller: DishName,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Dish name",
                ),
                onChanged: (value) {},
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),
            Card(
              child: TextField(
                controller: DishPrice,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Dish Price",
                ),
                onChanged: (value) {},
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 40.0,
                ),
                Text("Available "),
                Radio(value: 'Available', groupValue: 1, onChanged: (val) {}),
                SizedBox(
                  width: 50.0,
                ),
                Text("Not Available"),
                Radio(
                    value: 'Not Available',
                    groupValue: 1,
                    onChanged: (val) {
                      // colorGroupValue = val;
                      // IsAvailable = 0;
                      // setState(() {

                      // });
                    }),
              ],
            ),
            Card(
              child: DropdownButton(
                hint: Text("Select Dish Type"),
                dropdownColor: Colors.white,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(color: Colors.black, fontSize: 15),
                value: valueChoose,
                onChanged: (newValue) {
                  setState(() {
                    valueChoose = newValue as String?;
                  });
                },
                items: listItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),
            Card(
              child: TextField(
                controller: RestaurantID,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Restaurant ID",
                ),
                onChanged: (value) {},
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/food.png'),
                      fit: BoxFit.fitHeight)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance.collection('Dish').add({
            'DishID': DishID.text,
            'DishName': DishName.text,
            'DishPrice': DishPrice.text,
            'IsAvailable': 1,
            'DishType': valueChoose,
            'RestaurantID': RestaurantID.text,
          });
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
  // void handleDishAdd(BuildContext context) async {
  //   const int isadmin = 1;
  //   RestServices restServices = new RestServices();
  //   ApiResponse _apiResponse = await restServices.addDish(
  //     // DishID.text,
  //     DishName.text,
  //     int.parse(DishPrice.text),
  //     valueChoose,
  //     RestaurantID.text,
  //   );

  //   if ((_apiResponse.ApiError as ApiError) == null) {
  //     Navigator.pushNamedAndRemoveUntil(
  //       context,
  //       '/loadDash',
  //       ModalRoute.withName('/loadDash'),
  //       arguments: isadmin,
  //     );
  //   } else {
  //     msgToast("DishAdd Failed!");
  //   }
  // }

