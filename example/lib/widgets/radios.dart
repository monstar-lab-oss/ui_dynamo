import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RadioGroup extends StatefulWidget {
  final String selectedValue;
  final ValueChanged<String> valueChanged;

  const RadioGroup(
      {Key key, @required this.selectedValue, @required this.valueChanged})
      : super(key: key);

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RadioListTile(
          value: "Yellow",
          groupValue: _selectedValue,
          onChanged: _valueChanged,
          title: Text("Yellow"),
        ),
        RadioListTile(
          value: "Red",
          groupValue: _selectedValue,
          onChanged: _valueChanged,
          title: Text("Red"),
        ),
        RadioListTile(
          value: "Green",
          groupValue: _selectedValue,
          onChanged: _valueChanged,
          title: Text("Green"),
        ),
      ],
    );
  }

  void _valueChanged(value) {
    widget.valueChanged(value);
    setState(() {
      _selectedValue = value;
    });
  }
}
