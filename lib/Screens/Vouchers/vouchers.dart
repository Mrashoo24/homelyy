import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homelyy/component/api.dart';
import 'package:homelyy/component/constants.dart';
import 'package:homelyy/component/models.dart';

class Vouchers extends StatefulWidget {
  final String ref;
  const Vouchers({Key key, this.ref}) : super(key: key);

  @override
  _VouchersState createState() => _VouchersState();
}

class _VouchersState extends State<Vouchers> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AllApi().getUser(widget.ref),
      builder: (context, snapshot) {

        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }

        UserModel users = UserModel().fromJson(jsonDecode(snapshot.requireData));

        print("getting user ${users.name}");


        return ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text("Available Wallet Balance =${users.wallet}"),
                  Container(
                    height: 100,
                    width: 200,
                    margin: EdgeInsets.all(10),
                    child: Image.asset("assets/giftBanner.png",fit: BoxFit.fill,),
                  ),
                  ElevatedButton(onPressed: (){


                  }, child: Text("Buy Now"),style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kdarkgreen)
                  ),)
                ],
              ),
            );
          }
        );
      }
    );
  }
}