import 'package:flutter/material.dart';
import 'package:my_quran_id/features/home/widgets/top_info_item.dart';

class TopAction extends StatelessWidget {
  const TopAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Assalamualaikum",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            TopInfoItem(
              iconData: Icons.access_time_rounded,
              title: "Sholat Ashar",
              value: "15.00 WIB",
            ),
            TopInfoItem(
              iconData: Icons.location_pin,
              title: "Lokasi Anda",
              value: "Jember",
            ),
          ],
        )
      ],
    );
  }
}
