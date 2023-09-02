import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MunicipalityAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final VoidCallback? onPressed;

  const MunicipalityAppBar(
      {Key? key, required this.title, this.subTitle, this.onPressed})
      : super(key: key);

  @override
  Size get preferredSize => Size(double.infinity, 120);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x40000000),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0)
            ],
            color: Theme.of(context).primaryColor),
        child: Row(
          children: [
            if (onPressed != null)
              IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 35,
                    color: Colors.white,
                  )),
            if (onPressed == null)
              SizedBox(
                width: 35,
              ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (subTitle?.isNotEmpty == true)
                    SizedBox(
                      height: 22,
                    ),
                  AutoSizeText(
                    title,
                    style: TextStyle(color: Colors.white),
                    maxLines: 2,
                    minFontSize: 24,
                    maxFontSize: 34,
                  ),
                  if (subTitle?.isNotEmpty == true)
                    Text(this.subTitle ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(fontSize: 13, color: Colors.white),
                        textAlign: TextAlign.start)
                ],
              ),
            )
          ],
        ));
  }
}
