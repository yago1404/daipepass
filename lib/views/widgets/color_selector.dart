import 'package:daipepass/commons/daipepass_theme.dart';
import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  late final Color color;
  late final Color selectedColor;
  late final Function callbackOnSelectColor;

  ColorSelector({
    Key? key,
    required this.color,
    required this.callbackOnSelectColor,
    required this.selectedColor,
  }) : super(key: key);

  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  final DaipepassTheme theme = DaipepassTheme();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          this.widget.callbackOnSelectColor(this.widget.color);
        });
      },
      child: Container(
        width: 50,
        height: 50,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: this.widget.color,
                border: Border.all(
                    color: this.widget.selectedColor == this.widget.color ? theme.green : theme.grey, width: 3),
              ),
            ),
            Center(
              child: Icon(
                this.widget.selectedColor == this.widget.color ? Icons.check : null,
                color: theme.green,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
