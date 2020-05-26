import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/common/zoomable_image.dart';

class PregnantOneFourScreen extends StatefulWidget {
  @override
  _PregnantOneFourScreenState createState() => _PregnantOneFourScreenState();
}

class _PregnantOneFourScreenState extends State<PregnantOneFourScreen> {
  bool _canScroll = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ผลกระทบกับลูกน้อย'),
      bottomNavigationBar: AppBottomNavigatioBar(),
      drawer: AppDrawer(),
      body: PageIndicatorContainer(
        length: 2,
        indicatorColor: Colors.grey,
        indicatorSelectorColor: Color.fromRGBO(255, 151, 203, 1),
        child: PageView(
          physics: _canScroll ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
          children: [
            ZoomableImage(
              path: 'assets/images/contents/content-001-007.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-001-008.JPG',
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
