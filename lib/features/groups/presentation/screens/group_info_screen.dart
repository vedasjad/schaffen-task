import 'package:flutter/material.dart';
import 'package:schaffen/core/theme/colors.dart';
import 'package:schaffen/features/groups/presentation/widgets/my_search_bar.dart';
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
                    const MySearchBar(),
                    ...List.generate(10, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                              AppAssets.woman,
                            ),
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
