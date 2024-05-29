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
            child: Image.asset(
              AppAssets.weeknd,
              height: finalImageSize,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        // Positioned(
        //   left: leftPadding,
        //   top: topPadding + MediaQuery.of(context).padding.top,
        //   child: Container(
        //     height: imageSize,
        //     width: imageSize,
        //     padding: const EdgeInsets.all(5),
        //     child: const Expanded(
        //       child: CircleAvatar(
        //         backgroundImage: AssetImage(
        //           AppAssets.weeknd,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // AnimatedContainer(
        //   duration: const Duration(seconds: 3),
        //   child: Opacity(
        //     opacity: textOpacity == 1 ? textOpacity : 0,
        //     child: Positioned(
        //       left: leftPadding,
        //       top: topPadding + MediaQuery.of(context).padding.top,
        //       child: SizedBox(
        //         height: imageSize,
        //         width: imageSize,
        //         child: Image.asset(
        //           AppAssets.weeknd,
        //           height: finalImageSize,
        //           fit: BoxFit.fitHeight,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Positioned(
          bottom: 0,
          left: progress * (50 + finalImageSize + 10),
          right: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100 - progress * 30,
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
                    Opacity(
                      opacity: progress,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: textOpacity,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                        child: const Icon(
                          Icons.share,
                          color: Colors.white,
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

class TransparentCircleContainer extends StatelessWidget {
  final double width;
  final double height;
  final double circleDiameter;
  final Color backgroundColor;

  const TransparentCircleContainer({
    super.key,
    required this.width,
    required this.height,
    required this.circleDiameter,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          color: backgroundColor,
        ),
        Center(
          child: ClipPath(
            clipper: CircleClipper(circleDiameter),
            child: Container(
              width: width,
              height: height,
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  final double circleDiameter;

  CircleClipper(this.circleDiameter);

  @override
  Path getClip(Size size) {
    final path = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: circleDiameter / 2,
      ));
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    return path..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CircleClipper oldClipper) {
    return oldClipper.circleDiameter != circleDiameter;
  }
}
