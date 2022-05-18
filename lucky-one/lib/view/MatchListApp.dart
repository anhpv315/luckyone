import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:LuckyOne/common/widget/drawer.dart';
import 'package:LuckyOne/controller/MatchListController.dart';
import 'package:LuckyOne/ulti/AppTheme.dart';
import 'package:LuckyOne/ulti/Audio.dart';
import 'package:LuckyOne/ulti/Randomize.dart';
import 'package:flutter/material.dart';

class MatchListApp extends StatelessWidget {
  //all function or variables of main.dart will be here

  final MatchListController _matchListController =
      Get.put(MatchListController());
  TextEditingController _inputLeftController = new TextEditingController();
  TextEditingController _inputRightController = new TextEditingController();
  String tingMp3Path = 'audio/raketqua.mp3';

  // Widget _listMatchListItems(
  //     List<String> list, BuildContext context, StreamController<int> selected) {
  //   var width = MediaQuery.of(context).size.width;
  //   List<FortuneItem> list1 = [];
  //
  //   for (var i = 0; i < list.length; i++) {
  //     list1.add(
  //         // GestureDetector(
  //         //     child: Container(
  //         //       padding: EdgeInsets.all(40),
  //         //         width: 100,
  //         //         height: 100,
  //         //         decoration: BoxDecoration(
  //         //           // color: Colors.red,
  //         //           image: DecorationImage(
  //         //               image: AssetImage(
  //         //                   'images/dice' + list[i].toString() + '.png'),
  //         //               fit: BoxFit.cover),
  //         //         )),
  //         //     onTap: () {
  //         //       changeDiceFace();
  //         //     })
  //
  //         FortuneItem(
  //             child: Text(
  //               list[i].toString(),
  //               style: TextStyle(
  //                   color: AppTheme.nearlyWhite,
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w500),
  //             ),
  //             style: FortuneItemStyle(
  //               color:
  //                   AppTheme.nearlyBlack, // <-- custom circle slice fill color
  //               borderColor:
  //                   AppTheme.white, // <-- custom circle slice stroke color
  //               borderWidth: 10, // <-- custom circle slice stroke width
  //             ),
  //             onTap: () {
  //               if (_wheelController.rolling.value) {
  //                 return;
  //               }
  //               int random = Randomize().randomInRange(list.length);
  //               selected.add(random);
  //               _wheelController.selected.value = random;
  //             }));
  //   }
  //   return Container(
  //     width: width * 0.8,
  //     child: FortuneMatchList(
  //       animateFirst: false,
  //       selected: selected.stream,
  //       items: list1,
  //       onAnimationStart: () {
  //         _wheelController.rolling.value = true;
  //       },
  //       onAnimationEnd: () async {
  //         Get.snackbar("Result",
  //             _wheelController.listItems[_wheelController.selected.value],
  //             titleText: Text(
  //               "Result",
  //               style: TextStyle(color: AppTheme.white),
  //             ),
  //             messageText: Text(
  //                 _wheelController.listItems[_wheelController.selected.value],
  //                 style: TextStyle(color: AppTheme.white, fontSize: 18)),
  //             snackPosition: SnackPosition.BOTTOM,
  //             duration: Duration(seconds: 3));
  //         _wheelController.oldResult.value =
  //             _wheelController.listItems[_wheelController.selected.value];
  //         await Future.delayed(Duration(seconds: 2));
  //         _wheelController.rolling.value = false;
  //         if (_wheelController.decrease.value) {
  //           _wheelController.deleteItem(_wheelController.selected.value);
  //         }
  //       },
  //       indicators: <FortuneIndicator>[
  //         FortuneIndicator(
  //           alignment: Alignment
  //               .topCenter, // <-- changing the position of the indicator
  //           child: TriangleIndicator(
  //             color: AppTheme
  //                 .nearlyWhite, // <-- changing the color of the indicator
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    StreamController<int> selected = StreamController<int>();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: AppTheme.nearlyBlack,
      // appBar: AppBar(
      //   title: Text('DiceApp'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      body: SingleChildScrollView(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                  width: width / 3,
                  height: height - 30,
                  child: Center(
                    child: Obx(() => ListView.builder(
                        shrinkWrap: true,
                        itemCount: _matchListController.leftList.length,
                        itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              color: AppTheme.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(6),
                                topRight: Radius.circular(6),
                              ),
                            ),
                            padding:
                                EdgeInsets.only(bottom: 10, top: 10, right: 10),
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                _matchListController.leftList[index],
                                style: TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )))),
                  )),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 80, bottom: 30, left: 30, right: 30),
                      width: width / 3,
                      child: SizedBox(
                          width: width / 3 - 50,
                          height: 68,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: AppTheme.nearlyWhite),
                              onPressed: () {
                                if (_matchListController.leftList.length < 2 ||
                                    _matchListController.rightList.length < 2) {
                                  return;
                                }
                                var left, right = [];
                                left = new List<String>.from(_matchListController.leftList.value);
                                right = new List<String>.from(_matchListController.rightList.value);
                                if (left.length > right.length) {
                                  for(var i = right.length; i < left.length; i++){
                                    right.add('');
                                  }
                                } else if(left.length < right.length) {
                                  for(var i = left.length; i < right.length; i++){
                                    left.add('');
                                  }                            }

                                _matchListController.listResult.length = 0;
                                for (var i = 0; i < left.length; i++) {
                                  var random = Randomize().randomInRange(right.length);
                                  var str = (left[i] == ''? '*': left[i]) + ' - '+ (right[random] ==''? '*': right[random]);
                                  right.removeAt(random);

                                  _matchListController.listResult.value.add(str);
                                }
                                Audio audio = new Audio(tingMp3Path);
                                audio.playLocal();

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.grey.withOpacity(0.4),

                                        content: Container(
                                          child:
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              SingleChildScrollView(
                                                child: Container(
                                                  // color: Colors.red,
                                                    height: height - 250,
                                                    width: width - 60,
                                                    child: Center(
                                                      child: Obx(() => ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: _matchListController.listResult.length,
                                                          itemBuilder: (context, index) => Container(
                                                              decoration: BoxDecoration(
                                                                  color: AppTheme.white,
                                                                  borderRadius: BorderRadius.all(Radius.circular(6))
                                                              ),
                                                              padding:
                                                              EdgeInsets.only(bottom: 10, top: 10, right: 10),
                                                              margin: EdgeInsets.only(top: 5, bottom: 5),
                                                              child: Align(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  _matchListController.listResult[index],
                                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                                                  overflow: TextOverflow.ellipsis,
                                                                ),
                                                              )))),
                                                    )),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: RaisedButton(
                                                      child: Icon(Icons.refresh, color: AppTheme.nearlyWhite,),
                                                      color: AppTheme.nearlyBlack,
                                                      onPressed: () {
                                                        if (_matchListController.leftList.length < 2 ||
                                                            _matchListController.rightList.length < 2) {
                                                          return;
                                                        }
                                                        var left, right = [];
                                                        left = new List<String>.from(_matchListController.leftList.value);
                                                        right = new List<String>.from(_matchListController.rightList.value);
                                                        if (left.length > right.length) {
                                                          for(var i = right.length; i < left.length; i++){
                                                            right.add('');
                                                          }
                                                        } else if(left.length < right.length) {
                                                          for(var i = left.length; i < right.length; i++){
                                                            left.add('');
                                                          }                            }

                                                        _matchListController.listResult.length = 0;
                                                        for (var i = 0; i < left.length; i++) {
                                                          var random = Randomize().randomInRange(right.length);
                                                          var str = (left[i] == ''? '*': left[i]) + ' - '+ (right[random] ==''? '*': right[random]);
                                                          right.removeAt(random);

                                                          _matchListController.listResult.value.add(str);
                                                        }
                                                        _matchListController.listResult.refresh();
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: RaisedButton(
                                                      child: Text("Close",
                                                          style: TextStyle(
                                                              color:
                                                              AppTheme.white)),
                                                      color: AppTheme.nearlyWhite,
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                  ),

                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Image.asset("assets/icons/merge.png")))),
                ],
              ),
              Container(
                  width: width / 3,
                  height: height - 30,
                  decoration: BoxDecoration(
                      // border: Border.all(color: AppTheme.white, width: 1),
                      ),
                  child: Center(
                    child: Obx(() => ListView.builder(
                        shrinkWrap: true,
                        itemCount: _matchListController.rightList.length,
                        itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(6),
                                  topLeft: Radius.circular(6),
                                ),
                              ),
                              padding: EdgeInsets.only(
                                  bottom: 10, top: 10, left: 10),
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                _matchListController.rightList[index],
                                style: TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))),
                  )),
            ],
          )
        ],
      ))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.nearlyWhite,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    child:
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
                            child: Column(
                              children: [
                                Text(
                                  'Enter your list,',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                Text(
                                  'separate by a comma ","!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Example: "banana, strawberry, apple"',
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14),
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _inputLeftController,
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
                                labelText: "Left list",
                                labelStyle: TextStyle(
                                    color: AppTheme.dark_grey.withOpacity(0.8)),
                                filled: true,
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _inputRightController,
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
                                labelText: "Right list",
                                labelStyle: TextStyle(
                                    color: AppTheme.dark_grey.withOpacity(0.8)),
                                filled: true,
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
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
                                  style: TextStyle(color: AppTheme.nearlyWhite),
                                ),
                                color: AppTheme.nearlyBlack,
                                onPressed: () {
                                  // print(_inputController.text);
                                  var _leftOK = false;
                                  var arr =
                                      _inputLeftController.text.split(',');
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
                                      _matchListController.newLeftList(arr);
                                      _matchListController.leftList.refresh();
                                      _leftOK = true;
                                    }
                                  }

                                  var _rightOK = false;
                                  arr = _inputRightController.text.split(',');
                                  invalidArr = [];
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
                                      _matchListController.newRightList(arr);
                                      _matchListController.rightList.refresh();
                                      _rightOK = true;
                                    }
                                  }

                                  if (!_leftOK || !_rightOK) {
                                    Get.snackbar("Invalid",
                                        "It must has at least 2 valid options.",
                                        titleText: Text(
                                          "Invalid",
                                          style:
                                              TextStyle(color: AppTheme.white),
                                        ),
                                        messageText: Text(
                                            "Each list must has at least 2 valid options.",
                                            style: TextStyle(
                                                color: AppTheme.white,
                                                fontSize: 18)),
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: Duration(seconds: 3));
                                  }
                                  Navigator.of(context).pop();
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(
          Icons.list,
          color: AppTheme.white,
        ),
      ),
    );
  }
}
