import 'package:flutter/material.dart';
import 'package:schaffen/core/theme/colors.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedOpacity(
            opacity: _isExpanded ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _isExpanded ? 0 : MediaQuery.of(context).size.width * 0.3,
              child: const Text(
                'Members',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isExpanded ? MediaQuery.of(context).size.width * 0.75 : 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Member',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppColors.lightGrey,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
          ),
          _isExpanded
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = false;
                    });
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              : IconButton(
                  icon: Icon(_isExpanded ? Icons.close : Icons.search),
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                ),
        ],
      ),
    );
  }
}
