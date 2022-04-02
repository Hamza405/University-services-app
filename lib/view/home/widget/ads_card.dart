import 'package:flutter/material.dart';

import '../../../model/ads.dart';
import '../../../shared/constance.dart';

class AdsCard extends StatelessWidget {
  final Ads ads;
  const AdsCard({Key? key, required this.ads}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.grey[100],
        shadowColor: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ads.section.toString(),
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(ads.description.toString()),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      ads.created_at!.toIso8601String().split('T').first,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
