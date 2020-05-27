import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/common/zoomable_image.dart';

class PregnantThreeOneScreen extends StatefulWidget {
  @override
  _PregnantThreeOneScreenState createState() => _PregnantThreeOneScreenState();
}

class _PregnantThreeOneScreenState extends State<PregnantThreeOneScreen> {
  bool _canScroll = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'เทคนิคคลายความกลัว'),
      bottomNavigationBar: AppBottomNavigatioBar(),
      drawer: AppDrawer(),
      body: PageIndicatorContainer(
        length: 8,
        indicatorColor: Colors.grey,
        indicatorSelectorColor: Color.fromRGBO(255, 151, 203, 1),
        child: PageView(
          physics: _canScroll ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
          children: [
            ZoomableImage(
              path: 'assets/images/contents/content-003-001.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-003-002.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-003-003.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-003-004.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-003-005.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-003-006.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-003-007.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-003-008.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
          ],
        ),
      ),
    );
  }

  void _onScrolllChanged(canScroll) {
    setState(() => _canScroll = canScroll);
  }
}
