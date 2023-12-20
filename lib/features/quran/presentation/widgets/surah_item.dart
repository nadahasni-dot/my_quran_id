import 'package:flutter/material.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({
    super.key,
    required this.onTap,
    required this.number,
    required this.name,
    required this.latinName,
    required this.meaning,
  });

  final VoidCallback onTap;
  final int number;
  final String name;
  final String latinName;
  final String meaning;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
          children: [
            Ink(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: Colors.purple.shade900,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    latinName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    meaning,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              name,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
