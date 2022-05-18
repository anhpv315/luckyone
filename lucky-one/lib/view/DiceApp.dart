import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lucky_one/common/widget/drawer.dart';
import 'package:lucky_one/controller/DiceController.dart';
import 'package:lucky_one/ulti/AppTheme.dart';
import 'package:lucky_one/ulti/Audio.dart';
import 'package:lucky_one/ulti/Randomize.dart';
import 'package:shake_event/shake_event.dart';

class DiceApp extends StatelessWidget {
  //all function or variables of main.dart will be here

  final DiceController _diceController = Get.put(DiceController());
  String diceMp3Path = 'audio/xucxac.mp3';
  Future<void> changeDiceFace() async {
    var listResult = _diceController.listResult.value;
    _diceController.rolling.value = true;
    Audio audio = new Audio(diceMp3Path);
    audio.playLocal();
    //to update things we use setstate()
    // setState(() {
    //   leftDiceNumber = Random().nextInt(6)+1;
    //   rightDiceNumber = Random().nextInt(6)+1;
    // });
    var sum = 0;
    for (var s = 0; s < 28; s++) {
      for (var i = 0; i < _diceController.listDiceFaces.length; i++) {
        _diceController.listDiceFaces[i] = Randomize().randomDice();
        if (s == 27) {
          sum += _diceController.listDiceFaces[i];
        }
      }
      await Future.delayed(Duration(milliseconds: 50));
    }
    listResult.add(sum);
    Get.snackbar(
        "Result",
        sum.toString(),
        titleText: Text(
          "Result",
          style: TextStyle(color: AppTheme.white),
        ),
        messageText: Text(
            sum.toString(),
            style: TextStyle(color: AppTheme.white, fontSize: 20)),
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3));
    // print(sum);
    if (listResult.length > 6) {
      listResult.removeAt(0);
    }
    // print(listResult);
    audio.stopAudio();
    _diceController.listResult.value = listResult;
    _diceController.listResult.refresh();

    _diceController.rolling.value = false;


  }

  Widget _preResults(List<int> listResult) {
    List<Widget> list1 = [];
    for (var i = 0; i < listResult.length; i++) {
      list1.add(Container(
        color: i == listResult.length-1? AppTheme.white.withOpacity(0.2): AppTheme.nearlyBlack,
        padding: EdgeInsets.all(10),
        child: Text(listResult[i].toString(),
            style: TextStyle(
                color: AppTheme.white,
                fontSize: 18,
                fontWeight: FontWeight.w600)),
      ));
    }

    return Row(children: list1);
  }

  Widget _listDiceFaceWidgets(List<int> list, BuildContext context) {
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

          SizedBox(
        child: FlatButton(
          // color: Colors.yellow,
          height: 100,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            if (_diceController.rolling.value) {
              // print('rolling');
            } else {
              changeDiceFace();
            }
          },
          child: Image(
            image: AssetImage('assets/images/dice' + list[i].toString() + '.png'),
            width: 100,
            height: 100,
          ),
        ),
      ));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.only(left: paddingSide, right: paddingSide),
            child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: list.length < 4 ? 1 : 2,
                ),
                shrinkWrap: true,
                children: list1))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _diceController.listDiceFaces.length = 0;
    _diceController.addDice();
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
          Expanded(
            child: Obx(
              () =>
                  _listDiceFaceWidgets(_diceController.listDiceFaces, context),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                padding: EdgeInsets.only(left: 10),
                // color: Colors.red,
                width: (width - 100),
                height: 50,
                child: Obx(() => _preResults(_diceController.listResult))),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.nearlyWhite,
        onPressed: () {
          if (_diceController.rolling.value) {
            // print('rolling');
          } else {
            _diceController.addDice();
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
