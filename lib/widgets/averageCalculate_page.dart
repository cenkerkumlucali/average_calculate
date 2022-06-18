import 'package:dinamik_ortalama_hesapla/data/helper.dart';
import 'package:dinamik_ortalama_hesapla/model/lesson.dart';
import 'package:dinamik_ortalama_hesapla/widgets/credit_dropdown.dart';
import 'package:dinamik_ortalama_hesapla/widgets/lesson_list.dart';
import 'package:dinamik_ortalama_hesapla/widgets/letter_dropdown.dart';
import 'package:dinamik_ortalama_hesapla/widgets/show_average.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_constants.dart';

class AverageCalculate extends StatefulWidget {
  const AverageCalculate({Key? key}) : super(key: key);

  @override
  State<AverageCalculate> createState() => _AverageCalculateState();
}

class _AverageCalculateState extends State<AverageCalculate> {
  final formKey = GlobalKey<FormState>();
  double? selectedLetterValue = 4;
  double? selectedCreditValue = 1;
  String? enteredLessonName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              Constants.titleText,
              style: Constants.titleStyle,
            ),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: ShowAverage(
                    lessonCount: Helper.getAllLesson.length,
                    average: Helper.calculateAverage(),
                  ),
                )
              ],
            ),
            Expanded(
              child: LessonList(
                onDismiss: (index){
                  setState(() {
                    Helper.getAllLesson.removeAt(index);
                  });
                },
              ),
            )
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Constants.horizontalPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Constants.horizontalPadding8,
                  child: LetterDropdown(onSelected: (letter){
                    selectedLetterValue = letter;
                  },),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constants.horizontalPadding8,
                  child: CreditDropdown(
                    onSelected: (value){
                      selectedCreditValue = value;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _enterLessonAndCalculateAverage,
                icon: const Icon(Icons.arrow_forward_ios_sharp),
                color: Constants.primaryColor,
                iconSize: 30,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          enteredLessonName = value!;
        });
      },
      validator: (item) {
        if (item!.length <= 0) {
          return 'Enter the lesson name';
        } else {}
      },
      decoration: InputDecoration(
          hintText: 'Math',
          border: OutlineInputBorder(
              borderRadius: Constants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Constants.primaryColor.shade100.withOpacity(0.3)),
    );
  }


  _enterLessonAndCalculateAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var addLesson = Lesson(
          name: enteredLessonName!,
          letter: selectedLetterValue!,
          credit: selectedCreditValue!);
      Helper.addLesson(addLesson);
      print(Helper.calculateAverage());
      setState(() {

      });
    }
  }
}
