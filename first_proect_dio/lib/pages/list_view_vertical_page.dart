import 'package:first_proect_dio/shared/widgets/app_images.dart';
import 'package:flutter/material.dart';

class ListViewVertical extends StatefulWidget {
  const ListViewVertical({super.key});

  @override
  State<ListViewVertical> createState() => _ListViewVerticalState();
}

class _ListViewVerticalState extends State<ListViewVertical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
        flex: 2,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Card(
              elevation: 8,
              child: Image.asset(
                AppImages.mountain,
              ),
            ),
            Card(elevation: 8, child: Image.asset(AppImages.gramado)),
            Card(elevation: 8, child: Image.asset(AppImages.serra)),
            Card(elevation: 8, child: Image.asset(AppImages.rapture))
          ],
        ),
      ),
      Expanded(flex: 3, child: Container())
    ]));
  }
}
