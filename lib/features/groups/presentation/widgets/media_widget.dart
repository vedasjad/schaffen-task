import 'package:flutter/material.dart';

import '../../../../core/assets/assets.dart';

class MediaWidget extends StatelessWidget {
  const MediaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Media, docs and links",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(
            0,
            0,
            0,
            8,
          ),
          width: MediaQuery.of(context).size.width,
          height: 125,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    AppAssets.weeknd,
                    width: 125,
                    height: 100,
                    fit: BoxFit.cover,
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
