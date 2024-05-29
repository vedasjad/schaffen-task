import 'package:flutter/material.dart';
import 'package:schaffen/core/theme/colors.dart';
import 'package:schaffen/features/groups/presentation/widgets/notifications.dart';

import '../../../../core/assets/assets.dart';
import '../widgets/about_section.dart';
import '../widgets/chat_options.dart';
import '../widgets/custom_header_delegate.dart';
import '../widgets/media_widget.dart';

class GroupInfoScreen extends StatefulWidget {
  const GroupInfoScreen({super.key});

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12.withOpacity(0.05),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: CustomHeaderDelegate(
                  expandedHeight: MediaQuery.of(context).size.width,
                  collapsedHeight: kToolbarHeight,
                  finalImageSize: 50,
                ),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    const AboutSection(),
                    const MediaWidget(),
                    const Notifications(),
                    const ChatOptions(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (!_isExpanded)
                            const Text(
                              "Members",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                            child: AnimatedContainer(
                              curve: Curves.easeInOut,
                              duration: const Duration(seconds: 2),
                              width: _isExpanded
                                  ? MediaQuery.of(context).size.width * 0.75
                                  : null,
                              height: 40.0,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              child: Row(
                                children: [
                                  if (_isExpanded)
                                    const Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: 'Search...',
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_isExpanded)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isExpanded = false;
                                });
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    ...List.generate(15, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius:
                                25, // Adjust the radius to change the size of the circle
                            backgroundImage: AssetImage(
                              AppAssets.woman,
                            ), // Replace with your image URL
                          ),
                          titleAlignment: ListTileTitleAlignment.top,
                          title: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Yashika",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "29, India",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          trailing: Container(
                            height: 35,
                            width: 110,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:
                                  index == 0 ? Colors.blueGrey : AppColors.pink,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              index == 0 ? "Following" : "Add",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
