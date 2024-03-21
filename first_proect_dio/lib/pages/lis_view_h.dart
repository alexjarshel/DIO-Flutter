import 'package:first_proect_dio/shared/widgets/app_images.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Soul of cinder'),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Hello my chapa'), Text('08:07')],
          ),
          trailing: PopupMenuButton<String>(onSelected: (menu) {
            if (menu == 'Menu2') {
              print(2);
            }
          }, itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Menu1',
                child: Text('opção1'),
              ),
              const PopupMenuItem<String>(
                value: 'Menu2',
                child: Text('opção2'),
              ),
              const PopupMenuItem<String>(
                value: 'Menu3',
                child: Text('opção3'),
              )
            ];
          }),

          //Icon(Icons.menu),
          leading: Image.asset(AppImages.soulOfCinder),
        ),
        Image.asset(
          AppImages.soulOfCinder,
          //width: double.infinity,
        ),
        Image.asset(
          AppImages.gwin,
          width: double.infinity,
        ),
      ],
    );
  }
}
