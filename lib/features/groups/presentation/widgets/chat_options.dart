import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class ChatOptions extends StatelessWidget {
  const ChatOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: List.generate(4, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Icon(
                  index == 0
                      ? Icons.delete
                      : index == 1
                          ? Icons.lock
                          : index == 2
                              ? Icons.exit_to_app
                              : Icons.thumb_down_alt_outlined,
                  color: index >= 2 ? AppColors.red : Colors.black,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  index == 0
                      ? "Clear chat"
                      : index == 1
                          ? "Encryption"
                          : index == 2
                              ? "Exit community"
                              : "Report",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: index >= 2 ? AppColors.red : Colors.black,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
