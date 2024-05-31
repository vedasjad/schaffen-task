import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({
    super.key,
  });

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  final String aboutText =
      "The amber droplet hung from the branch, reaching fullness and ready to drop. It waited. While many of the other droplets were satisfied to form as big as they could and release, this droplet had other plans. It wanted to be part of history. It wanted to be remembered long after all the other droplets had dissolved into history. So it waited for the perfect specimen to fly by to trap and capture that it hoped would eventually be discovered hundreds of years in the future.";
  bool isExpanded = false;
  int limit = 200;
  @override
  Widget build(BuildContext context) {
    String displayText = aboutText.length > limit
        ? (isExpanded ? aboutText : '${aboutText.substring(0, limit)}... ')
        : aboutText;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text.rich(
              TextSpan(
                text: displayText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                children: [
                  if (aboutText.length > limit && !isExpanded)
                    const TextSpan(
                      text: 'Read more',
                      style: TextStyle(
                        color: AppColors.pink,
                        fontSize: 16,
                      ),
                    ),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.pink,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  index == 4 ? "+1" : "Outdoor",
                  style: const TextStyle(
                    color: AppColors.pink,
                    fontSize: 14,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
