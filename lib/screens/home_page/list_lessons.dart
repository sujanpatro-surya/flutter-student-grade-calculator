import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../modal/lesson.dart';
import 'grade_data.dart';

class LessonList extends StatelessWidget {
  const LessonList({required this.onDismiss, Key? key }) : super(key: key);
  final Function onDismiss;

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLessons = Grades.allLessons;
    return allLessons.isNotEmpty ? ListView.builder(
      itemCount:allLessons.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.horizontal,
          onDismissed: (_){
            onDismiss(index);
          },
          child: Padding(
            padding: const EdgeInsets.all(Constants.verticalPadding),
            child: Card(child:
              ListTile(
                title:Text(allLessons[index].name),
                leading: CircleAvatar(
                  backgroundColor: Constants.primary,
                  child: Text(Grades.getAverage().toStringAsFixed(2))),
                subtitle: Text('Grade Value: ${allLessons[index].grade}, Credit Value: ${allLessons[index].credit}')
              )
            ),
          ),
        );
      }
    ) :
    Center(
      child: Text(Constants.noLessonMessage, style: Constants.lessonStyle)
    );
  }
}
