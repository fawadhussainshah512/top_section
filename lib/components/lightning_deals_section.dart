import 'package:flutter/material.dart';
import 'deal_card.dart';
import 'deals_data.dart';

class LightningDealsSection extends StatefulWidget {
  const LightningDealsSection({super.key});

  @override
  State<LightningDealsSection> createState() => _LightningDealsSectionState();
}

class _LightningDealsSectionState extends State<LightningDealsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  final List<DealData> deals = [
    DealData(
      id: '1',
      title: 'Cozy Slippers',
      price: 1173,
      status: 'Only 1 Left',
      soldCount: 561,
      priceOff: 50,
    ),
    DealData(
      id: '2',
      title: 'Bath Towel+Towel',
      price: 618,
      status: 'Almost sold out',
      soldCount: 5200,
      badge: '1+1',
      priceOff: 30,

    ),
    DealData(
      id: '3',
      title: 'LED Desk Lamp',
      price: 1007,
      status: 'Almost sold out',
      soldCount: 1400,
      priceOff: 70,
    ),
  ];

  @override

  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animations = deals.map((deal) {
      return Tween<double>(
        begin: 0,
        end: deal.priceOff / 100,
      ).animate(_controller);
    }).toList();

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              Icon(Icons.flash_on, color: Colors.black, size: 18),
              SizedBox(width: 4),
              Text(
                'Lightning deals',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.chevron_right),
              Spacer(),
              Text(
                'Limited time offer',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: deals.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: DealCard(
                  deal: deals[index],
                  animation: _animations[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}





