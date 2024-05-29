import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool isNotificationsMuted = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Mute notifications",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          Switch(
            value: isNotificationsMuted,
            onChanged: (val) {
              setState(() {
                isNotificationsMuted = val;
              });
            },
            inactiveTrackColor: Colors.white,
            activeColor: Colors.white,
            trackOutlineWidth: WidgetStateProperty.all(0),
            trackOutlineColor: WidgetStateProperty.all(Colors.white),
            thumbColor: WidgetStateProperty.all(AppColors.grey),
          ),
        ],
      ),
    );
  }
}
