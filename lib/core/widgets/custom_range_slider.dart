import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({super.key, this.rangeValuesChanged});
  final ValueChanged<RangeValues>? rangeValuesChanged;

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  RangeValues rangeValues = const RangeValues(0, 100);
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: 0,
      max: 200,
      values: rangeValues,
      divisions: 50,
      labels: RangeLabels(r'$' + rangeValues.start.round().toString(),
          r'$' + rangeValues.end.round().toString()),
      onChanged: (RangeValues values) {
        setState(() {
          rangeValues = values;
          widget.rangeValuesChanged!(values);
        });
      },
    );
  }
}
