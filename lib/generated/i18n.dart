import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_brace_in_string_interps

//WARNING: This file is automatically generated. DO NOT EDIT, all your changes would be lost.

typedef LocaleChangeCallback = void Function(Locale locale);

class I18n implements WidgetsLocalizations {
  const I18n();
  static Locale? _locale;
  static bool _shouldReload = false;
  static Locale? get locale => _locale;
  static set locale(Locale? newLocale) {
    _shouldReload = true;
    I18n._locale = newLocale;
  }

  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();

  /// function to be invoked when changing the language
  static LocaleChangeCallback? onLocaleChanged;

  static I18n? of(BuildContext context) =>
      Localizations.of<I18n>(context, WidgetsLocalizations);
  @override
  TextDirection get textDirection => TextDirection.ltr;

  /// "No connection"
  String get no_connection_title => "No connection";

  /// "Please make sure the device is connected to a network"
  String get no_connection_message =>
      "Please make sure the device is connected to a network";

  /// "Login"
  String get sign_in => "Login";

  /// "ID number"
  String get id_number => "ID number";

  /// "Password"
  String get password => "Password";

  /// "Confirm password"
  String get confirm_password => "Confirm password";

  /// "Forgot password?"
  String get forget_password => "Forgot password?";

  /// "or"
  String get or => "or";

  /// "Create an account"
  String get create_account => "Create an account";

  /// "Submit a question or request"
  String get submit_question_or_request => "Submit a question or request";

  /// "Submit a suggestion or complaint"
  String get submit_suggestion_or_complaint =>
      "Submit a suggestion or complaint";

  /// "Homepage"
  String get home => "Homepage";

  /// "New request"
  String get new_request => "New request";

  /// "My requests"
  String get my_requests => "My requests";

  /// "My account"
  String get my_account => "My account";

  /// "Account not activated yet!\nIt will be activated by the\nserivce center with 24 hours"
  String get account_not_active =>
      "Account not activated yet!\nIt will be activated by the\nserivce center with 24 hours";

  /// "How can we \n help you today?"
  String get how_we_can_help_today => "How can we \n help you today?";

  /// "Service"
  String get services => "Service";

  /// "Add photo"
  String get add_photo => "Add photo";

  /// "To better understand the issue, please add a close and far photo"
  String get add_photo_description =>
      "To better understand the issue, please add a close and far photo";

  /// "Add details regarding the suggestion or complaint"
  String get add_details_suggestion_or_complaint =>
      "Add details regarding the suggestion or complaint";

  /// "Type here"
  String get write_here => "Type here";

  /// "Home address"
  String get add_address_details => "Home address";

  /// "الاسم الرباعي"
  String get full_name => "الاسم الرباعي";

  /// "Mobile phone number"
  String get phone_number => "Mobile phone number";

  /// "Email"
  String get email => "Email";

  /// "Submit application"
  String get submit_request => "Submit application";

  /// "Application submitted successfully!"
  String get request_submitted_successfully =>
      "Application submitted successfully!";

  /// "Track application"
  String get track_request => "Track application";

  /// "Back to homepage"
  String get back_to_home_screen => "Back to homepage";

  /// "What's your question or request"
  String get What_your_question_request => "What's your question or request";

  /// "Add details regarding question or request"
  String get enter_details_related_question_request =>
      "Add details regarding question or request";

  /// "Submit question or request"
  String get submit_question_request => "Submit question or request";

  /// "Please make sure you are connected to a network and try again"
  String get check_connection_try_again =>
      "Please make sure you are connected to a network and try again";

  /// "Menu"
  String get menu => "Menu";

  /// "Please enter your ID number"
  String get enter_id_number => "Please enter your ID number";

  /// "Send verification code"
  String get send_verification_code => "Send verification code";

  /// "You are confirming to the terms and conditions upon registering"
  String get terms_conditions_message =>
      "You are confirming to the terms and conditions upon registering";

  /// "Name"
  String get username => "Name";

  /// "Enter verification code"
  String get enter_verification_code => "Enter verification code";

