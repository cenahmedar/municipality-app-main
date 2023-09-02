import 'package:flutter/material.dart';
import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/models/user.dart';
import 'package:municipality_app/pages/add_payment_method_page.dart';
import 'package:municipality_app/pages/auth/forget_password_page.dart';
import 'package:municipality_app/pages/auth/signin_page.dart';
import 'package:municipality_app/pages/auth/signup_page.dart';
import 'package:municipality_app/pages/auth/verification_page.dart';
import 'package:municipality_app/pages/call_us_page.dart';
import 'package:municipality_app/pages/change_password_page.dart';
import 'package:municipality_app/pages/content_page.dart';
import 'package:municipality_app/pages/faq_page.dart';
import 'package:municipality_app/pages/home_page.dart';
import 'package:municipality_app/pages/my_bills_page.dart';
import 'package:municipality_app/pages/my_files_page.dart';
import 'package:municipality_app/pages/my_profile_page.dart';
import 'package:municipality_app/pages/my_taxes_page.dart';
import 'package:municipality_app/pages/notifications_page.dart';
import 'package:municipality_app/pages/onboarding_page.dart';
import 'package:municipality_app/pages/payment_methods_page.dart';
import 'package:municipality_app/pages/redirecting_to_jawwal_page.dart';
import 'package:municipality_app/pages/report_a_problem_page.dart';
import 'package:municipality_app/pages/request_page.dart';
import 'package:municipality_app/pages/requests_page.dart';
import 'package:municipality_app/pages/services_list_page.dart';
import 'package:municipality_app/pages/submit_suggestion_or_complaint_page.dart';
import 'package:municipality_app/pages/technical_support_page.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static Map<String, Widget> _routes = {
    Routes.SIGN_IN: SignInPage(),
    Routes.SIGN_UP: SignUpPage(),
    Routes.HOMEPAGE: HomePage(),
    Routes.REQUEST_PAGE: RequestPage(),
    Routes.SUGGESTION_COMPLAINT_PAGE: SuggestionOrComplaintPage(),
    Routes.ONBOARDING_PAGE: OnboardingPage(),
    Routes.FORGOT_PASSWORD: ForgotPasswordPage(),
    Routes.REQUESTS: RequestsPage(),
    Routes.PAYMENT_METHODS: PaymentMethodsPage(),
    Routes.ADD_PAYMENT_METHOD: AddPaymentMethodPage(),
    Routes.REDIRECTING_TO_JAWWAL: RedirectingToJawwalPage(),
    Routes.MY_BILLS: MyBillsPage(),
    Routes.MY_TAXES: MyTaxesPage(),
    Routes.TECHNICAL_SUPPORT: TechnicalSupportPage(),
    Routes.CALL_US: CallUsPage(),
    Routes.MY_PROFILE: MyProfilePage(),
    Routes.MY_FILES: MyFilesPage(),
    Routes.CHANGE_PASSWORD: ChangePasswordPage(),
    Routes.FAQ: FAQPage(),
    Routes.NOTIFICATIONS: NotificationsPage(),
    Routes.SERVICES_LIST: ServicesListPage(),
  };
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        String routeName = settings.name == '/'
            ? Routes.HOMEPAGE
            : settings.name ?? Routes.HOMEPAGE;
        User? _user = context.watch<User?>();
        if (_user == null && routeName.contains('authorized')) {
          routeName = Routes.SIGN_IN;
        } else if (_user != null &&
            routeName.contains('authorized') &&
            _user.isSmsVerify == false) {
          return VerificationPage(
            idNumber: _user.idCarNumber ?? '',
            onVerificationSuccess: (String _, String __) =>
                Navigator.of(context).pushReplacementNamed(Routes.HOMEPAGE),
          );
        }

        return _routes[routeName] ??
            Scaffold(
              body: Center(
                child: Text("Route doesn't exist"),
              ),
            );
      },
    );
  }
}
