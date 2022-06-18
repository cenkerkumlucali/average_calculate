import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int lessonCount;
  const ShowAverage(
      {required this.average, required this.lessonCount, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lessonCount > 0 ? '$lessonCount Lesson Entered' : 'Select Lesson',
          style: Constants.lessonCountStyle,
        ),
        Text(
          average >= 0 ? '${average.toStringAsFixed(2)}' : '0.0',
          style: Constants.averageStyle,
        ),
        Text(
          'Average',
          style: Constants.showAverageStyle,
        ),
      ],
    );
  }
}
