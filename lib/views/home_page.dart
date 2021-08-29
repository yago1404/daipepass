import 'package:daipepass/commons/daipepass_theme.dart';
import 'package:daipepass/database.test.dart';
import 'package:daipepass/models/platform_data.dart';
import 'package:daipepass/repositories/platform_repository.dart';
import 'package:daipepass/views/add_platform_page.dart';
import 'package:daipepass/views/widgets/card_listview.dart';
import 'package:daipepass/views/widgets/daipepass_input.dart';
import 'package:daipepass/views/widgets/platform_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PlatformData>> futurePlatformsList;
  late var platformList;
  bool isLoading = true;
  final PlatformRepository platformRepository = PlatformRepository();
  final TextEditingController searchController = TextEditingController();

  DaipepassTheme theme = DaipepassTheme();

  @override
  void initState() {
    super.initState();
    futurePlatformsList = platformRepository.getAllPlatforms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: _appBar(),
      body: _body(),
    );
  }

  _body() {
    return SafeArea(
      child: Container(
        color: theme.pearl,
        child: Column(
          children: [
            DaipepassInput(
              hint: 'Pesquisar',
              iconData: Icons.search,
              controller: this.searchController,
            ),
            SizedBox(height: 10),
            FutureBuilder(
              future: futurePlatformsList,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  platformList = isLoading ? snapshot.data : platformList;
                  this.isLoading = false;
                  if (platformList.length == 0) {
                    return Container(
                        child: Center(
                      child: Text('Sem nada por enquanto'),
                    ));
                  } else {
                    return Container(
                      child: Expanded(child: CardListView(platformDataList: this.platformList)),
                    );
                  }
                }
                return Container(
                    child: Center(child: CircularProgressIndicator()));
              },
            ),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Daipepass',
        style: TextStyle(color: theme.grey),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AddPlatformPage(callbackCheckList: getPlatformList),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(Icons.add, color: theme.grey),
          ),
        ),
      ],
    );
  }

  getPlatformList() {
    setState(() {
      this.platformList = platformDataList;
    });
  }
}
