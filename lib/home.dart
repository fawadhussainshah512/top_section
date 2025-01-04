import 'package:flutter/material.dart';
import 'package:top_section/components/lightning_deals_section.dart';

import 'components/banner_images.dart';
import 'components/commitment_section.dart';
import 'components/shipping_and_return_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerScreen(),
            ShippingAndReturnsSection(),
            CommitmentSection(),
            LightningDealsSection()
          ],
        ),
      ),
    );
  }
}