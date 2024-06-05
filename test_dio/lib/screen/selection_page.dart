import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:test_dio/screen/home_page.dart';
import 'package:test_dio/screen/sign_in_page.dart';

class SelectionPage extends StatefulWidget {
  SelectionPage({super.key, this.indexPage = 0});

  int indexPage;

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  List<Widget> listPage = [HomePage(), SignInPage()];

  void selectionNextPage(int index) {
    setState(() {
      widget.indexPage = index;
    });
  }

  TextStyle textStyle() {
    return TextStyle(fontSize: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(child: listPage[widget.indexPage]),
      bottomNavigationBar: StyleProvider(
        style: Style(),
        child: ConvexAppBar(
          backgroundColor: Colors.blueGrey[200],
          elevation: 0,
          height: 60,
          top: -20,
          curveSize: 100,
          items: [
            TabItem(
              icon: Icon(
                Icons.home,
                color: Colors.blueGrey[800],
              ),
              title: 'Trang Chủ',
            ),
            TabItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.blueGrey[800],
              ),
              title: 'Của Tôi',
            ),
          ],
          gradient:
              const LinearGradient(colors: [Colors.blueGrey, Colors.white54]),
          onTap: selectionNextPage,
        ),
      ),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(
        fontSize: 14,
        color: Colors.blueGrey[900],
        fontFamily: 'NotoSansRegular');
  }
}
