import 'dart:ui';

import 'package:flutter/material.dart';

class ClearableTexfield extends StatefulWidget {
                    
  ClearableTexfield({
    Key? key,
    required this.controller,
    this.onSubmitted,
    this.autofocus = false,
    this.focusNode,
    this.autocorrect = false,
    this.decoration,
    this.onChanged
    }) : super(key: key);

  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;

  final bool autofocus;
  final FocusNode? focusNode;
  final bool autocorrect;
  final InputDecoration? decoration;
  final ValueChanged<String>? onChanged;

  @override
  State<StatefulWidget> createState() {
    return _ClearableTextfieldState();
  }
}

class _ClearableTextfieldState extends State<ClearableTexfield> {
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _showClearButton = widget.controller.text.length > 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      onSubmitted: widget.onSubmitted,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      autocorrect: widget.autocorrect,
      decoration: widget.decoration?.copyWith(suffixIcon: _getClearButton()),
    );
  }

  Widget? _getClearButton() {
    if (!_showClearButton) {
      return null;
    }

    return IconButton(
      onPressed: () {
        widget.controller.clear();
        try {
          widget.onChanged!(widget.controller.text);
        } catch(e) {}
      },
      icon: Container(
        decoration: BoxDecoration(
          color: Color(0xff6b778c),
          	borderRadius: BorderRadius.circular(12)
        ),
        child: Container(child: Icon(Icons.clear, color: Colors.white, size: 20), width: 24, height: 24, ),
      ));
  }
}