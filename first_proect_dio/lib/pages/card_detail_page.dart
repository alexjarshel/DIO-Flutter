import 'package:first_proect_dio/model/card_detail.dart';
import 'package:flutter/material.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;
  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          /*
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(cardDetail.title),
          ),
          */
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
                Row(
                  children: [
                    Image.network(
                      cardDetail.url,
                      height: 100,
                    ),
                  ],
                ),
                Text(
                  cardDetail.title,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    cardDetail.text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
