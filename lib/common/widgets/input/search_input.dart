import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchInput extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final VoidCallback? onClear;
  final Function(String)? onSubmitted;
  final FocusNode focusNode;

  SearchInput({
    required this.hint,
    required this.focusNode,
    this.controller,
    this.onSubmitted,
    this.onClear,
  });

  @override
  SearchInputState createState() => SearchInputState();
}

class SearchInputState extends State<SearchInput> {
  bool isActive = false;

  @override
  void initState() {
    if (widget.controller != null)
      widget.controller!.addListener(() {
        if (isActive && widget.controller!.text.isNotEmpty) return;
        if (!isActive && widget.controller!.text.isEmpty) return;

        setState(() => isActive = widget.controller!.text.isNotEmpty);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        focusNode: widget.focusNode,
        onSubmitted: widget.onSubmitted,
        controller: widget.controller,
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: Colors.grey.shade700),
        decoration: InputDecoration(
          prefixIcon: Container(
            width: 36,
            height: 36,
            padding: EdgeInsets.all(6),
            child: SvgPicture.asset(
              'assets/icons/icon_search_48.svg',
              // color: isActive ? ColorStyle.nileBlue : Colors.grey.shade300,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: widget.hint,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: Colors.grey.shade300),
          // fillColor: ColorStyle.athensGrey.withOpacity(0.3),
          enabled: true,
          suffixIcon: isActive
              ? InkWell(
                  onTap: widget.onClear,
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: EdgeInsets.all(9),
                    child: SvgPicture.asset(
                      'assets/icons/icon_clear.svg',
                      color: Colors.grey.shade700,
                      width: 18,
                      height: 18,
                    ),
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
