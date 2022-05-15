import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lucky_one/common/widget/drawer.dart';
import 'package:lucky_one/controller/ThreeCardsController.dart';
import 'package:lucky_one/ulti/AppTheme.dart';
import 'package:lucky_one/ulti/Randomize.dart';
import 'package:shake_event/shake_event.dart';

class ThreeCardsApp extends StatelessWidget {
  //all function or variables of main.dart will be here

  final ThreeCardsController _threeCardsController =
      Get.put(ThreeCardsController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: AppTheme.nearlyBlack,
      // appBar: AppBar(
      //   title: Text('ThreeCardsApp'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      body: Center(
              child:
              Container(
                height: (height - 25),
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // color: Colors.yellow,
                        width: width,
                        height: (height - 25) * 0.3,
                        child: Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0;
                            i <
                                _threeCardsController
                                    .listTopResult.length;
                            i++)
                              Flexible(
                                  flex: 2,
                                  child:
                                  RotationTransition(
                                    turns: new AlwaysStoppedAnimation(180 / 360),
                                    child: Container(
                                        width: width/3 - 4,
                                        padding: EdgeInsets.only(left: 2, right: 2),
                                        child: Image.asset(
                                            "assets/images/cards/"+_threeCardsController.listTopResult.value[i]+".png")
                                    ),
                                  )


                              )
                          ],
                        ))),
                    Container(
                      // color: Colors.blue,
                        width: width,
                        height: (height - 25) * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  // color: Colors.yellow,
                                  height: (height - 25) * 0.4,
                                  width: 220 + 52 * 0.2,
                                ),
                                for (var i = 0; i < 52; i++)
                                  Positioned(
                                    top: 0,
                                    bottom: i * 0.8,
                                    right: i * 0.2,
                                    child: i == 51
                                        ? GestureDetector(
                                        child: Image.asset(
                                          'assets/images/cards/back3.png',
                                          width: 220,
                                        ),
                                        onTap: () async {
                                          if(_threeCardsController.drawing.value){
                                            return;
                                          }
                                          _threeCardsController.drawing.value = true;
                                          _threeCardsController.refreshCards();
                                          await Future.delayed(
                                              Duration(milliseconds: 200));
                                          // print('chia bai');
                                          for (var j = 0; j < 3; j++) {
                                            var pos1 = Randomize().randomInRange(
                                                _threeCardsController.cards.length);
                                            _threeCardsController.listTopResult.value
                                                .add(_threeCardsController
                                                .cards.value[pos1]);
                                            _threeCardsController.cards
                                                .removeAt(pos1);
                                            _threeCardsController.listTopResult.refresh();
                                            await Future.delayed(
                                                Duration(milliseconds: 1000));

                                            var pos2 = Randomize().randomInRange(
                                                _threeCardsController.cards.length);
                                            _threeCardsController
                                                .listBottomResult.value
                                                .add(_threeCardsController
                                                .cards.value[pos2]);
                                            _threeCardsController.cards
                                                .removeAt(pos2);
                                            _threeCardsController.listBottomResult.refresh();
                                            await Future.delayed(
                                                Duration(milliseconds: 1000));
                                            _threeCardsController.drawing.value = false;

                                          }
                                        })
                                        : Image.asset(
                                      'assets/images/cards/back3.png',
                                      width: 220,
                                    ),
                                  )
                              ],
                            )
                          ],
                        )),
                    Container(
                      // color: Colors.yellow,
                        width: width,
                        height: (height - 25) * 0.3,
                        child: Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            for (var i = 0;
                            i <
                                _threeCardsController
                                    .listBottomResult.length;
                            i++)
                              Flexible(
                                  flex: 2,
                                  child:
                                  Container(
                                    width: width/3 - 4,
                                      padding: EdgeInsets.only(left: 2, right: 2),
                                      child: Image.asset(
                                          "assets/images/cards/"+_threeCardsController.listBottomResult.value[i]+".png")
                                  )

                              )
                          ],
                        ))),
                  ],
                ),
              )

              ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppTheme.nearlyWhite,
      //   onPressed: () {
      //     // if (_threeCardsController.rolling.value) {
      //     //   // print('rolling');
      //     // } else {
      //     //   _threeCardsController.addThreeCards();
      //     // }
      //   },
      //   child: Icon(
      //     Icons.add,
      //     color: AppTheme.white,
      //   ),
      // ),
    );
  }
}
