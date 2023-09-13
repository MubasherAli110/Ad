import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdPage extends StatefulWidget {
  const BannerAdPage({super.key});

  @override
  State<BannerAdPage> createState() => _BannerAdPageState();
}

class _BannerAdPageState extends State<BannerAdPage> {
  @override
  void initState() {
    initBanerAd();
    super.initState();
  }

  late BannerAd bannerAd;
  late InterstitialAd interstitialAd;

  bool isAdLosd = false;
  var banneradUnit = "ca-app-pub-3940256099942544/6300978111";
  var interstitialadUnit = "ca-app-pub-3940256099942544/6300978111";
  initBanerAd() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: banneradUnit,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isAdLosd = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            print("error$error");
          },
        ),
        request: const AdRequest());
    bannerAd.load();
  }

  void loadAd() {
    InterstitialAd.load(
        adUnitId: interstitialadUnit,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            isAdLosd = true;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Banner Ad"),
      ),
      bottomNavigationBar: isAdLosd
          ? SizedBox(
              height: bannerAd.size.height.toDouble(),
              width: bannerAd.size.width.toDouble(),
              child: AdWidget(ad: bannerAd),
            )
          : const Text("null"),
    );
  }
}
