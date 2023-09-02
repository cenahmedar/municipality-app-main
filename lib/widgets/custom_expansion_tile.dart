import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final String expandedText;
  CustomExpansionTile({required this.title, required this.expandedText});
  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            _isExpanded = !_isExpanded;
          }),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            margin: EdgeInsets.only(bottom: 17),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(19),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFB6C6D4),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text(widget.title)),
                    Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                  ],
                ),
                _isExpanded
                    ? Container(child: Text(widget.expandedText))
                    : SizedBox()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