  /// "To finish registration\nPlease enter the verification\ncode sent to your phone"
  String get enter_otp_message =>
      "To finish registration\nPlease enter the verification\ncode sent to your phone";

  /// "Pervious applications"
  String get old_services_requests => "Pervious applications";

  /// "Submit a new application"
  String get request_new_service => "Submit a new application";

  /// "My bills"
  String get my_bills => "My bills";

  /// "My taxes"
  String get taxes => "My taxes";

  /// "My files"
  String get my_files => "My files";

  /// "My information"
  String get my_information => "My information";

  /// "Payment methods"
  String get payments_methods => "Payment methods";

  /// "Technical support"
  String get support => "Technical support";

  /// "Privacy policy"
  String get privacy_policy => "Privacy policy";

  /// "Terms and conditions"
  String get terms_conditions => "Terms and conditions";

  /// "Questions and requests"
  String get questions_requests => "Questions and requests";

  /// "Suggestions and complains"
  String get suggestion_or_complaint => "Suggestions and complains";

  /// "Frequently asked questions"
  String get faq => "Frequently asked questions";

  /// "Language"
  String get language => "Language";

  /// "Logout"
  String get logout => "Logout";

  /// "Register"
  String get register => "Register";

  /// "Phone number"
  String get contact_us_number => "Phone number";

  /// "Fax number"
  String get contact_us_fax => "Fax number";

  /// "Email"
  String get contact_us_email => "Email";

  /// "Service center address"
  String get contact_us_address => "Service center address";

  /// "(Login here)"
  String get login_here => "(Login here)";

  /// "Have an account already?"
  String get have_an_account_already => "Have an account already?";

  /// "Confirm registration"
  String get confirm_registration => "Confirm registration";

  /// "Resend verification code"
  String get resend_verification_code => "Resend verification code";

  /// "Change phone number"
  String get change_phone_number => "Change phone number";

  /// "Change phone or ID number"
  String get change_phone_number_or_id => "Change phone or ID number";

  /// "How can we\n help you today"
  String get how_can_we_help_you_today => "How can we\n help you today";

  /// "Other services"
  String get other_services => "Other services";

  /// "Settings"
  String get settings => "Settings";

  /// "Show more"
  String get show_more => "Show more";

  /// "In progess"
  String get in_progress => "In progess";

  /// "Rejected"
  String get rejected => "Rejected";

  /// "More details"
  String get more_details => "More details";

  /// "Applying date"
  String get applying_date => "Applying date";

  /// "Expected deadline"
  String get expected_deadline => "Expected deadline";

  /// "Application tracking"
  String get request_tracking => "Application tracking";

  /// "Report an issue in application"
  String get report_issue_in_request => "Report an issue in application";

  /// "Pay fees"
  String get pay_fees => "Pay fees";

  /// "Add another payment method"
  String get add_another_payment_method => "Add another payment method";

  /// "Pay and finish application"
  String get pay_and_finish_application => "Pay and finish application";

  /// "Payment executed successfully"
  String get payment_executed_successfully => "Payment executed successfully";

  /// "Add a card"
  String get add_card => "Add a card";

  /// "Card will be verified against the provider"
  String get credit_card_verification_with_provider =>
      "Card will be verified against the provider";

  /// "Payment method"
  String get payment_method => "Payment method";

  /// "Card number"
  String get card_number => "Card number";

  /// "Cardholder name"
  String get cardholder_name => "Cardholder name";

  /// "Expiration date"
  String get expiration_date => "Expiration date";

  /// "Card verification value"
  String get card_verification_value => "Card verification value";

  /// "Card added and validated successfully"
  String get card_added_and_validated_successfully =>
      "Card added and validated successfully";

  /// "Start connecting to Jawwal"
  String get start_connecting_with_jawwal => "Start connecting to Jawwal";

  /// "You will be transferred to Jawwal to complete the authentication"
  String get you_will_be_transferred_to_jawwal_to_finish_connection =>
      "You will be transferred to Jawwal to complete the authentication";

  /// "Authentication succeeded"
  String get authentication_succeeded => "Authentication succeeded";

  /// "Total amount"
  String get total_amount => "Total amount";

