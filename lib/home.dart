import 'package:flutter/material.dart';

import 'components/banner.dart';
import 'components/commitment_section.dart';
import 'components/shipping_and_return_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerScreen(),
            ShippingAndReturnsSection(),
            CommitmentSection(),
          ],
        ),
      ),
    );
  }
}