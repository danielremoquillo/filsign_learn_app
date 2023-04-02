import 'package:filsign_learn_app/screens/user/new_user/benefits_preview.dart';

import 'package:filsign_learn_app/screens/user/new_user/benefits_preview_done.dart';
import 'package:flutter/material.dart';

class BenefitMainScreen extends StatefulWidget {
  const BenefitMainScreen({super.key});

  @override
  _BenefitMainScreenState createState() => _BenefitMainScreenState();
}

class _BenefitMainScreenState extends State<BenefitMainScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  int _totalPages = 4;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          itemBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return const BenefitPreview(
                    imageUrl: 'assets/images/benefit1.png',
                    title: 'Improved Communication',
                    subTitle:
                        'Learn how to use the alphabet in sign language to communicate with your hands.');
              case 1:
                return const BenefitPreview(
                    imageUrl: 'assets/images/benefit2.png',
                    title: 'Cognitive Development',
                    subTitle:
                        "Studies have shown that learning sign language can enhance cognitive development, including spatial reasoning, memory, and problem-solving skills.");
              case 2:
                return const BenefitPreview(
                    imageUrl: 'assets/images/benefit3.png',
                    title:
                        'Strengthen Family Bonds with Sign Language Communication',
                    subTitle:
                        "The app helps build stronger family bonds by enabling communication through sign language.");

              case 3:
                return const BenefitPreviewDone();
              default:
                return const SizedBox();
            }
          },
          itemCount: _totalPages,
        ),
        _currentPageIndex == 3
            ? Container()
            : Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _totalPages,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20),
                        width: _currentPageIndex == index ? 32.0 : 16.0,
                        height: 13.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: _currentPageIndex == index ? 2 : 1),
                          color: _currentPageIndex == index
                              ? Color(0xFFFDE65F)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
