import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/common/zoomable_image.dart';

class PregnantOneFourScreen extends StatefulWidget {
  @override
  _PregnantOneFourScreenState createState() => _PregnantOneFourScreenState();
}

class _PregnantOneFourScreenState extends State<PregnantOneFourScreen> {
  bool _canScroll = true;

  String title = 'ผลกระทบกับลูกน้อย';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      bottomNavigationBar: AppBottomNavigatioBar(),
      drawer: AppDrawer(),
      body: PageIndicatorContainer(
        length: 2,
        indicatorColor: Colors.grey,
        indicatorSelectorColor: Color.fromRGBO(255, 151, 203, 1),
        child: PageView(
          onPageChanged: (index) {
            if (index == 1) {
              setState(() {
                title = 'บทส่งท้าย';
              });
            } else {
              setState(() {
                title = 'ผลกระทบกับลูกน้อย';
              });
            }
          },
          physics: _canScroll ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
          children: [
            ZoomableImage(
              path: 'assets/images/contents/content-001-007.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg-primary.png"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              child: Stack(
                alignment: Alignment.topLeft,
                overflow: Overflow.visible,
                children: [
                  BorderedContainer(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: ZoomableImage(
                          path: 'assets/images/contents/content-001-008.JPG',
                          onCanScrollChanged: _onScrolllChanged,
                        ),
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ],
              ),
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
