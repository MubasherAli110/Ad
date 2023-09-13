import 'package:blog/pages/banner_ad.dart';
import 'package:flutter/material.dart';

import 'interstitial_ad.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabBar get tabBar => const TabBar(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 1.0, color: Color(0xff15B9A5)),
          insets: EdgeInsets.symmetric(horizontal: 20),
        ),
        labelColor: Color(0xff15B9A5),
        labelStyle: TextStyle(
          color: Color(0xffF6AE26),
          fontWeight: FontWeight.bold,
        ),
        tabs: [
          Tab(text: "Banner Ad"),
          Tab(text: "Interstitial Ad"),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff15B9A5),
            title: const Text("Ad Page"),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: tabBar.preferredSize,
              child: Material(
                color: const Color(0xffffffff),
                child: tabBar,
              ),
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: TabBarView(children: [
              BannerAdPage(),
              InterstitialAdPAGE(),
            ]),
          )),
    );
  }
}
