import 'package:filsign_learn_app/screens/lessons/alphabet_1/alphabet_1_lesson_screen.dart';
import 'package:filsign_learn_app/widgets/custom_linear_progress_indicator.dart';
import 'package:filsign_learn_app/widgets/main_button.dart';
import 'package:flutter/material.dart';

class Alphabet1Lesson1Screen extends StatefulWidget {
  @override
  _Alphabet1Lesson1ScreenState createState() => _Alphabet1Lesson1ScreenState();
}

class _Alphabet1Lesson1ScreenState extends State<Alphabet1Lesson1Screen> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  int _totalPages = 3;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: RoundedInnerLinearProgressIndicator(
          value: (_currentPageIndex + 1) / _totalPages,
          backgroundColor: Colors.black,
          valueColor: const Color(0xFFFFCD1F),
          height: 20.0,
        ),
      ),
      body: PageView.builder(
        physics: PageScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return Benefitpre1();
            case 1:
              return Benefitpre2();
            case 2:
              return Benefitpre3();
            default:
              return SizedBox();
          }
        },
        itemCount: _totalPages,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: //Enter to save username to current account
              TextButton(
            onPressed: () {
              if (_currentPageIndex != _totalPages) {
                _goToPage(_currentPageIndex + 1);
              }
            },
            style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFFCD1F),
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(16)))),
            child: MainButtonChild(
                buttonText: 'NEXT', buttonTextColor: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class Benefitpre1 extends StatelessWidget {
  const Benefitpre1({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Text('Page 1'),
        ),
      ),
    );
  }
}

class Benefitpre2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text('Page 2'),
      ),
    );
  }
}

class Benefitpre3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Page 3'),
      ),
    );
  }
}
