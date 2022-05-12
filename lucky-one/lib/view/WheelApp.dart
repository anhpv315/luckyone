import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:lucky_one/common/widget/drawer.dart';
import 'package:lucky_one/controller/WheelController.dart';
import 'package:lucky_one/ulti/AppTheme.dart';

class WheelApp extends StatelessWidget {
  //all function or variables of main.dart will be here

  final WheelController _wheelController = Get.put(WheelController());


  Widget _listWheelItems(List<String> list, BuildContext context, StreamController<int> selected) {
    var width = MediaQuery.of(context).size.width;
    // var paddingSide =
    // list.length < 4 ? (width / 3).toDouble() : (width / 6).toDouble();
    List<FortuneItem> list1 = [];

    for (var i = 0; i < list.length; i++) {
      list1.add(
        // GestureDetector(
        //     child: Container(
        //       padding: EdgeInsets.all(40),
        //         width: 100,
        //         height: 100,
        //         decoration: BoxDecoration(
        //           // color: Colors.red,
        //           image: DecorationImage(
        //               image: AssetImage(
        //                   'images/dice' + list[i].toString() + '.png'),
        //               fit: BoxFit.cover),
        //         )),
        //     onTap: () {
        //       changeDiceFace();
        //     })

          FortuneItem(
            child: Text(list[i].toString(), style: TextStyle(color: AppTheme.nearlyBlack, fontSize: 16, fontWeight: FontWeight.w500),),
            style: FortuneItemStyle(
            color: i%2==0? AppTheme.nearlyWhite: AppTheme.notWhite, // <-- custom circle slice fill color
            borderColor: AppTheme.notWhite, // <-- custom circle slice stroke color
            borderWidth: 0, // <-- custom circle slice stroke width
          ),
          )
      );
    }
    return Container(
      width: width*0.8,
      child: FortuneWheel(
        selected: selected.stream,
        items: list1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    StreamController<int> selected = StreamController<int>();


    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: AppTheme.nearlyBlack,
      // appBar: AppBar(
      //   title: Text('DiceApp'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Obx(
              () => _listWheelItems(_wheelController.listItems, context, selected)


            ),
          ),

        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.white,
        onPressed: () {

        },
        child: Icon(
          Icons.add,
          color: AppTheme.nearlyBlack,
        ),
      ),

    );
  }
}
