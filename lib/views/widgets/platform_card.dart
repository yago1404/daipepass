import 'package:daipepass/commons/daipepass_theme.dart';
import 'package:daipepass/repositories/platform_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformCard extends StatefulWidget {
  late final Color color;
  late final String title;
  late final String username;
  late final String password;
  late final String email;

  PlatformCard({
    Key? key,
    required this.color,
    required this.title,
    required this.email,
    required this.password,
    this.username = '',
  }) : super(key: key);

  @override
  _PlatformCardState createState() => _PlatformCardState();
}

class _PlatformCardState extends State<PlatformCard> {
  late IconData eyeIcon;

  final DaipepassTheme theme = DaipepassTheme();
  final PlatformRepository platformRepository = PlatformRepository();

  @override
  void initState() {
    eyeIcon = Icons.visibility_off;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(this.widget.title),
                content: SingleChildScrollView(
                    child: Text(
                        'Deseja apagar a senha para ${this.widget.title}?')),
                actions: [
                  TextButton(
                    onPressed: () {
                      this.platformRepository.deletePlatform();
                    },
                    child: Text('Apagar', style: TextStyle(color: theme.pink)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancelar'),
                  )
                ],
              );
            });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      eyeIcon = eyeIcon == Icons.visibility
                          ? Icons.visibility_off
                          : Icons.visibility;
                    });
                  },
                  child: Icon(eyeIcon, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                        ClipboardData(text: this.widget.password));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Copiado com sucesso'),
                      ),
                    );
                    print('copy');
                  },
                  child: Icon(Icons.copy, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .5 - 40,
                  child: Text(
                    this.widget.title,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width * .5 - 40,
                  child: Text(
                    eyeIcon == Icons.visibility ? this.widget.password : '****',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .5 - 40,
                  child: Text(
                    this.widget.username,
                    style: TextStyle(color: Color(0xFFDDDDDD), fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width * .5 - 40,
                  child: Text(
                    this.widget.email,
                    style: TextStyle(color: Color(0xFFDDDDDD), fontSize: 15),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
