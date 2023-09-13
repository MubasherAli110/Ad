// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late BannerAd _bannerAd;

//   @override
//   void initState() {
//     super.initState();

//     _bannerAd = BannerAd(
//       adUnitId: 'ca-app-pub-3940256099942544/6300978111',
//       size: AdSize.banner,
//       request: const AdRequest(),
//       listener: const BannerAdListener(),
//     );

//     _bannerAd.load();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AdWidget(ad: _bannerAd);
//   }

//   @override
//   void dispose() {
//     _bannerAd.dispose();
//     super.dispose();
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Banner Ad Example'),
//     ),
//     body: const Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Your App Content Goes Here',
//             style: TextStyle(fontSize: 18),
//           ),
//           SizedBox(height: 20),
//           BannerAdWidget(), // Display the banner ad here
//         ],
//       ),
//     ),
//   );
// }

// class BannerAdWidget extends StatefulWidget {
//   const BannerAdWidget({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _BannerAdWidgetState createState() => _BannerAdWidgetState();
// }

// class _BannerAdWidgetState extends State<BannerAdWidget> {
//   late BannerAd _bannerAd;

//   @override
//   void initState() {
//     super.initState();

//     _bannerAd = BannerAd(
//       adUnitId: 'ca-app-pub-1594286387548643~6666685047',
//       size: AdSize.banner,
//       request: const AdRequest(),
//       listener: BannerAdListener(
//         onAdLoaded: (Ad ad) {
//           print('Banner Ad loaded.');
//         },
//         onAdFailedToLoad: (Ad ad, LoadAdError error) {
//           // Ad failed to load
//           print('Banner Ad failed to load: $error');
//         },
//         // Add other event listeners as needed
//       ),
//     );

//     _bannerAd.load();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AdWidget(ad: _bannerAd);
//   }

//   @override
//   void dispose() {
//     _bannerAd.dispose();
//     super.dispose();
//   }
// }

import 'package:blog/pages/banner_ad.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
          insets: EdgeInsets.symmetric(horizontal: 10),
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
            title: Text("Ad"),
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