  /// "Please enter the amount to be payed"
  String get please_enter_the_amount_you_want_to_pay =>
      "Please enter the amount to be payed";

  /// "Amount due is"
  String get amount_due_is => "Amount due is";

  /// "Choose a payment method"
  String get please_choose_payment_method => "Choose a payment method";

  /// "Pay"
  String get pay => "Pay";

  /// "Report a problem in the last application"
  String get report_problem_in_last_request =>
      "Report a problem in the last application";

  /// "Report a problem in another application"
  String get report_problem_in_an_other_request =>
      "Report a problem in another application";

  /// "Call us"
  String get call_us => "Call us";

  /// "What is the problem you are facing"
  String get what_is_the_problem_you_are_facing =>
      "What is the problem you are facing";

  /// "Got no response regarding submitted application"
  String get did_not_respond_on_request =>
      "Got no response regarding submitted application";

  /// "Issue in executing payment"
  String get there_is_an_issue_in_payment => "Issue in executing payment";

  /// "Application took a lot of time"
  String get request_took_longer_then_expected =>
      "Application took a lot of time";

  /// "Another problem"
  String get other_problem => "Another problem";

  /// "Report a problem"
  String get report_a_problem => "Report a problem";

  /// "Contact us on the number"
  String get contact_us_on_number => "Contact us on the number";

  /// "Service center address"
  String get service_center_address => "Service center address";

  /// "Application submitted successfully, you will be contacted soon"
  String get request_sent_successfully_you_will_be_contacted_asap =>
      "Application submitted successfully, you will be contacted soon";

  /// "Current living address"
  String get current_living_address => "Current living address";

  /// "Change password"
  String get change_password => "Change password";

  /// "Upload date"
  String get date_added => "Upload date";

  /// "Update photo"
  String get update_photo => "Update photo";

  /// "File updated successfully"
  String get file_updated_successfully => "File updated successfully";

  /// "Current password"
  String get current_password => "Current password";

  /// "New password"
  String get new_password => "New password";

  /// "New password again"
  String get new_password_again => "New password again";

  /// "Password changed successfully"
  String get password_changed_successfully => "Password changed successfully";

  /// "New"
  String get new_word => "New";

  /// "Service details"
  String get service_details => "Service details";

  /// "Executing section/department"
  String get executing_party => "Executing section/department";

  /// "Supporting departments"
  String get supporting_departments => "Supporting departments";

  /// "Time needed to complete processing"
  String get time_needed_for_processing => "Time needed to complete processing";

  /// "Required fees"
  String get required_fees => "Required fees";

  /// "Documents needed to open file"
  String get documents_needed_to_open_file => "Documents needed to open file";

  /// "Not selected"
  String get not_selected => "Not selected";

  /// "Attach file"
  String get attach_file => "Attach file";

  /// "Attached"
  String get file_attached => "Attached";

  /// "Application submitted, please go to service center to complete the process."
  String get request_submitted_please_go_to_center =>
      "Application submitted, please go to service center to complete the process.";

  /// "Approved"
  String get approved => "Approved";

  /// "Password must contain at least an uppercase, a number and a special character"
  String get password_rules =>
      "Password must contain at least an uppercase, a number and a special character";

  /// "Some inputs are missing"
  String get missing_inputs => "Some inputs are missing";

  /// "Passwords do not match"
  String get passwords_not_match => "Passwords do not match";

  /// "Save changes"
  String get save_changes => "Save changes";

  /// "The email is invalid"
  String get invalid_email => "The email is invalid";

  /// "There was an issue in updating user, please try again later!"
  String get issue_updating_user_message =>
      "There was an issue in updating user, please try again later!";

  /// "User was updated successfully"
  String get user_updated_successfully => "User was updated successfully";

  /// "There was an issue, please try again later"
  String get there_was_an_issue_try_again_later =>
      "There was an issue, please try again later";

  /// "Incorrect username or password"
  String get incorrect_credentials => "Incorrect username or password";

  /// "The verification code is not correct"
  String get incorrect_verification_code =>
      "The verification code is not correct";

  /// "NIS"
  String get shekels => "NIS";

