import 'package:flutter/material.dart';

import '../generated/i18n.dart';

class BillsFilterCard extends StatefulWidget {
  final List<String?> dropdownItems;
  final void Function(String?) onChanged;

  BillsFilterCard({required this.dropdownItems, required this.onChanged});

  @override
  _BillsFilterCardState createState() => _BillsFilterCardState();
}

class _BillsFilterCardState extends State<BillsFilterCard> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(I18n.of(context)!.service_no),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    items: [
                      ...widget.dropdownItems.map((String? value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value ?? ""),
                        );
                      }).toList(),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                      widget.onChanged(value);
                    },
                    value: selectedValue,
                    hint: Text(
                      'Select an item',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    isExpanded: true,
                    underline: SizedBox.shrink(),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      selectedValue = null;
                    });
                    widget.onChanged(null);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
