import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// [MyListView] screen UI, shows the Favourite Videos added in MyList.
class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);
  static const myListViewKey = Key('mylist-view-key');

  @override
  Widget build(BuildContext context) => Scaffold(
        key: myListViewKey,
        appBar: AppBar(
          backgroundColor: ColorsValue.scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: ColorsValue.whiteColor,
              size: Dimens.thirty,
            ),
            onPressed: () {
              Get.back<void>();
            },
          ),
          centerTitle: true,
          title: Text(
            StringConstants.myList,
            style: Styles.primaryText20,
          ),
          actions: [
            Padding(
              padding: Dimens.edgeInsets0_0_15_0,
              child: Image.asset(
                AssetConstants.search,
                width: Dimens.sixteen,
                height: Dimens.sixteen,
              ),
            )
          ],
        ),
        backgroundColor: ColorsValue.scaffoldBackgroundColor,
        body: const MyListWidget(),
      );
}