  /// "Invoice number"
  String get invoice_number => "Invoice number";

  String get service_no => "Service no";

  @override
  // TODO: implement reorderItemDown
  String get reorderItemDown => throw UnimplementedError();

  @override
  // TODO: implement reorderItemLeft
  String get reorderItemLeft => throw UnimplementedError();

  @override
  // TODO: implement reorderItemRight
  String get reorderItemRight => throw UnimplementedError();

  @override
  // TODO: implement reorderItemToEnd
  String get reorderItemToEnd => throw UnimplementedError();

  @override
  // TODO: implement reorderItemToStart
  String get reorderItemToStart => throw UnimplementedError();

  @override
  // TODO: implement reorderItemUp
  String get reorderItemUp => throw UnimplementedError();
}

class _I18n_en_US extends I18n {
  const _I18n_en_US();
}

class _I18n_ar_AR extends I18n {
  const _I18n_ar_AR();
  @override
  TextDirection get textDirection => TextDirection.rtl;

  /// "نأسف على التأخير"
  @override
  String get no_connection_title => "نأسف على التأخير";

  /// "لا نستطيع الوصول إلى الانترنت، الرجاء التأكد من إتصال الجهاز"
  @override
  String get no_connection_message =>
      "لا نستطيع الوصول إلى الانترنت، الرجاء التأكد من إتصال الجهاز";

  /// "تسجيل الدخول"
  @override
  String get sign_in => "تسجيل الدخول";

  /// "رقم الهوية"
  @override
  String get id_number => "رقم الهوية";

  /// "كلمة المرور"
  @override
  String get password => "كلمة المرور";

  /// "تأكيد كلمة المرور"
  @override
  String get confirm_password => "تأكيد كلمة المرور";

  /// "نسيت كلمة المرور؟"
  @override
  String get forget_password => "نسيت كلمة المرور؟";

  /// "او"
  @override
  String get or => "او";

  /// "إنشاء حساب"
  @override
  String get create_account => "إنشاء حساب";

  /// "تقديم سؤال او طلب"
  @override
  String get submit_question_or_request => "تقديم سؤال او طلب";

  /// "تقديم اقتراح او شكوى"
  @override
  String get submit_suggestion_or_complaint => "تقديم اقتراح او شكوى";

  /// "الرئيسة"
  @override
  String get home => "الرئيسة";

  /// "طلب جديد"
  @override
  String get new_request => "طلب جديد";

  /// "طلباتي"
  @override
  String get my_requests => "طلباتي";

  /// "حسابي"
  @override
  String get my_account => "حسابي";

  /// "الحساب غير مفعل بعد! \n ستم تفعيل الحسااب من مركظ خدمة الجمهور \n خلال ٢٤ ساعة!"
  @override
  String get account_not_active =>
      "الحساب غير مفعل بعد! \n ستم تفعيل الحسااب من مركظ خدمة الجمهور \n خلال ٢٤ ساعة!";

  /// "كيف يمكننا \n مساعدتك اليوم؟"
  @override
  String get how_we_can_help_today => "كيف يمكننا \n مساعدتك اليوم؟";

  /// "الخدمات"
  @override
  String get services => "الخدمات";

  /// "اضافة صورة"
  @override
  String get add_photo => "اضافة صورة";

  /// "لفهم افضل اضف صورة قريبة وصورة بعيدة"
  @override
  String get add_photo_description => "لفهم افضل اضف صورة قريبة وصورة بعيدة";

  /// "اضف تفاصيل عن الاقتراح او الشكوى"
  @override
  String get add_details_suggestion_or_complaint =>
      "اضف تفاصيل عن الاقتراح او الشكوى";

  /// "اكتب هنا"
  @override
  String get write_here => "اكتب هنا";

  /// "اضف عنوان المكان"
  @override
  String get add_address_details => "اضف عنوان المكان";

  /// "الاسم الرباعي"
  @override
  String get full_name => "الاسم الرباعي";

  /// "رقم الهاتف المحمول"
  @override
  String get phone_number => "رقم الهاتف المحمول";

  /// "البريد الالكتروني"
  @override
  String get email => "البريد الالكتروني";

