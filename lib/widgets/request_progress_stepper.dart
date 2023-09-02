import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:municipality_app/models/request_progess_step.dart';
import 'package:municipality_app/models/request_progress.dart';

class RequestProgressStepperWidget extends StatelessWidget {
  final RequestProgress progress;
  const RequestProgressStepperWidget({
    required this.progress,
    Key? key,
  }) : super(key: key);

  Widget getStepEntry(BuildContext context, RequestProgressStep step) {
    return Container(
      height: 52,
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              step.getName(context) ?? "",
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontSize: 17,
                    color: Color(0xFF5E5E5E),
                  ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          step.statusEn?.toLowerCase() == 'approved'
              ? SvgPicture.asset('assets/icons/step_done.svg')
              : SvgPicture.asset('assets/icons/step_not_done.svg'),
        ],
      ),
    );
  }

  Widget getProgress(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(progress.steps!.length, (index) {
              RequestProgressStep? step = progress.steps![index];
              return Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: step.statusEn?.toLowerCase() == 'approved'
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    border: Border.all(
                      width: 1,
                      color: step.statusEn?.toLowerCase() == 'approved'
                          ? Colors.transparent
                          : Color(0xFFC4C4C4),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox(),
                ),
              );
            }),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: List.generate(progress.steps!.length, (index) {
              return Container(
                color:
                    progress.steps![index].statusEn?.toLowerCase() == 'approved'
                        ? Theme.of(context).primaryColor
                        : Color(0xFFC4C4C4),
                margin: EdgeInsets.only(right: 5.5),
                width: 1,
                height: 39,
                child: Text(''),
              );
            }),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getProgress(context),
        Expanded(
          child: Column(
            children: List.generate(
              progress.steps!.length,
              (index) => getStepEntry(context, progress.steps![index]),
            ),
          ),
        ),
      ],
    );
  }
}
