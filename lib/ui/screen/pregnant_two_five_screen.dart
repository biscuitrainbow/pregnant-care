import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/common/zoomable_image.dart';

class PregnantTwoFiveScreen extends StatefulWidget {
  @override
  _PregnantTwoFiveScreenState createState() => _PregnantTwoFiveScreenState();
}

class _PregnantTwoFiveScreenState extends State<PregnantTwoFiveScreen> {
  bool _canScroll = true;
  String title = 'การเตรียมความพร้อมเพื่อการคลอด';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      bottomNavigationBar: AppBottomNavigatioBar(),
      drawer: AppDrawer(),
      body: PageIndicatorContainer(
        length: 18,
        indicatorColor: Colors.grey,
        indicatorSelectorColor: Color.fromRGBO(255, 151, 203, 1),
        child: PageView(
          onPageChanged: (index) {
            if (index == 17) {
              setState(() {
                title = 'บทส่งท้าย';
              });
            } else {
              setState(() {
                title = 'การเตรียมความพร้อมเพื่อการคลอด';
              });
            }
          },
          physics: _canScroll ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
          children: [
            ZoomableImage(
              path: 'assets/images/contents/content-002-022.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-023.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-024.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-025.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-026.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-027.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-028.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-029.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-030.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-031.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-032.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-033.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-034.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-035.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-036.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-037.JPG',
              onCanScrollChanged: _onScrolllChanged,
            ),
            ZoomableImage(
              path: 'assets/images/contents/content-002-038.JPG',
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
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: ZoomableImage(
                          path: 'assets/images/contents/content-002-039.JPG',
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
