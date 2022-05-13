import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lucky_one/common/widget/drawer.dart';
import 'package:lucky_one/controller/LuckyNumberController.dart';
import 'package:lucky_one/ulti/AppTheme.dart';
import 'package:lucky_one/ulti/Randomize.dart';

class LuckyNumberApp extends StatelessWidget {
  //all function or variables of main.dart will be here

  final LuckyNumberController _luckyNumberController =
      Get.put(LuckyNumberController());
  TextEditingController _minInputController =
      new TextEditingController(text: '0');
  TextEditingController _maxInputController =
      new TextEditingController(text: '99');

  Widget _listResult(List<String> list, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var paddingSide =
        list.length < 4 ? (width / 3).toDouble() : (width / 6).toDouble();
    List<Widget> list1 = [];
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

          Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding: EdgeInsets.only(left: 20, right: 20, top: 4, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppTheme.white,
              ),
              width: width / 3,
              child: Center(
                child: Text(
                  list[i],
                  style: TextStyle(color: AppTheme.nearlyBlack, fontSize: 20),
                ),
              )));
    }
    return Column(
      children: list1,
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: AppTheme.nearlyBlack,
      // appBar: AppBar(
      //   title: Text('LuckyNumberApp'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding:
                EdgeInsets.only(left: width / 6, right: width / 6, bottom: 10),
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(9),
              ],
              controller: _minInputController,
              style: TextStyle(color: AppTheme.white),
              keyboardType: TextInputType.number,
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
                  labelText: "Min",
                  labelStyle:
                      TextStyle(color: AppTheme.dark_grey.withOpacity(0.8)),
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  )),
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(left: width / 6, right: width / 6, bottom: 10),
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(9),
              ],
              controller: _maxInputController,
              style: TextStyle(color: AppTheme.white),
              keyboardType: TextInputType.number,
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
                  labelText: "Max",
                  labelStyle:
                      TextStyle(color: AppTheme.dark_grey.withOpacity(0.8)),
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  )),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 0, bottom: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: AppTheme.nearlyWhite),
                onPressed: () async {
                  for (var i = 0;
                  i < _luckyNumberController.listResult.length;
                  i++) {
                    _luckyNumberController.listResult.value[i]='';
                  }
                  // await Future.delayed(Duration(milliseconds: 1000));
                  var min = int.parse(_minInputController.text);
                  var max = int.parse(_maxInputController.text);
                  if (min != null && max != null && min < max) {
                    for (var i = 0;
                        i < _luckyNumberController.listResult.length;
                        i++) {
                      await Future.delayed(Duration(milliseconds: 500));
                      _luckyNumberController.listResult.value[i] =
                          (min + Randomize().randomInRange(max - min))
                              .toString();
                      _luckyNumberController.listResult.refresh();

                    }

                    Get.snackbar("Result",
                        _luckyNumberController.listResult.value.join(' - '),
                        titleText: Text(
                          "Result",
                          style: TextStyle(color: AppTheme.white),
                        ),
                        messageText: Text(
                            _luckyNumberController.listResult.value.join(' - '),
                            style: TextStyle(color: AppTheme.white, fontSize: 18)),
                        snackPosition: SnackPosition.BOTTOM,
                        duration: Duration(seconds: 3));

                  } else {
                    Get.snackbar("Invalid", "Invalid max and min values.",
                        titleText: Text(
                          "Invalid",
                          style: TextStyle(color: AppTheme.white),
                        ),
                        messageText: Text("Invalid max and min values.",
                            style:
                                TextStyle(color: AppTheme.white, fontSize: 18)),
                        snackPosition: SnackPosition.BOTTOM,
                        duration: Duration(seconds: 3));
                  }
                },
                child: Icon(Icons.wifi_protected_setup, color: AppTheme.white)),
          ),
          Obx(() => Container(
              child: _listResult(
                  _luckyNumberController.listResult.value, context))),
          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child: Container(
          //       padding: EdgeInsets.only(left: 10),
          //       // color: Colors.red,
          //       width: (width - 100),
          //       height: 50,
          //       child: Obx(() =>  Container(),
          // )))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.nearlyWhite,
        onPressed: () {
          if (_luckyNumberController.rolling.value) {
            // print('rolling');
          } else {
            _luckyNumberController.addResult();
          }
        },
        child: Icon(
          Icons.add,
          color: AppTheme.white,
        ),
      ),
    );
  }
}
