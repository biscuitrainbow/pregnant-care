import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/common/floating_action_button.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PregnantOneOneScreen extends StatefulWidget {
  @override
  _PregnantOneOneScreenState createState() => _PregnantOneOneScreenState();
}

class _PregnantOneOneScreenState extends State<PregnantOneOneScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ความกลัวการคลอดบุตร'),
      // bottomNavigationBar: BottomNavigationBar(items: []),
      // floatingActionButton: Builder(builder: (context) => DrawerFloatingActionButton(onPressed: () => Scaffold.of(context).openDrawer())),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: AppDrawer(),
      body: PageView(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 8),
            children: [
              Image.asset(
                'assets/images/contents/content-001.png',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/contents/content-002.png',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/contents/content-003.png',
                fit: BoxFit.cover,
              ),
            ],
          )
        ],
      ),
    );
  }
}
