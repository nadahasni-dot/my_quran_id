import 'package:flutter/material.dart';
import 'package:my_quran_id/features/home/widgets/menu_item.dart';

import '../widgets/quran_reminder_card.dart';
import '../widgets/top_action.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 16),
            // TODO: get shola time based on location
            const TopAction(),
            const SizedBox(height: 16),
            QuranReminderCard(
              onTap: () {
                // TODO: go to latest read verse
              },
            ),
            // TODO: Search features dynamicly
            // const SizedBox(height: 16),
            // TextFormField(
            //   decoration: InputDecoration(
            //     contentPadding: const EdgeInsets.symmetric(
            //       vertical: 0,
            //       horizontal: 16,
            //     ),
            //     hintText: "Cari fitur, contoh: quran, arah kiblat, dll",
            //     hintStyle: TextStyle(
            //       color: Colors.grey.shade500,
            //       fontWeight: FontWeight.normal,
            //     ),
            //     suffixIcon: const Icon(Icons.search_rounded),
            //     suffixIconColor: Colors.grey.shade500,
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //       borderSide: BorderSide(color: Colors.grey.shade500),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //       borderSide: BorderSide(color: Colors.grey.shade500),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 16,
              alignment: WrapAlignment.spaceBetween,
              children: [
                MenuItem(
                  // TODO: navigate to quran page
                  onTap: () {},
                  iconPath: "assets/icons/holy-quran.svg",
                  title: "Quran",
                ),
                MenuItem(
                  onTap: () {},
                  iconPath: "assets/icons/holy-quran.svg",
                  title: "Qibla",
                ),
                MenuItem(
                  onTap: () {},
                  iconPath: "assets/icons/holy-quran.svg",
                  title: "Asmaul Husna",
                ),
                MenuItem(
                  onTap: () {},
                  iconPath: "assets/icons/holy-quran.svg",
                  title: "Jadwal Sholat",
                ),
                MenuItem(
                  onTap: () {},
                  iconPath: "assets/icons/holy-quran.svg",
                  title: "Lainnya",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
