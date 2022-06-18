import 'package:flutter/material.dart';

import '../model/lesson.dart';

class Helper {
  static List<String> _allLettersLesson() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _convertLetterToNote(String letter) {
    switch (letter) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLessonLetters() {
    return _allLettersLesson()
        .map(
          (letter) => DropdownMenuItem(
            child: Text(letter),
            value: _convertLetterToNote(letter),
          ),
        )
        .toList();
  }

  static List<int> _allCredit() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allLessonCredit() {
    return _allCredit()
        .map((item) => DropdownMenuItem(
              child: Text(item.toString()),
              value: item.toDouble(),
            ))
        .toList();
  }

  static List<Lesson> getAllLesson = [];

  static addLesson(Lesson lesson) {
    getAllLesson.add(lesson);
  }

  static double calculateAverage() {
    double totalNote = 0;
    double totalCredit = 0;
    getAllLesson.forEach((element) {
      totalNote += (element.credit * element.letter);
      totalCredit += element.credit;
    });
    return totalNote / totalCredit;
  }
}
