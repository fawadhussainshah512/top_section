import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CommitmentSection extends StatefulWidget {
  const CommitmentSection({super.key});

  @override
  State<CommitmentSection> createState() => _CommitmentSectionState();
}

class _CommitmentSectionState extends State<CommitmentSection> with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical:5),
          decoration: BoxDecoration(
            color: const Color(0xff0a8800),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.verified_user,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Temu's Commitments",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 100,
                height: 14,
                child: RotationTransition(
                  turns: _controller.drive(Tween(begin: 0.0, end: 1.0)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 20,
                          child: AnimatedTextKit(
                            animatedTexts: [
                              RotateAnimatedText(
                                'Safe payment',
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                              RotateAnimatedText(
                                'Security privacy',
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            ],
                            repeatForever: true,
                            isRepeatingAnimation: true,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

