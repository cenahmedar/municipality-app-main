class Apis {
  static const String SIGN_IN = 'user/Login';
  static const String VERIFY_CODE = 'user/VerifyCode';
  static const String SIGNUP_USER = 'user/RegisterNewUser';
  static const String REFRESH_TOKEN = 'user/RefreshToken';

  static const String GET_SERVICES = 'Service';
  static const String SUBMIT_SUGGESTION_OR_COMPLAINT =
      "HelpAndSupport/SuggestionsAndComplaints";
  static const String CREATE_SERVICE_ORDER = 'orders';
  static const String GET_SERVICE_ORDER = 'orders';
  static const String CHANGE_PASSWORD = 'user/ChangePassword';
  static const String FORGOT_PASSWORD = 'user/ForgetPassword';
  static const String GET_ALL_BILLS = 'BillsAndTaxes/GetAllBills';
  static const String GET_ALL_TAXES = 'BillsAndTaxes/GetAllTaxes';
  static const String GET_USER_ATTACHMENTS = 'UserProfile/GetUserAttachments';
  static const String GET_FAQ_LIST = 'HelpAndSupport/GetFAQList';
  static const String SUBMIT_TECHNICAL_ISSUE_TICKET =
      'HelpAndSupport/SubmitUserTroubleTicket';
  static const String SUBMIT_QUESTION_OR_REQUEST = 'QuestionsAndRequests';
  static const String UPDATE_USER_PROFILE = 'UserProfile/UpdateUserProfile';
  static const String GET_ATTACHMENT_TYPES = 'UserProfile/AttachmentTypes';
  static const String PAY_BILL = 'JawwalPay/PayBill';
  static const String PAY_TAX = 'JawwalPay/PayTax';
}
