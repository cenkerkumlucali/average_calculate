import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/data/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditDropdown extends StatefulWidget {
  final Function onSelected;
  CreditDropdown({required this.onSelected, Key? key}) : super(key: key);

  @override
  State<CreditDropdown> createState() => _CreditDropdownState();
}

class _CreditDropdownState extends State<CreditDropdown> {
  double? selectedCreditValue = 1;
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
        value: selectedCreditValue,
        elevation: 16,
        iconEnabledColor: Constants.primaryColor.shade200,
        items: Helper.allLessonCredit(),
        onChanged: (item) {
          setState(() {
            selectedCreditValue = item;
            widget.onSelected(selectedCreditValue);
          });
        },
        underline: Container(),
      ),
    );
  }
}