  /// "تقديم الطلب"
  @override
  String get submit_request => "تقديم الطلب";

  /// "تم تقديم الطلب بنجاح"
  @override
  String get request_submitted_successfully => "تم تقديم الطلب بنجاح";

  /// "متابعة الطلب"
  @override
  String get track_request => "متابعة الطلب";

  /// "العودة للشاشة الرئيسية"
  @override
  String get back_to_home_screen => "العودة للشاشة الرئيسية";

  /// "ما هو سؤالك او طلبك ؟"
  @override
  String get What_your_question_request => "ما هو سؤالك او طلبك ؟";

  /// "ادخل تفاصيل متعلقة بالسؤال او الطلب "
  @override
  String get enter_details_related_question_request =>
      "ادخل تفاصيل متعلقة بالسؤال او الطلب ";

  /// "تقديم السؤال او الطلب"
  @override
  String get submit_question_request => "تقديم السؤال او الطلب";

  /// "الرجاء التاكد من الاتصال بالانترنت والمحاولة موة اخوى"
  @override
  String get check_connection_try_again =>
      "الرجاء التاكد من الاتصال بالانترنت والمحاولة موة اخوى";

  /// "القائمة"
  @override
  String get menu => "القائمة";

  /// "الرجاء ادخال رقم الهوية"
  @override
  String get enter_id_number => "الرجاء ادخال رقم الهوية";

  /// "ارسال رمز التاكيد"
  @override
  String get send_verification_code => "ارسال رمز التاكيد";

  /// "عند تسجيلك في التطبيق \n فإنك توافق عل "
  @override
  String get terms_conditions_message =>
      "عند تسجيلك في التطبيق \n فإنك توافق عل ";

  /// "إسم المستخدم"
  @override
  String get username => "إسم المستخدم";

  /// "ادخل رمز التأكيد"
  @override
  String get enter_verification_code => "ادخل رمز التأكيد";

  /// "الرجاء ادخال رمز التفعيل المرسل لجوالك \n من اليسار لليمين \n لتأكيد عملية التسجيل"
  @override
  String get enter_otp_message =>
      "الرجاء ادخال رمز التفعيل المرسل لجوالك \n من اليسار لليمين \n لتأكيد عملية التسجيل";

  /// "الطلبات والخدمات السابقة"
  @override
  String get old_services_requests => "الطلبات والخدمات السابقة";

  /// "تقديم طلب لخدمة جديدة"
  @override
  String get request_new_service => "تقديم طلب لخدمة جديدة";

  /// "فواتيري"
  @override
  String get my_bills => "فواتيري";

  /// "الضرائب"
  @override
  String get taxes => "الضرائب";

  /// "ملفاتي"
  @override
  String get my_files => "ملفاتي";

  /// "معلوماتي"
  @override
  String get my_information => "معلوماتي";

  /// "طرق الدفع"
  @override
  String get payments_methods => "طرق الدفع";

  /// "الدعم الفني"
  @override
  String get support => "الدعم الفني";

  /// "سياسة الخصوصية"
  @override
  String get privacy_policy => "سياسة الخصوصية";

  /// "الشروط والاحكام"
  @override
  String get terms_conditions => "الشروط والاحكام";

  /// "الاسئلة والطلبات"
  @override
  String get questions_requests => "الاسئلة والطلبات";

  /// "الاقتراحات والشكاوي"
  @override
  String get suggestion_or_complaint => "الاقتراحات والشكاوي";

  /// "اسئلة مكررة"
  @override
  String get faq => "اسئلة مكررة";

  /// "اللغة"
  @override
  String get language => "اللغة";

  /// "تسجيل الخروج"
  @override
  String get logout => "تسجيل الخروج";

  /// "تسجيل"
  @override
  String get register => "تسجيل";

  /// "رقم الهاتف"
  @override
  String get contact_us_number => "رقم الهاتف";

  /// "رقم الفاكس"
  @override
  String get contact_us_fax => "رقم الفاكس";

  /// "الإيميل"
  @override
  String get contact_us_email => "الإيميل";

