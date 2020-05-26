import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/common/zoomable_image.dart';

class PregnantOneTwoScreen extends StatefulWidget {
  @override
  _PregnantOneTwoScreenState createState() => _PregnantOneTwoScreenState();
}

class _PregnantOneTwoScreenState extends State<PregnantOneTwoScreen> {
  bool _canScroll = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ความกลัวการคลอดบุตรเกิดขึ้นได้อย่างไร'),
      bottomNavigationBar: AppBottomNavigatioBar(),
      drawer: AppDrawer(),
      body: PageIndicatorContainer(
        length: 1,
        indicatorColor: Colors.grey,
        indicatorSelectorColor: Color.fromRGBO(255, 151, 203, 1),
        child: PageView(
          physics: _canScroll ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
          children: [
            ZoomableImage(
              path: 'assets/images/contents/content-001-004.JPG',
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
