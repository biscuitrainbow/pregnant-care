import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:photo_view/photo_view.dart';

class PregnantOneOneScreen extends StatefulWidget {
  @override
  _PregnantOneOneScreenState createState() => _PregnantOneOneScreenState();
}

class _PregnantOneOneScreenState extends State<PregnantOneOneScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ความกลัวการคลอดบุตร'),
      bottomNavigationBar: AppBottomNavigatioBar(),
      drawer: AppDrawer(),
      body: PageView(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Image.asset(
              'assets/images/contents/content-001-001.JPG',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Image.asset(
              'assets/images/contents/content-001-002.JPG',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Image.asset(
              'assets/images/contents/content-001-003.JPG',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
