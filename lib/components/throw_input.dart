import 'package:dart/model/bermuda/hit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThrowInput extends StatefulWidget {
  final ValueChanged<Hit> onInput;

  ThrowInput({Key key, @required this.onInput}) : super(key: key);

  @override
  ThrowInputState createState() {
    return new ThrowInputState();
  }
}

class ThrowInputState extends State<ThrowInput> {
  int _times = 1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        buildRowForDoubleAndTripple(),
        buildInputRow([1, 2, 3, 4, 5]),
        buildInputRow(List.generate(5, (index) => index + 6)),
        buildInputRow(List.generate(5, (index) => index + 11)),
        buildInputRow(List.generate(5, (index) => index + 16)),
        buildInputRow([0, 25, 50]),
      ],
    );
  }

  Row buildInputRow(List<int> values) {
    return Row(
      children: values
          .map((v) => Flexible(
                child: RaisedButton(
                  onPressed: () => widget.onInput(createHit(v)),
                  child: Text("$v"),
                  padding: EdgeInsets.all(15),
                ),
                flex: 1,
                fit: FlexFit.tight,
              ))
          .toList(),
    );
  }

  Hit createHit(int v) {
    var hit = Hit(v, _times);
    setState(() {
      _times = 1;
    });
    return hit;
  }

  Row buildRowForDoubleAndTripple() {
    return Row(
      children: <Widget>[
        Flexible(
          child: RaisedButton(
            color: _times == 2 ? Colors.white24 : Colors.white54,
            onPressed: () {
              setState(() {
                _times == 2 ? _times = 1 : _times = 2;
              });
            },
            child: Text("DOUBLE"),
            padding: EdgeInsets.all(15),
          ),
          flex: 1,
          fit: FlexFit.tight,
        ),
        Flexible(
          child: RaisedButton(
            color: _times == 3 ? Colors.white24 : Colors.white54,
            onPressed: () {
              setState(() {
                _times == 3 ? _times = 1 : _times = 3;
              });
            },
            child: Text("TRIPLE"),
            padding: EdgeInsets.all(15),
          ),
          flex: 1,
          fit: FlexFit.tight,
        )
      ],
    );
  }
}
