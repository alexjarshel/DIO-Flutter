import 'package:first_proect_dio/shared/widgets/app_images.dart';
import 'package:flutter/material.dart';

class imageAssetsPage extends StatefulWidget {
  const imageAssetsPage({super.key});

  @override
  State<imageAssetsPage> createState() => _imageAssetsPageState();
}

class _imageAssetsPageState extends State<imageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          AppImages.fireLink,
          width: double.infinity,
        ),
        Image.asset(
          AppImages.ds2,
          width: double.infinity,
        ),
        Image.asset(
          AppImages.soulOfCinder,
          width: double.infinity,
        ),
        Image.asset(
          AppImages.gwin,
          width: double.infinity,
        ),
      ],
    );
  }
}
