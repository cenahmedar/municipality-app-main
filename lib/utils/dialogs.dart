import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';
import 'package:municipality_app/utils/colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDialog {
  static void showTitleMessageNotification({
    required final BuildContext context,
    required final String title,
    required final String message,
    required final Color bgColor,
    required final Color txtColor,
    final Widget? action,
  }) {
    BotToast.showCustomNotification(
      dismissDirections: [
        DismissDirection.up,
        DismissDirection.horizontal,
      ],
      duration: Duration(seconds: 3),
      backButtonBehavior: BackButtonBehavior.close,
      toastBuilder: (cancel) {
        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(color: txtColor)),
                    SizedBox(height: 9),
                    Text(message,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: txtColor)),
                  ],
                ),
              ),
              action ?? SizedBox(),
            ],
          ),
        );
      },
    );
  }

  static void showMessageNotification({
    required final BuildContext context,
    required final String title,
  }) {
    BotToast.showCustomNotification(
      duration: Duration(seconds: 3),
      toastBuilder: (onCancel) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            // color: Colors.nileBlue,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(title, style: Theme.of(context).textTheme.headline1
              // ?.copyWith(color: ColorStyle.white),
              ),
        );
      },
    );
  }

  static void showErrorIconNotification({
    required final BuildContext context,
    required final String title,
    required final Widget asset,
    required final bool ltr,
  }) {
    BotToast.showCustomNotification(
      duration: Duration(seconds: 15),
      toastBuilder: (onCancel) {
        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: dPrimaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: ltr ? 0 : 3),
                child: asset,
              ),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // static void showMessageIconNotification({
  //   required final BuildContext context,
  //   required final String title,
  //   required final Widget asset,
  //   required final bool ltr,
  //   // Color bgColor = ColorStyle.yellowP,
  //   // Color txtColor = ColorStyle.nileBlue,
  // }) {
  //   BotToast.showCustomNotification(
  //     duration: Duration(seconds: 3),
  //     toastBuilder: (onCancel) {
  //       return Container(
  //         padding: EdgeInsets.all(12),
  //         decoration: BoxDecoration(
  //           // color: bgColor,
  //           borderRadius: BorderRadius.circular(5),
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.max,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Padding(
  //               padding: EdgeInsets.only(top: ltr ? 0 : 3),
  //               child: asset,
  //             ),
  //             SizedBox(width: 6),
  //             Expanded(
  //               child: Text(
  //                 title,
  //                 style: Theme.of(context)
  //                     .textTheme
  //                     .headline6
  //                     // ?.copyWith(color: txtColor),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  static Future<bool> showActionDialog({
    required BuildContext context,
    required String title,
    required String message,
    List<Widget> actions = const [],
    bool dismissible = true,
  }) async {
    final result = await showDialog<bool?>(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        List<Widget> children = [];
        children.addAll(
          [
            Text(
              title,
              style:
                  Theme.of(context).textTheme.headline5?.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  // color: ColorStyle.athensGrey,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 21),
          ],
        );

        children.addAll(actions);

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(21),
              decoration: BoxDecoration(
                // color: ColorStyle.white,
                border: Border.all(
                    // color: ColorStyle.athensGrey,
                    ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            ),
          ],
        );
      },
    );

    if (result != null) return result;

    return false;
  }

  static Future<void> showDateDialog(
      {required BuildContext context,
      required String title,
      bool dismissible = true,
      required Function(DateTime) onSelectDate}) async {
    await showDialog<bool?>(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        List<Widget> children = [];

        children.addAll(
          [
            Text(
              title,
              style:
                  Theme.of(context).textTheme.headline5?.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Container(
              child: SfDateRangePicker(
                onSelectionChanged: (date) {
                  onSelectDate(date.value);
                  Navigator.pop(context);
                },
                selectionMode: DateRangePickerSelectionMode.single,
              ),
            ),
            SizedBox(height: 21),
          ],
        );

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(21),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    // color: ColorStyle.athensGrey,
                    ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            ),
          ],
        );
      },
    );
  }
}
