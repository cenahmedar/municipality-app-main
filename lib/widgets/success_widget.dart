import 'package:flutter/material.dart';
import 'package:municipality_app/common/widgets/buttons/cta_button.dart';

class SuccessWidget extends StatefulWidget {
  final String successMessage;
  final String ctaButtonText;
  final VoidCallback ctaButtonOnClick;

  SuccessWidget({
    required this.ctaButtonOnClick,
    required this.ctaButtonText,
    required this.successMessage,
  });
  @override
  State<SuccessWidget> createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<SuccessWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/success_screen_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    widget.ctaButtonText,
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 100,
                    ),
                    child: CTAButton(
                      label: widget.ctaButtonText,
                      onPressed: widget.ctaButtonOnClick,
                      mainColor: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
