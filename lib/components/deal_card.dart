import 'package:flutter/material.dart';
import 'package:top_section/components/progress_animation.dart';
import 'deals_data.dart';

class DealCard extends StatelessWidget {
  final DealData deal;
  final Animation<double> animation;

  const DealCard({
    super.key,
    required this.deal,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: deal.image != null
                      ? Image.network(deal.image!, fit: BoxFit.cover)
                      : Container(
                    color: Colors.grey[100],
                    child: const Center(
                      child: Icon(Icons.image, size: 20, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    deal.status,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text(
                'Rs.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              Text(
                deal.price.toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '${deal.soldCount}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              Text(
                ' sold',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const SizedBox(width: 4),
              Expanded(
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return CustomPaint(
                      size: const Size(double.infinity, 12),
                      painter: ProgressPainter(
                        progress: animation.value,
                        backgroundColor: Colors.grey[200]!,
                        valueColor: Colors.black,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}