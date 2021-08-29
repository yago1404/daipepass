import 'package:daipepass/commons/daipepass_theme.dart';
import 'package:flutter/material.dart';

class DaipepassInput extends StatelessWidget {
  final DaipepassTheme theme = DaipepassTheme();
  late final bool isPassword;
  late final String hint;
  late final IconData iconData;
  late final TextEditingController controller;
  late final Function? callback;

  DaipepassInput({
    Key? key,
    required this.hint,
    required this.iconData,
    this.isPassword = false,
    required this.controller,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .95,
      //padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        border: Border.all(color: theme.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        onChanged: (text) {
          if(this.callback != null) {
            this.callback!(text);
          }
        },
        controller: this.controller,
        obscureText: this.isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData, color: theme.grey),
          border: InputBorder.none,
          hintText: this.hint,
        ),
      ),
    );
  }

  voidFunction() {}
}
