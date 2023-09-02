import 'package:flutter/material.dart';

class TechnicalSupportCardWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  TechnicalSupportCardWidget({required this.onClick, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 60,
        margin: EdgeInsets.only(
          bottom: 16,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 22,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFB6C6D4),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.caption?.copyWith(
                    fontSize: 13,
                    color: Colors.black,
                  ),
            ),
            Icon(
              Icons.chevron_right_sharp,
              color: Color(0xFF686868),
            ),
          ],
        ),
      ),
    );
  }
}
