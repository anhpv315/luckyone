import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lucky_one/common/widget/drawer.dart';
import 'package:lucky_one/controller/ArrowController.dart';
import 'package:lucky_one/ulti/AppTheme.dart';
import 'package:lucky_one/ulti/Randomize.dart';
import 'package:shake_event/shake_event.dart';

class ArrowApp extends StatefulWidget {
  ArrowApp({Key? key}) : super(key: key);

  // qrController.animationController = AnimationController(
  // duration: const Duration(milliseconds: 2000), vsync: this);

  @override
  _ArrowAppState createState() => _ArrowAppState();
}

class _ArrowAppState extends State<ArrowApp> with TickerProviderStateMixin {
  //all function or variables of main.dart will be here
  ArrowController _arrowController = Get.put(ArrowController());
  late AnimationController rotationController;
  late Animation<double> animation;
  var oldPosition;
  final int spinningTime = 5;

  @override
  void initState() {
    oldPosition = 0;
    rotationController = AnimationController(
        upperBound: 1,
        lowerBound: 0,
        duration: Duration(seconds: spinningTime), vsync: this);
   animation = CurvedAnimation(parent: rotationController, curve: Curves.easeOutCirc);

    super.initState();
  }

  @override
  void dispose() {
    rotationController.stop();
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: AppTheme.nearlyBlack,
      // appBar: AppBar(
      //   title: Text('ArrowApp'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              child: RotationTransition(
                  turns:
                      Tween(begin: _arrowController.oldDirection.value, end: _arrowController.direction.value).animate(animation),
                  child: Container(
                      height: width * 0.6,
                      child: Image.asset("assets/images/arrow.png"))),
              onTap: () {
                // oldPosition = _arrowController.direction.value;
                _arrowController.setRandomDirection();
                // print(_arrowController.oldDirection);
                setState(() {
                  rotationController.reset();
                  rotationController.forward();
                  Future.delayed(Duration(seconds: spinningTime), (){
                    _arrowController.oldDirection.value = _arrowController.direction.value;
                  });
                  // _arrowController.spinning.value =
                  // !_arrowController.spinning.value;
                });
              })
        ],
      )),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppTheme.nearlyWhite,
      //   onPressed: () {
      //     if (_arrowController.rolling.value) {
      //       // print('rolling');
      //     } else {
      //       _arrowController.addArrow();
      //     }
      //   },
      //   child: Icon(
      //     Icons.add,
      //     color: AppTheme.white,
      //   ),
      // ),
    );
  }
}
