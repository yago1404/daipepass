import 'package:daipepass/models/platform_data.dart';
import 'package:daipepass/views/widgets/platform_card.dart';
import 'package:flutter/material.dart';

class CardListView extends StatefulWidget {
  late final List<PlatformData> platformDataList;

  CardListView({Key? key, required this.platformDataList}) : super(key: key);

  @override
  _CardListViewState createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: this.widget.platformDataList.length,
        itemBuilder: (container, index) {
          PlatformData currentItem = this.widget.platformDataList[index];
          return PlatformCard(
            title: currentItem.title,
            email: currentItem.email,
            password: currentItem.password,
            username: currentItem.username,
            color: currentItem.color,
          );
        },
      ),
    );
  }
}
