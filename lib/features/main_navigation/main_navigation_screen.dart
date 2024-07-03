import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/contants/sizes.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/onboarding/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/users/user_profile_screen.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';
import 'package:tiktok_clone/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Discover"),
    ),
    const Center(
      child: Text("Add"),
    ),
    const Center(
      child: Text("Inbox"),
    ),
    const Center(
      child: Text("User"),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Record Video"),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
          _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: screens.elementAt(_selectedIndex),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
        child: SizedBox(
          height: 80, // 높이 조정
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: NavTab(
                      selectedIndex: _selectedIndex,
                      icon: FontAwesomeIcons.house,
                      selectedIcon: FontAwesomeIcons.house,
                      text: "Home",
                      isSelected: _selectedIndex == 0,
                      onTap: () => _onTap(0)),
                ),
                Expanded(
                  child: NavTab(
                      selectedIndex: _selectedIndex,
                      icon: FontAwesomeIcons.compass,
                      selectedIcon: FontAwesomeIcons.solidCompass,
                      text: "Discover",
                      isSelected: _selectedIndex == 1,
                      onTap: () => _onTap(1)),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: _onPostVideoButtonTap,
                    child: PostVideoButton(
                      inverted: _selectedIndex != 0,
                    ),
                  ),
                ),
                Expanded(
                  child: NavTab(
                      selectedIndex: _selectedIndex,
                      icon: FontAwesomeIcons.message,
                      selectedIcon: FontAwesomeIcons.message,
                      text: "Inbox",
                      isSelected: _selectedIndex == 3,
                      onTap: () => _onTap(3)),
                ),
                Expanded(
                  child: NavTab(
                      selectedIndex: _selectedIndex,
                      icon: FontAwesomeIcons.user,
                      selectedIcon: FontAwesomeIcons.solidUser,
                      text: "Profile",
                      isSelected: _selectedIndex == 4,
                      onTap: () => _onTap(4)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
