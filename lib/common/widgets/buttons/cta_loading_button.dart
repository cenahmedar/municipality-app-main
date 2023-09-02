import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:municipality_app/utils/colors.dart';

enum CTAState {
  init,
  loading,
  done,
}

class CTALoadingButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final double height, width, radius;
  final Color mainColor, secondaryColor, textColor;
  final BorderSide border;
  final double maxFontSize;
  final TextStyle? textStyle;
  final bool isCompleteAction;

  const CTALoadingButton(
      {required this.label,
      required this.onPressed,
      this.width = double.infinity,
      this.height = 55,
      this.radius = 10,
      this.maxFontSize = 18,
      this.mainColor = dPrimaryColor,
      this.secondaryColor = dPrimaryColor50,
      this.textColor = Colors.white,
      this.border = BorderSide.none,
      this.textStyle,
      this.isCompleteAction = false});

  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<CTALoadingButton> {
  CTAState _state = CTAState.init;
  double _width = double.maxFinite;

  @override
  Widget build(BuildContext context) {
    if (widget.isCompleteAction == true) this._state = CTAState.init;

    return Center(
      child: Container(
        alignment: Alignment.center,
        child: PhysicalModel(
          elevation: 4,
          shadowColor: Colors.black,
          color: widget.mainColor,
          borderRadius: BorderRadius.circular(25),
          child: Container(
              height: widget.height,
              width: _width,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.disabled))
                      return Colors.white;
                    return widget.textColor;
                  }),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered) ||
                          states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return widget.secondaryColor;
                      return widget.mainColor; // Defer to the widget's default.
                    },
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled))
                      return Colors.blueGrey;
                    return widget.mainColor;
                  }),
                  elevation: MaterialStateProperty.all<double>(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(widget.radius),
                      side: widget.border,
                    ),
                  ),
                ),
                child: setUpButtonChild(),
                onPressed: widget.onPressed == null
                    ? null
                    : () {
                        if (_state == CTAState.init) {
                          animateButton();
                        }

                        widget.onPressed!();
                      },
              )),
        ),
      ),
    );
  }

  setUpButtonChild() {
    switch (_state) {
      case CTAState.init:
        return AutoSizeText(
          widget.label,
          style: widget.textStyle ??
              Theme.of(context).textTheme.button?.copyWith(
                  color: widget.onPressed == null
                      ? Colors.white
                      : widget.textColor),
          maxFontSize: widget.maxFontSize,
          minFontSize: 12,
          maxLines: 1,
          overflow: TextOverflow.clip,
        );
      case CTAState.loading:
        final indicator = widget.height * 0.9;
        return SizedBox(
          height: indicator,
          width: indicator,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircularProgressIndicator(
              value: null,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        );
      case CTAState.done:
        return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    setState(() {
      _state = CTAState.loading;
    });

    // Timer(Duration(milliseconds: 3300), () {
    //   setState(() {
    //     _state = CTAState.done;
    //   });
    // });
  }
}
