import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:LuckyOne/common/widget/drawer.dart';
import 'package:LuckyOne/controller/WheelController.dart';
import 'package:LuckyOne/ulti/AppTheme.dart';
import 'package:LuckyOne/ulti/Audio.dart';
import 'package:LuckyOne/ulti/Randomize.dart';
import 'package:flutter/material.dart';

class WheelApp extends StatelessWidget {
  //all function or variables of main.dart will be here

  final WheelController _wheelController = Get.put(WheelController());
  TextEditingController _inputController = new TextEditingController();
  String rollMp3Path = 'audio/quaybanhxe.mp3';

  Widget _listWheelItems(
      List<String> list, BuildContext context, StreamController<int> selected) {
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
              child: Text(
                list[i].toString(),
                style: TextStyle(
                    color: AppTheme.nearlyWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              style: FortuneItemStyle(
                color:
                    AppTheme.nearlyBlack, // <-- custom circle slice fill color
                borderColor:
                    AppTheme.white, // <-- custom circle slice stroke color
                borderWidth: 10, // <-- custom circle slice stroke width
              ),
              onTap: () {
                if (_wheelController.rolling.value) {
                  return;
                }
                int random = Randomize().randomInRange(list.length);
                selected.add(random);
                Audio audio = new Audio(rollMp3Path);
                audio.playLocal();
                _wheelController.selected.value = random;
              }));
    }
    return Container(
      width: width * 0.8,
      child: FortuneWheel(
        animateFirst: false,
        duration: Duration(seconds: 10),
        selected: selected.stream,
        items: list1,
        onAnimationStart: () {
          _wheelController.rolling.value = true;
        },
        onAnimationEnd: () async {
          Get.snackbar("Result",
              _wheelController.listItems[_wheelController.selected.value],
              titleText: Text(
                "Result",
                style: TextStyle(color: AppTheme.white),
              ),
              messageText: Text(
                  _wheelController.listItems[_wheelController.selected.value],
                  style: TextStyle(color: AppTheme.white, fontSize: 18)),
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(seconds: 3));
          _wheelController.oldResult.value =
              _wheelController.listItems[_wheelController.selected.value];
          await Future.delayed(Duration(seconds: 2));
          _wheelController.rolling.value = false;
          if (_wheelController.decrease.value) {
            _wheelController.deleteItem(_wheelController.selected.value);
          }
        },
        indicators: <FortuneIndicator>[
          FortuneIndicator(
            alignment: Alignment
                .topCenter, // <-- changing the position of the indicator
            child: TriangleIndicator(
              color: AppTheme
                  .dark_grey, // <-- changing the color of the indicator
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    StreamController<int> selected = StreamController<int>();
    var width = MediaQuery.of(context).size.width;

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
          Container(
              child: Obx(
            () => Container(
              padding: EdgeInsets.only(top: 40),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: _wheelController.decrease.value
                      ? AppTheme.nearlyBlack
                      : AppTheme.nearlyWhite),
              onPressed: () {
                _wheelController.decrease.value =
                !_wheelController.decrease.value;
              },
              child: Icon(Icons.filter_list,
                  color: _wheelController.decrease.value
                      ? AppTheme.nearlyWhite
                      : AppTheme.white)),
      )
          )),
          Expanded(
            child: Obx(() =>
                _listWheelItems(_wheelController.listItems, context, selected)),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                // color: Colors.red,
                width: (width - 100),
                height: 50,
                child: Obx(() => Opacity(
                      opacity: 1,
                      child: Text(_wheelController.oldResult.value,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    )),
              ))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.nearlyWhite,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      // Positioned(
                      //   right: -40.0,
                      //   top: -40.0,
                      //   child: InkResponse(
                      //     onTap: () {
                      //       Navigator.of(context).pop();
                      //     },
                      //     child: CircleAvatar(
                      //       child: Icon(Icons.close),
                      //       backgroundColor: Colors.red,
                      //     ),
                      //   ),
                      // ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Column(
                                  children: [
                                    Text('Enter your list,', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                                    Text('separate by a comma ","!', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                                    SizedBox(height: 5,),
                                    Text('Example: "banana, strawberry, apple"', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),),
                                  ],
                                )
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _inputController,
                              decoration: InputDecoration(
                                  fillColor: AppTheme.dark_grey.withOpacity(0.1),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: AppTheme.dark_grey.withOpacity(0.8),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: AppTheme.dark_grey.withOpacity(0.3),
                                      width: 2.0,
                                    ),
                                  ),
                                  labelText: "List of options",
                                  labelStyle:
                                  TextStyle(color: AppTheme.dark_grey.withOpacity(0.8)),
                                  filled: true,
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                  )),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  child: Text("Close",
                                      style: TextStyle(color: AppTheme.white)),
                                  color: AppTheme.nearlyWhite,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  child: Text(
                                    "Done",
                                    style:
                                        TextStyle(color: AppTheme.nearlyWhite),
                                  ),
                                  color: AppTheme.nearlyBlack,
                                  onPressed: () {
                                    print(_inputController.text);
                                    var arr = _inputController.text.split(',');
                                    var invalidArr = [];
                                    if (arr.length > 1) {
                                      for (var i = 0; i < arr.length; i++) {
                                        arr[i] = arr[i].trim();
                                        if (arr[i].isEmpty) {
                                          invalidArr.add(i);
                                        }
                                      }
                                      if (invalidArr.isNotEmpty) {
                                        for (var i = 0;
                                            i < invalidArr.length;
                                            i++) {
                                          arr.removeAt(invalidArr[i]);
                                        }
                                      }
                                      if (arr.length > 1) {
                                        _wheelController.newList(arr);
                                        Navigator.of(context).pop();
                                        return;
                                      }
                                    }

                                    Get.snackbar("Invalid",
                                        "It must has at least 2 valid options.",
                                        titleText: Text(
                                          "Invalid",
                                          style:
                                              TextStyle(color: AppTheme.white),
                                        ),
                                        messageText: Text(
                                            "It must has at least 2 valid options.",
                                            style: TextStyle(
                                                color: AppTheme.white,
                                                fontSize: 18)),
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: Duration(seconds: 3));
                                    Navigator.of(context).pop();
                                    return;
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              });
        },
        child: Icon(
          Icons.playlist_add_outlined,
          color: AppTheme.white,
        ),
      ),
    );
  }
}
