import 'package:flutter/material.dart';

import '../../../../core/assets/assets.dart';
import '../../../../core/theme/colors.dart';

class CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double collapsedHeight;
  final double finalImageSize;

  CustomHeaderDelegate({
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.finalImageSize,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / (expandedHeight - collapsedHeight);
    final imageSize = (expandedHeight - shrinkOffset) > collapsedHeight
        ? expandedHeight - shrinkOffset
        : finalImageSize;
    final topPadding = (expandedHeight - shrinkOffset) > collapsedHeight
        ? 0.0
        : (collapsedHeight - finalImageSize) / 2;
    final double leftPadding =
        Tween<double>(begin: 0.0, end: 50.0).transform(progress);

    final double textOpacity = 1.0 - progress;

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          height: expandedHeight,
          color: AppColors.red,
        ),
        Positioned(
          left: leftPadding,
          top: topPadding + MediaQuery.of(context).padding.top,
          child: SizedBox(
            height: imageSize,
            width: imageSize,
            child: Image.asset(
              AppAssets.weeknd,
              height: finalImageSize,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Positioned(
          left: leftPadding,
          top: topPadding + MediaQuery.of(context).padding.top,
          child: SizedBox(
            height: imageSize,
            width: imageSize,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                // Colors.green.withOpacity(progress < 0 ? 0 : progress>1?1:progress),
                progress < 0.7 ? Colors.transparent : AppColors.red,
                // BlendMode.srcOut,
                BlendMode.srcOut,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.red,
                      backgroundBlendMode: BlendMode.dstOut,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.white,
                          width: imageSize / 2,
                        ),
                        borderRadius:
                            BorderRadius.circular(imageSize * progress),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: progress * (50 + finalImageSize + 15),
          right: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 90 - progress * 30,
            color: AppColors.red.withOpacity(textOpacity > 0 ? textOpacity : 0),
            padding: EdgeInsets.all(16 - 8 * progress),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Weeknd',
                      style: TextStyle(
                        fontSize: 24 - 6 * progress,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Community +11k members',
                      style: TextStyle(
                        fontSize: 16 - 4 * progress,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("hh");
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 4,
                                          width: 100,
                                          margin: EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        )
                                      ],
                                    ),
                                    ...List.generate(3, (index) {
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              index == 0
                                                  ? AppAssets.link
                                                  : index == 1
                                                      ? AppAssets.add
                                                      : AppAssets.group,
                                              height: 25,
                                              width: 25,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              index == 0
                                                  ? "Invite"
                                                  : index == 1
                                                      ? "Add Member"
                                                      : "Add Group",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              );
                            });
                      },
                      child: Opacity(
                        opacity: progress > 1 ? 1 : progress,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    IgnorePointer(
                      ignoring: progress >= 1,
                      child: Opacity(
                        opacity: textOpacity > 0 ? textOpacity : 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child: const Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => collapsedHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class CircularHoleContainer extends StatelessWidget {
  final double width;
  final double height;
  final double holeSize;
  final Color backgroundColor;
  final Widget? child;

  CircularHoleContainer({
    required this.width,
    required this.height,
    required this.holeSize,
    required this.backgroundColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          color: backgroundColor,
          child: child,
        ),
        Center(
          child: ClipOval(
            child: Container(
              width: holeSize,
              height: holeSize,
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