  /// "عنوان مركز خدمات الجمهور"
  @override
  String get contact_us_address => "عنوان مركز خدمات الجمهور";

  /// "(سجل الدخول هنا)"
  @override
  String get login_here => "(سجل الدخول هنا)";

  /// "هل يوجد لديك حساب مسبقا؟"
  @override
  String get have_an_account_already => "هل يوجد لديك حساب مسبقا؟";

  /// "تاكيد التسجيل"
  @override
  String get confirm_registration => "تاكيد التسجيل";

  /// "اعادة ارسال رمز التاكيد"
  @override
  String get resend_verification_code => "اعادة ارسال رمز التاكيد";

  /// "تغيير رقم الهاتف المحمول"
  @override
  String get change_phone_number => "تغيير رقم الهاتف المحمول";

  /// "تغيير رقم الهوية او رقم الهاتف المحمول"
  @override
  String get change_phone_number_or_id =>
      "تغيير رقم الهوية او رقم الهاتف المحمول";

  /// "كيف يمكننا\n مساعدتك اليوم؟"
  @override
  String get how_can_we_help_you_today => "كيف يمكننا\n مساعدتك اليوم؟";

  /// "خدمات اخرى"
  @override
  String get other_services => "خدمات اخرى";

  /// "الاعدادات"
  @override
  String get settings => "الاعدادات";

  /// "اظهار المزيد"
  @override
  String get show_more => "اظهار المزيد";

  /// "قيد التنفيذ"
  @override
  String get in_progress => "قيد التنفيذ";

  /// "رفض"
  @override
  String get rejected => "رفض";

  /// "مزيد من التفاصيل"
  @override
  String get more_details => "مزيد من التفاصيل";

  /// "تاريخ التقديم"
  @override
  String get applying_date => "تاريخ التقديم";

  /// "تاريخ الانتهاء المتوقع"
  @override
  String get expected_deadline => "تاريخ الانتهاء المتوقع";

  /// "تتبع الطلب"
  @override
  String get request_tracking => "تتبع الطلب";

  /// "ابلاغ عن مشكلة في الطلب"
  @override
  String get report_issue_in_request => "ابلاغ عن مشكلة في الطلب";

  /// "دفع الرسوم"
  @override
  String get pay_fees => "دفع الرسوم";

  /// "اضافة وسيلة دفع اخرى"
  @override
  String get add_another_payment_method => "اضافة وسيلة دفع اخرى";

  /// "الدفع و اتمام الطلب"
  @override
  String get pay_and_finish_application => "الدفع و اتمام الطلب";

  /// "تمت عمليةالدفع بنجاح"
  @override
  String get payment_executed_successfully => "تمت عمليةالدفع بنجاح";

  /// "اضافة البطاقة"
  @override
  String get add_card => "اضافة البطاقة";

  /// "سيتم تاكيد طريقة الدفع من قبل مزود الخدمة ولمرة واحدة"
  @override
  String get credit_card_verification_with_provider =>
      "سيتم تاكيد طريقة الدفع من قبل مزود الخدمة ولمرة واحدة";

  /// "طريقة الدفع"
  @override
  String get payment_method => "طريقة الدفع";

  /// "رقم البطاقة"
  @override
  String get card_number => "رقم البطاقة";

  /// "اسم حامل البطاقة"
  @override
  String get cardholder_name => "اسم حامل البطاقة";

  /// "تاريخ الانتهاء"
  @override
  String get expiration_date => "تاريخ الانتهاء";

  /// "رمز الحماية"
  @override
  String get card_verification_value => "رمز الحماية";

  /// "تمت اضافة البطاقة وتاكيد فعاليتها بنجاح"
  @override
  String get card_added_and_validated_successfully =>
      "تمت اضافة البطاقة وتاكيد فعاليتها بنجاح";

  /// "لاﻮﺟ ﻊﻣ ﻂﺑﺮﻟا ءﺪﺑ"
  @override
  String get start_connecting_with_jawwal => "لاﻮﺟ ﻊﻣ ﻂﺑﺮﻟا ءﺪﺑ";

