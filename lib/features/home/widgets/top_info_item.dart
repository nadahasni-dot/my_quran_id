import 'package:flutter/material.dart';

class TopInfoItem extends StatelessWidget {
  const TopInfoItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.value,
  });

  final IconData iconData;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: Colors.amber,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
