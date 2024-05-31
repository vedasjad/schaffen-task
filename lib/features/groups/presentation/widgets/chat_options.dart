import 'package:flutter/material.dart';
import 'package:schaffen/core/assets/assets.dart';

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
                index == 0
                    ? Image.asset(
                        AppAssets.trash,
                      )
                    : index == 1
                        ? Image.asset(
                            AppAssets.lock,
                          )
                        : index == 2
                            ? Image.asset(
                                AppAssets.logout,
                              )
                            : Image.asset(
                                AppAssets.dislike,
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
