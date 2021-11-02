import 'package:daipepass/commons/daipepass_theme.dart';
import 'package:daipepass/database.test.dart';
import 'package:daipepass/models/platform_data.dart';
import 'package:daipepass/repositories/platform_repository.dart';
import 'package:daipepass/views/widgets/color_selector.dart';
import 'package:daipepass/views/widgets/daipepass_input.dart';
import 'package:flutter/material.dart';

class AddPlatformPage extends StatefulWidget {
  late final TextEditingController titleController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController usernameController = TextEditingController();
  late final TextEditingController emailController = TextEditingController();
  final PlatformRepository platformRepository = PlatformRepository();
  late final Function callbackCheckList;

  AddPlatformPage({Key? key, required this.callbackCheckList})
      : super(key: key);

  @override
  _AddPlatformPageState createState() => _AddPlatformPageState();
}

class _AddPlatformPageState extends State<AddPlatformPage> {
  final DaipepassTheme theme = DaipepassTheme();
  late Color selectedColor;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    this.selectedColor = this.theme.pink;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _fab(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      leadingWidth: 80,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancelar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  _body() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: theme.pearl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            DaipepassInput(
              hint: 'Título',
              iconData: Icons.supervised_user_circle,
              controller: this.widget.titleController,
            ),
            SizedBox(height: 15),
            DaipepassInput(
              hint: 'Email',
              iconData: Icons.email,
              controller: this.widget.emailController,
            ),
            SizedBox(height: 15),
            DaipepassInput(
              hint: 'Senha',
              iconData: Icons.vpn_key,
              isPassword: true,
              controller: this.widget.passwordController,
            ),
            SizedBox(height: 15),
            DaipepassInput(
              hint: 'Nome de usuário',
              iconData: Icons.person,
              controller: this.widget.usernameController,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Selecione uma cor',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: theme.pink),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ColorSelector(
                    color: theme.pink,
                    callbackOnSelectColor: onSelectColor,
                    selectedColor: this.selectedColor,
                  ),
                  ColorSelector(
                    color: theme.blue,
                    callbackOnSelectColor: onSelectColor,
                    selectedColor: this.selectedColor,
                  ),
                  ColorSelector(
                    color: theme.purple,
                    callbackOnSelectColor: onSelectColor,
                    selectedColor: this.selectedColor,
                  ),
                  ColorSelector(
                    color: theme.black,
                    callbackOnSelectColor: onSelectColor,
                    selectedColor: this.selectedColor,
                  ),
                  ColorSelector(
                    color: theme.red,
                    callbackOnSelectColor: onSelectColor,
                    selectedColor: this.selectedColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  onSelectColor(Color color) {
    setState(() {
      this.selectedColor = color;
    });
    print('selected color => $color');
  }

  _fab() {
    return FloatingActionButton(
      backgroundColor: theme.pink,
      onPressed: () async {
        /* print("==> ${this.widget.passwordController.text} "
            "${this.widget.usernameController.text} "
            "${this.widget.emailController.text} "
            "${this.widget.titleController.text}"); */
        if (this.widget.titleController.text != '' &&
            this.widget.titleController.text.isNotEmpty &&
            this.widget.usernameController.text != '' &&
            this.widget.usernameController.text.isNotEmpty &&
            this.widget.emailController.text != '' &&
            this.widget.emailController.text.isNotEmpty &&
            this.widget.passwordController.text != '' &&
            this.widget.passwordController.text.isNotEmpty) {
          PlatformData newPlatform = PlatformData(
            email: this.widget.emailController.text,
            password: this.widget.passwordController.text,
            title: this.widget.titleController.text,
            username: this.widget.usernameController.text,
            color: this.selectedColor,
          );
          platformDataList.add(newPlatform);
          if (await this
              .widget
              .platformRepository
              .addPlatform(platform: newPlatform)) {
            Navigator.pop(context);
            this.widget.callbackCheckList();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Algo deu errado')));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Complete todos os campos')));
        }
      },
      child: Icon(Icons.save),
    );
  }
}
