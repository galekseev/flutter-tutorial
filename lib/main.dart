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
      home: CardsListWidget(),
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
  final String insulin_units;
  final double glucose;
  final String glucose_units;
  final double carbohydrates;
  final String ch_units;
  final Color color;

  const CardInfo({
      this.time,
      this.occasion,
      this.insulin,
      this.insulin_units,
      this.glucose,
      this.glucose_units,
      this.carbohydrates,
      this.ch_units,
      this.color,
  });
}

const String GLUCOSE_UNITS = "ммоль/л";
const String INSULIN_UNITS = "ед";
const String CH_UNITS = "ХЕ";


List<CardInfo> cards = [
  const CardInfo(
    time: "09:00",
    occasion: "Завтрак",
    insulin: 2.0,
    insulin_units: INSULIN_UNITS,
    glucose: 6.7,
    glucose_units: GLUCOSE_UNITS,
    carbohydrates: 2.5,
    ch_units: CH_UNITS,
    color: Colors.green,
  ),
  const CardInfo(
    time: "10:00",
    occasion: "Поздний завтрак",
    insulin_units: INSULIN_UNITS,
    glucose: 4.9,
    glucose_units: GLUCOSE_UNITS,
    carbohydrates: 0.5,
    ch_units: CH_UNITS,
    color: Colors.red,
  ),
  const CardInfo(
    time: "13:00",
    occasion: "Обед",
    insulin: 2.0,
    insulin_units: INSULIN_UNITS,
    glucose: 10.1,
    glucose_units: GLUCOSE_UNITS,
    carbohydrates: 0.5,
    ch_units: CH_UNITS,
    color: Colors.red,
  ),
  const CardInfo(
    time: "14:00",
    occasion: "Дневной перекус",
    insulin: 2.0,
    insulin_units: INSULIN_UNITS,
    glucose: 10.1,
    glucose_units: GLUCOSE_UNITS,
    carbohydrates: 0.5,
    ch_units: CH_UNITS,
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
                        TextWithTimeWidget(time: _cardInfo.time, label: _cardInfo.occasion),
                        Row(children: <Widget>[Container(height: 12)]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextWithLabelWidget(text: _cardInfo.glucose.toString(), label: _cardInfo.glucose_units),
                            TextWithLabelWidget(text: _cardInfo.insulin.toString(), label: _cardInfo.insulin_units),
                            TextWithLabelWidget(text: _cardInfo.carbohydrates.toString(), label: _cardInfo.ch_units)
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
