import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lucky_one/common/widget/drawer.dart';
import 'package:lucky_one/controller/DrawCardController.dart';
import 'package:lucky_one/ulti/AppTheme.dart';
import 'package:lucky_one/ulti/Audio.dart';
import 'package:lucky_one/ulti/Randomize.dart';
import 'package:shake_event/shake_event.dart';

class DrawCardApp extends StatelessWidget {
  //all function or variables of main.dart will be here

  final DrawCardController _drawCardController = Get.put(DrawCardController());
  String rutBaiMp3Path = 'audio/chia1labai.mp3';

  Widget _listResultCardsWidgets(String selected, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<Widget> list1 = [];

    list1.add(Container(
      padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
      // color: Colors.yellow,
      width: width * 0.5 - 10,
      decoration: BoxDecoration(
        // color: AppTheme.grey.withOpacity(0.6),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      // height: 220,
      child: selected != ''
          ? Image.asset('assets/images/cards/' + selected + '.png',
              fit: BoxFit.cover)
          : Opacity(
              opacity: 0,
              child: Image.asset('assets/images/cards/back.png',
                  fit: BoxFit.cover)),
      // Image.asset('assets/images/cards/a-c.png',fit: BoxFit.cover),
    ));

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          // color: Colors.yellow,
          height: height - 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 60),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppTheme.nearlyWhite,
                    ),
                    onPressed: () {

                      _drawCardController.refreshCards();
                    },
                    child: Icon(Icons.refresh, color: AppTheme.white)),
              ),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  width: width * 0.5,
                  child: Row(children: list1)),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
              // padding: EdgeInsets.only(left: 10),
              // color: Colors.red,
              width: width * 0.5,
              height: 60,
              child:
    _drawCardController.listResult.isNotEmpty? Obx(() => _preResults(_drawCardController.listResult.value)): Container()),
        )
      ],
    );
  }

  Widget _preResults(List<String> listResult) {
    List<Widget> list1 = [];
    for (var i = 0; i < listResult.length; i++) {
      list1.add(Container(
          color: i == listResult.length - 1
              ? AppTheme.white.withOpacity(0.2)
              : AppTheme.nearlyBlack,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Text(listResult[i].split('-')[0].toUpperCase(),
                  style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              Image.asset('assets/images/cards/'+listResult[i].split('-')[1]+'.png', height: 16,)
            ],
          )));
    }

    return Row(children: list1);
  }

  Widget _listBackCardsWidgets(List<String> list, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<Widget> list1 = [];

    list1.add(Container(
      height: list.length * 60 + 100,
    ));
    for (var i = 0; i < list.length; i++) {
      list1.add(
        AnimatedPositioned(
            top: i * _drawCardController.vertical.value.toDouble(),
            // right: 0 - (_drawCardController.cards.value[i] == 'remove'? 40: 0),
            right: 40 - (_drawCardController.listDistances.value[i] != null?_drawCardController.listDistances.value[i] : 0),
            duration: Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: () async {
                if(_drawCardController.drawing.value || _drawCardController.cards[i] == 'remove'){
                  return;
                }
                Audio audio = new Audio(rutBaiMp3Path);
                audio.playLocal();
                // print(list[i]);
                _drawCardController.drawing.value = true;
                // _drawCardController.selected.value = list[i];
                // _drawCardController.cards.value[i] = 'remove';
                print('save history');

                await _drawCardController.updateCard(i, 'remove');
                print('remove card');

                // _drawCardController.cards.refresh();

                // _drawCardController.cards.removeAt(i);
                // _drawCardController.listMoveDistance.removeAt(i);
                _drawCardController.drawing.value = false;


              },
              child:
              AnimatedOpacity(
                opacity:  _drawCardController.cards.value[i] == 'remove'? 0.0: 1.0,
                duration: const Duration(milliseconds: 200),
                child:
                Container(
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, -2), // changes position of shadow
                      ),
                    ],
                  ),
                  // color: Colors.red,
                  child: _drawCardController.cards.value[i] != 'remove'? Image.asset('assets/images/cards/back3.png',
                      fit: BoxFit.cover): Container(),
                ),
              ),
            )
        ),
      );
    }
    return
        Container(
        width: width * 0.5,
        height: height - 80,
        child:
            SingleChildScrollView(child: Stack(children: list1))
        );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: AppTheme.nearlyBlack,
      // appBar: AppBar(
      //   title: Text('DrawCardApp'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      body: SingleChildScrollView(
          child: Container(
            width: width,
              height: height,
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    width: width * 0.5,
                    height: height - 60,
                    child: Obx(
                          () =>
                          _listBackCardsWidgets(_drawCardController.cards, context),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                   child: Obx(
                           () => Row(
                    children: [
                      Text(_drawCardController.cards.value.where((c) => c != 'remove').toList().length.toString(), style: TextStyle(fontSize: 18, color: AppTheme.white, fontWeight: FontWeight.w500),),
                      Image.asset('assets/images/3cards.png',height: 20,)
                    ],
                  )))
                ],
              ),

              Container(
                // color: Colors.green,
                width: width * 0.5,
                child: Obx(
                  () => _listResultCardsWidgets(
                      _drawCardController.selected.value, context),
                ),
              ),
            ],
          )
        ],
      ))),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppTheme.nearlyWhite,
      //   onPressed: () {
      //     // if (_drawCardController.rolling.value) {
      //     //   // print('rolling');
      //     // } else {
      //     //   _drawCardController.addDrawCard();
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
