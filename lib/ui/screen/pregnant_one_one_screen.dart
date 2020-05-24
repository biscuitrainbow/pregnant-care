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
          PhotoView(
            initialScale: PhotoViewComputedScale.covered,
            imageProvider: AssetImage(
              'assets/images/contents/content-001-full.png',
            ),
          ),
          PhotoView(
            initialScale: PhotoViewComputedScale.covered,
            imageProvider: AssetImage(
              'assets/images/contents/content-002-full.png',
            ),
          ),
          // ListView(
          //   padding: EdgeInsets.symmetric(vertical: 16),
          //   children: [
          //     PhotoView(
          //       imageProvider: AssetImage(
          //         'assets/images/contents/content-001-full.png',
          //       ),
          //     ),
          //     // Image.asset(
          //     //   'assets/images/contents/content-002.png',
          //     //   fit: BoxFit.cover,
          //     // ),
          //     // Image.asset(
          //     //   'assets/images/contents/content-003.png',
          //     //   fit: BoxFit.cover,
          //     // ),
          //   ],
          // ),
          // ListView(
          //   padding: EdgeInsets.symmetric(vertical: 16),
          //   children: [
          //     PhotoView(
          //       imageProvider: AssetImage(
          //         'assets/images/contents/content-002-full.png',
          //       ),

          //     ),
          //     // Container(
          //     //   height: 200,
          //     //   child: Image.asset(
          //     //     'assets/images/contents/content-006.png',
          //     //   ),
          //     // ),
          //     // Image.asset(
          //     //   'assets/images/contents/content-007.png',
          //     //   fit: BoxFit.cover,
          //     // ),
          //     // SizedBox(height: 30),
          //   ],
          // )
        ],
      ),
    );
  }
}