  /// "سيتم نقلك الى برنامج جوال لاتمام الاقتران"
  @override
  String get you_will_be_transferred_to_jawwal_to_finish_connection =>
      "سيتم نقلك الى برنامج جوال لاتمام الاقتران";

  /// "تمت عملية الاقتران بنجاح"
  @override
  String get authentication_succeeded => "تمت عملية الاقتران بنجاح";

  /// "المجموع الكامل"
  @override
  String get total_amount => "المجموع الكامل";

  /// "الرجاء ادخال القيمة المراد دفعها"
  @override
  String get please_enter_the_amount_you_want_to_pay =>
      "الرجاء ادخال القيمة المراد دفعها";

  /// "القيمة المستحقة هي"
  @override
  String get amount_due_is => "القيمة المستحقة هي";

  /// "قم باختيار وسيلة الدفع"
  @override
  String get please_choose_payment_method => "قم باختيار وسيلة الدفع";

  /// "دفع"
  @override
  String get pay => "دفع";

  /// "ابلاغ عن مشكلة في طلبك الاخير"
  @override
  String get report_problem_in_last_request => "ابلاغ عن مشكلة في طلبك الاخير";

  /// "ابلاغ عن مشكلة في طلب اخر"
  @override
  String get report_problem_in_an_other_request => "ابلاغ عن مشكلة في طلب اخر";

  /// "اتصل بنا"
  @override
  String get call_us => "اتصل بنا";

  /// "ما هي المشكلة التي تواجها؟"
  @override
  String get what_is_the_problem_you_are_facing => "ما هي المشكلة التي تواجها؟";

  /// "لم يتم الاستجابة للطلب"
  @override
  String get did_not_respond_on_request => "لم يتم الاستجابة للطلب";

  /// "يوجد مشكلة في الدفع"
  @override
  String get there_is_an_issue_in_payment => "يوجد مشكلة في الدفع";

  /// "الطلب استغرق وقت اكثر من اللازم"
  @override
  String get request_took_longer_then_expected =>
      "الطلب استغرق وقت اكثر من اللازم";

  /// "مشكلة اخرى"
  @override
  String get other_problem => "مشكلة اخرى";

  /// "ابلاغ عن مشكلة"
  @override
  String get report_a_problem => "ابلاغ عن مشكلة";

  /// "تواصل معنا على الرقم"
  @override
  String get contact_us_on_number => "تواصل معنا على الرقم";

  /// "عنوان مركز الخدمة"
  @override
  String get service_center_address => "عنوان مركز الخدمة";

  /// "تم تقديم الطلب بنجاح سوف يتم التواصل بك باقرب وقت ممكن"
  @override
  String get request_sent_successfully_you_will_be_contacted_asap =>
      "تم تقديم الطلب بنجاح سوف يتم التواصل بك باقرب وقت ممكن";

  /// "عنوان السكن الحالي"
  @override
  String get current_living_address => "عنوان السكن الحالي";

  /// "تغيير كلمة السر"
  @override
  String get change_password => "تغيير كلمة السر";

  /// "تاريخ الاضافة"
  @override
  String get date_added => "تاريخ الاضافة";

  /// "تحديث الصورة"
  @override
  String get update_photo => "تحديث الصورة";

  /// "تم تحديث الملف بنجاح"
  @override
  String get file_updated_successfully => "تم تحديث الملف بنجاح";

  /// "كلمة المرور"
  @override
  String get current_password => "كلمة المرور";

  /// "كلمة المرور الجديدة"
  @override
  String get new_password => "كلمة المرور الجديدة";

  /// "اعادة كلمة المرور الجديدة"
  @override
  String get new_password_again => "اعادة كلمة المرور الجديدة";

  /// "تم تغيير كلمة المرور بنجاح"
  @override
  String get password_changed_successfully => "تم تغيير كلمة المرور بنجاح";

  /// "جديد"
  @override
  String get new_word => "جديد";

  /// "تفاصيل الخدمة"
  @override
  String get service_details => "تفاصيل الخدمة";

  /// "جهة التنفيذ (الدائرة/القسم)"
  @override
  String get executing_party => "جهة التنفيذ (الدائرة/القسم)";

