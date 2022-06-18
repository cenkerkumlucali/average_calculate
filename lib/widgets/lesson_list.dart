import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/model/lesson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/helper.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;
  const LessonList({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLesson = Helper.getAllLesson;
    return allLesson.length > 0
        ? ListView.builder(
            itemCount: allLesson.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (value) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(allLesson[index].name),
                      leading: CircleAvatar(
                        backgroundColor: Constants.primaryColor,
                        child: Text(
                            (allLesson[index].letter * allLesson[index].credit)
                                .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          '${allLesson[index].credit} Credit, Grade Value ${allLesson[index].letter}'),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Text('Please Add Lesson',style: Constants.titleStyle.copyWith(fontSize: 20),),
          );
  }
}
