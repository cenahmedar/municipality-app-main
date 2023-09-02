import 'package:bot_toast/bot_toast.dart';

void showNotification(String title, String? message) {
  BotToast.showSimpleNotification(title: title, subTitle: message);
}
