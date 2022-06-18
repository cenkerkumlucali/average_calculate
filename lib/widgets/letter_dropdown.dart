import 'package:dinamik_ortalama_hesapla/data/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class LetterDropdown extends StatefulWidget {
  LetterDropdown({required this.onSelected, Key? key}) : super(key: key);
  final Function onSelected;
  @override
  State<LetterDropdown> createState() => _Letter_DropdownState();
}

class _Letter_DropdownState extends State<LetterDropdown> {
  double? selectedLetterValue = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.primaryColor.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        value: selectedLetterValue,
        elevation: 16,
        iconEnabledColor: Constants.primaryColor.shade200,
        items: Helper.allLessonLetters(),
        onChanged: (item) {
          setState(() {
            selectedLetterValue = item;
            widget.onSelected(selectedLetterValue);
          });
        },
        underline: Container(),
      ),
    );
  }
}
