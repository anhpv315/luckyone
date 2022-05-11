import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lucky_one/controller/DiceController.dart';
import 'package:lucky_one/ulti/Randomize.dart';
import 'package:shake_event/shake_event.dart';
class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);
  //if data comes from another page then all the variables, names and function will be here
  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> with ShakeHandler {
  //all function or variables of main.dart will be here

  final DiceController _diceController = Get.put(DiceController());

  int leftDiceNumber = 1;
  int rightDiceNumber = 6;

  @override
  void initState() {
    startListeningShake(20); //20 is the default threshold value for the shake event
    super.initState();
  }

  @override
  shakeEventListener() {
    changeDiceFace();
    return super.shakeEventListener();
  }

  @override
  void dispose() {
    resetShakeListeners();
    super.dispose();
  }


  Future<void> changeDiceFace() async {
    //to update things we use setstate()
    // setState(() {
    //   leftDiceNumber = Random().nextInt(6)+1;
    //   rightDiceNumber = Random().nextInt(6)+1;
    // });
    for(var s = 1; s < 69; s++){
      for(var i = 0; i < _diceController.listDiceFaces.length; i++){
        _diceController.listDiceFaces[i] = Randomize().randomDice();
      }
      await Future.delayed(Duration(milliseconds: 50));
    }
    // print(Randomize().randomDice());

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
            changeDiceFace();
          },
          child: Image(
            image: AssetImage('images/dice' + list[i].toString() + '.png'),
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
    _diceController.addDice();

    return Scaffold(
      backgroundColor: Colors.indigoAccent,
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
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _diceController.addDice();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
