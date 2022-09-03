import 'package:flutter/material.dart';
import 'package:social_instagram/modules/message/pages/message_page.dart';
import 'package:social_instagram/modules/notification/pages/notification_page.dart';
import 'package:social_instagram/modules/posts/pages/list_post_paging_page.dart';
import 'package:social_instagram/modules/posts/pages/list_posts_page.dart';
import 'package:social_instagram/modules/profile/pages/setting_page.dart';
import 'package:social_instagram/utils/uidata.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Widget> _children = [
    const ListPostsPage(),
    const ListPostPagingPage(),
    const MessagesPage(),
    const NotificationPage(),
    const SettingPage(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: onTabTapped,
        iconSize: 36,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFF54B64),
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(UIData.iconHome),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(UIData.iconStream),
            ),
            label: "Home 2",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(UIData.iconMessage),
            ),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(UIData.iconNotifications),
            ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(UIData.iconProfile),
            ),
            label: "Profiles",
          ),
        ],
      ),
      body: _children[_index],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _index = index;
    });
  }
}
