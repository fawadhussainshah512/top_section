import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ShippingAndReturnsSection extends StatefulWidget {
  const ShippingAndReturnsSection({super.key});

  @override
  State<ShippingAndReturnsSection> createState() => _ShippingAndReturnsSectionState();
}

class _ShippingAndReturnsSectionState extends State<ShippingAndReturnsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildLeftSection() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              Icon(
                Icons.local_shipping_outlined,
                size: 20,
                color: Colors.black87,
              ),
              SizedBox(width: 8),
              Text(
                'Free shipping',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text(
              'Limited-time offer',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightSection() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(
                Icons.assignment_return_outlined,
                size: 20,
                color: Colors.black87,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: 20,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText(
                        'Free returns',
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                      RotateAnimatedText(
                        'Price adjustment',
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    ],
                    repeatForever: true,
                    isRepeatingAnimation: true,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: SizedBox(
              height: 14,
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText(
                    'Up to 90 days*',
                    textStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[600],
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                  RotateAnimatedText(
                    'Within 30 days',
                    textStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[600],
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                ],
                repeatForever: true,
                isRepeatingAnimation: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, top: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
      decoration: const BoxDecoration(
        color: Color(0xfff4e6d9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildLeftSection(),
            ),
            Container(
              width: 1,
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            Expanded(
              child: _buildRightSection(),
            ),
          ],
        ),
      ),
    );
  }
}