  /// "الدوائر المساعدة"
  @override
  String get supporting_departments => "الدوائر المساعدة";

  /// "الوقت اللازم لانجاز الطلب"
  @override
  String get time_needed_for_processing => "الوقت اللازم لانجاز الطلب";

  /// "الرسوم المطلوبة"
  @override
  String get required_fees => "الرسوم المطلوبة";

  /// "الوثائق المطلوبة لفتح الملف"
  @override
  String get documents_needed_to_open_file => "الوثائق المطلوبة لفتح الملف";

  /// "لم يتم اختياره"
  @override
  String get not_selected => "لم يتم اختياره";

  /// "ارفاق ملف"
  @override
  String get attach_file => "ارفاق ملف";

  /// "مرفق"
  @override
  String get file_attached => "مرفق";

  /// "تم تقديم الطلب الرجاء التوجه لمركز خدمة الجمهور لاتمام باقي الاجرآت"
  @override
  String get request_submitted_please_go_to_center =>
      "تم تقديم الطلب الرجاء التوجه لمركز خدمة الجمهور لاتمام باقي الاجرآت";

  /// "موافق"
  @override
  String get approved => "موافق";

  /// "يجب أن تحتوي كلمة المرور على الأقل على أحرف كبيرة ورقم وحرف خاص"
  @override
  String get password_rules =>
      "يجب أن تحتوي كلمة المرور على الأقل على أحرف كبيرة ورقم وحرف خاص";

  /// "بعض المدخلات مفقودة"
  @override
  String get missing_inputs => "بعض المدخلات مفقودة";

  /// "كلمة المرور غير مطابقة"
  @override
  String get passwords_not_match => "كلمة المرور غير مطابقة";

  /// "حفظ التغييرات"
  @override
  String get save_changes => "حفظ التغييرات";

  /// "البريد الإلكتروني غير صالح"
  @override
  String get invalid_email => "البريد الإلكتروني غير صالح";

  /// "كانت هناك مشكلة في تحديث المستخدم ،  الرجاء معاودة المحاولة في وقت لاحق"
  @override
  String get issue_updating_user_message =>
      "كانت هناك مشكلة في تحديث المستخدم ،  الرجاء معاودة المحاولة في وقت لاحق";

  /// "تم تحديث المستخدم بنجاح"
  @override
  String get user_updated_successfully => "تم تحديث المستخدم بنجاح";

  /// "كانت هناك مشكلة ، يرجى المحاولة مرة أخرى في وقت لاحق"
  @override
  String get there_was_an_issue_try_again_later =>
      "كانت هناك مشكلة ، يرجى المحاولة مرة أخرى في وقت لاحق";

  /// "اسم المستخدم أو كلمة المرور غير صحيحة"
  @override
  String get incorrect_credentials => "اسم المستخدم أو كلمة المرور غير صحيحة";

  /// "رمز التحقق غير صحيح"
  @override
  String get incorrect_verification_code => "رمز التحقق غير صحيح";

  /// "شيكل"
  @override
  String get shekels => "شيكل";

  /// "فاتورة رقم"
  @override
  String get invoice_number => "فاتورة رقم";

  /// "رقم اشتراك"
  @override
  String get service_no => "رقم اشتراك";
}

class GeneratedLocalizationsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[Locale("en", "US"), Locale("ar", "AR")];
  }

  LocaleResolutionCallback resolution({Locale? fallback}) {
    return (Locale? locale, Iterable<Locale> supported) {
      if (locale != null && isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    I18n._locale = locale;
    I18n._shouldReload = false;
    final String lang = I18n._locale != null ? I18n._locale.toString() : "";
    final String languageCode =
        I18n._locale != null ? I18n._locale!.languageCode : "";

    if ("en_US" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    } else if ("ar_AR" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_ar_AR());
    } else if ("en" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    } else if ("ar" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_ar_AR());
    }

    return SynchronousFuture<WidgetsLocalizations>(const I18n());
  }

  @override
  bool isSupported(Locale locale) {
    for (var i = 0; i < supportedLocales.length; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => I18n._shouldReload;
}
