import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/common/zoomable_image.dart';

class PregnantOneOneScreen extends StatefulWidget {
  @override
  _PregnantOneOneScreenState createState() => _PregnantOneOneScreenState();
}

class _PregnantOneOneScreenState extends State<PregnantOneOneScreen> {
  bool _canScroll = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ความกลัวการคลอดบุตร'),
      bottomNavigationBar: AppBottomNavigatioBar(),
      drawer: AppDrawer(),
      body: PageIndicatorContainer(
        length: 3,
        indicatorColor: Colors.grey,
        indicatorSelectorColor: Color.fromRGBO(255, 151, 203, 1),
        child: PageView(
          physics: _canScroll ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
          children: [
            ZoomableImage(
              path: 'assets/images/contents/content-001-001.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-001-002.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-001-003.JPG',
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
