import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample for material.Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeRoute(),
    );
  }
}

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container( child: Image.asset("graphics/summer-background-1080x1080.png") ),
//          Expanded(
//            child: DecoratedBox(
//              //BoxDecoration(color: Colors.black)
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                    image:
//                        AssetImage("graphics/summer-background-1080x1080.png")),
//              ),
//            ),
//          ),
        ],
      ),
    );
  }
}

class CardsListWidget extends StatelessWidget {
  CardsListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: false,
      children: <Widget>[
        InfoCardWidget(cardInfo: cards[0]),
        InfoCardWidget(cardInfo: cards[1]),
        InfoCardWidget(cardInfo: cards[2]),
      ],
    );
  }
}

class CardInfo {
  final String time;
  final String occasion;
  final double insulin;
  final String insulinUnits;
  final double glucose;
  final String glucoseUnits;
  final double carbohydrates;
  final String chUnits;
  final Color color;

  const CardInfo({
    this.time,
    this.occasion,
    this.insulin,
    this.insulinUnits,
    this.glucose,
    this.glucoseUnits,
    this.carbohydrates,
    this.chUnits,
    this.color,
  });
}

const String GLUCOSE_UNITS = "ммоль/л";
const String INSULIN_UNITS = "ед";
const String CH_UNITS = "ХЕ";

const List<CardInfo> cards = [
  CardInfo(
    time: "09:00",
    occasion: "Завтрак",
    insulin: 2.0,
    insulinUnits: INSULIN_UNITS,
    glucose: 6.7,
    glucoseUnits: GLUCOSE_UNITS,
    carbohydrates: 2.5,
    chUnits: CH_UNITS,
    color: Colors.green,
  ),
  CardInfo(
    time: "10:00",
    occasion: "Поздний завтрак",
    insulinUnits: INSULIN_UNITS,
    glucose: 4.9,
    glucoseUnits: GLUCOSE_UNITS,
    carbohydrates: 0.5,
    chUnits: CH_UNITS,
    color: Colors.red,
  ),
  CardInfo(
    time: "13:00",
    occasion: "Обед",
    insulin: 2.0,
    insulinUnits: INSULIN_UNITS,
    glucose: 10.1,
    glucoseUnits: GLUCOSE_UNITS,
    carbohydrates: 0.5,
    chUnits: CH_UNITS,
    color: Colors.red,
  ),
  CardInfo(
    time: "14:00",
    occasion: "Дневной перекус",
    insulin: 2.0,
    insulinUnits: INSULIN_UNITS,
    glucose: 10.1,
    glucoseUnits: GLUCOSE_UNITS,
    carbohydrates: 0.5,
    chUnits: CH_UNITS,
    color: Colors.green,
  ),
];

class InfoCardWidget extends StatelessWidget {
  InfoCardWidget({Key key, CardInfo cardInfo})
      : _cardInfo = cardInfo,
        super(key: key);

  final CardInfo _cardInfo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          margin: EdgeInsets.fromLTRB(4, 3, 4, 0),
          child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      start: BorderSide(color: _cardInfo.color, width: 4))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextWithTimeWidget(
                            time: _cardInfo.time, label: _cardInfo.occasion),
                        Row(children: <Widget>[Container(height: 12)]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextWithLabelWidget(
                                text: _cardInfo.glucose.toString(),
                                label: _cardInfo.glucoseUnits),
                            TextWithLabelWidget(
                                text: _cardInfo.insulin.toString(),
                                label: _cardInfo.insulinUnits),
                            TextWithLabelWidget(
                                text: _cardInfo.carbohydrates.toString(),
                                label: _cardInfo.chUnits)
                          ],
                        )
                      ])
                ],
              ))),
    );
  }
}

class TextWithLabelWidget extends StatelessWidget {
  TextWithLabelWidget({String text, String label})
      : _text = text,
        _label = label,
        super(key: ObjectKey(text + label));

  final String _text;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Text(
            _text,
            style: TextStyle(fontSize: 24),
          ),
          Container(width: 2),
          Text(
            _label,
            style: TextStyle(fontSize: 14),
          )
        ]);
  }
}

class TextWithTimeWidget extends StatelessWidget {
  TextWithTimeWidget({String time, String label})
      : _time = time,
        _label = label,
        super(key: ObjectKey(time + label));

  final String _time;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[Text(_time), Container(width: 4), Text(_label)]);
  }
}
