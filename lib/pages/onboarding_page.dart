import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/onboarding_page_item.dart';

import 'package:page_view_indicators/page_view_indicators.dart';

import '../common/widgets/buttons/cta_button.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController = PageController();
  int currentPage = 0;
  final _currentPageNotifier = ValueNotifier<int>(0);

  Widget getSlides({
    required String image,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: SvgPicture.asset(
            image,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Cairo",
                    fontStyle: FontStyle.normal,
                    fontSize: 22.0),
                textAlign: TextAlign.center,
              ),
              Text(
                description,
                style: TextStyle(
                  color: Color(0xff7b7b7b),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Cairo",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ],
    );
  }

  int? moveToPreviousPage(page) {
    final nextPage = currentPage - 1;
    if (0 > nextPage) {
      return null;
    }
    return nextPage;
  }

  int? moveToNextPage(numberOfPages, page) {
    final nextPage = currentPage + 1;
    if (nextPage > (numberOfPages - 1)) {
      return null;
    }
    return nextPage;
  }

  Widget _getBackground() {
    return Container(
      width: double.infinity,
      child: SvgPicture.asset(
        'assets/images/onboard_bg.svg',
        color: Theme.of(context).primaryColor,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            _getBackground(),
            Column(
              children: [
                Expanded(
                  child: Container(
                    // margin: EdgeInsets.only(top: height * 0.14),
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        return getSlides(
                          description:
                              data[index]['description']?.toString() ?? '',
                          title: data[index]['title']?.toString() ?? '',
                          image: data[index]['image']?.toString() ?? '',
                        );
                      },
                    ),
                  ),
                ),
                ..._getAdditionalInfo(),
                _buildCircleIndicator(),
                _buttonsWrapper(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getAdditionalInfo() {
    if (currentPage < data.length - 1) {
      return [];
    }
    return [
      Text(
        I18n.of(context)!.have_an_account_already,
        style: TextStyle(
          color: Color(0xFF666666),
        ),
      ),
      GestureDetector(
        onLongPress: () =>
            Navigator.of(context).pushReplacementNamed(Routes.SIGN_IN),
        child: Text(
          I18n.of(context)!.login_here,
          style: TextStyle(
            color: Color(0xFF1B305D),
          ),
        ),
      ),
    ];
  }

  Widget _buttonsWrapper() {
    return Container(
      child: _getButtons(),
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 40,
      ),
    );
  }

  Widget _getButtons() {
    if (currentPage == data.length - 1) {
      return CTAButton(
        label: I18n.of(context)!.register,
        mainColor: Theme.of(context).primaryColor,
        onPressed: () =>
            Navigator.of(context).pushReplacementNamed(Routes.SIGN_UP),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => Navigator.of(context).pushNamed(Routes.SIGN_IN),
          child: Text(
            "تخطي",
            style: TextStyle(
              color: Color(0xff000000),
              fontWeight: FontWeight.w400,
              fontFamily: "Cairo",
              fontStyle: FontStyle.normal,
              fontSize: 17.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
                (states) => EdgeInsets.all(1)),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                return Theme.of(context).primaryColor;
              },
            ),
          ),
          onPressed: () async {
            await _pageController.nextPage(
                duration: Duration(milliseconds: 400), curve: Curves.easeIn);
            int newPage = (_pageController.page ?? 0).round();
            _currentPageNotifier.value = newPage;
            setState(() {
              currentPage = newPage;
            });
          },
          child: Text(
            "متابعة",
            style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.w400,
              fontFamily: "Cairo",
              fontStyle: FontStyle.normal,
              fontSize: 17.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  _buildCircleIndicator() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CirclePageIndicator(
        dotColor: Theme.of(context).primaryColor.withOpacity(0.4),
        selectedDotColor: Theme.of(context).primaryColor,
        itemCount: 3,
        currentPageNotifier: _currentPageNotifier,
      ),
    );
  }
}
