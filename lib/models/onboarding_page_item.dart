class OnboardingPageItem {
  late String title;
  late String description;
  late String additionalText;
  late String onClickAdditional;
  late String image;
  late String nextButtonText;
  late String previousButtonText;
  late Function onNextButtonClick;
  late Function onPreviousButtonClick;
}

final data = [
  {
    'title': "وفر وقتك وقلل جهدك",
    'description': 'قدم خدماتك من خلال تطبيق \n الهاتف بكل سهولة وسرعة',
    "image": 'assets/images/time.svg',
    'isLoginStep': false
  },
  {
    'title': "متابعة مستمرة",
    'description': 'تابع جميع خدماتك وفواتيرك \n اين ما كنت',
    "image": 'assets/images/locatiob.svg',
    'isLoginStep': false
  },
  {
    'title': "الدفع الالكتروني",
    'description': 'قم بدفع فواتيرك من خلال بطاقة الائتمان \n بكل سهولة وسرعة',
    "image": 'assets/images/cards.svg',
    'isLoginStep': true
  }
];
