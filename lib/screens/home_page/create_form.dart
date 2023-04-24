import 'package:flutter/material.dart';
import 'package:grade_calculator/screens/home_page/home_page.dart';

import '../../constants.dart';
import 'grade_data.dart';

Expanded createForm(
  GlobalKey<FormState> formKey,
  ValueSetter<String> onChangedName,
  ValueSetter<int?> onChangedGrade,
  ValueSetter<int?> onChangedCredit,
  ValueGetter<void> onPressedIcon
) {
  return Expanded(
      flex: Constants.formFlexFactor,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            createTextFormField(onChangedName),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Icon(Icons.grade),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
                    child: createGradeDropdown(onChangedGrade),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
                    child: createCreditDropdown(onChangedCredit),
                  ),
                ),
                IconButton(
                  onPressed: onPressedIcon,
                  icon: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Constants.primary,
                    size: Constants.iconSize
                  )
                )
              ],
            )
          ],
        ),
      )
  );
}

Widget createCreditDropdown(ValueSetter<int?> onChanged) {
  return Container(
    decoration: BoxDecoration(
      color: Constants.primary.shade100.withOpacity(Constants.fieldOpacity),
      borderRadius: BorderRadius.circular(Constants.borderRadius)
    ),
    child: DropdownButton(
      alignment: Alignment.center,
      hint: Text(Constants.creditHint, style: Constants.hintStyle),
      value: HomePage.selectedCredit,
      items: Grades.creditItems(),
      onChanged: onChanged,
    ),
  );
}

Widget createGradeDropdown(ValueSetter<int?> onChanged) {
  return Container(
    decoration: BoxDecoration(
      color: Constants.primary.shade100.withOpacity(Constants.fieldOpacity),
      borderRadius: BorderRadius.circular(Constants.borderRadius)
    ),
    child: DropdownButton(
      alignment: Alignment.center,
      hint: Text(Constants.gradeHint, style: Constants.hintStyle),
      value: HomePage.selectedGrade,
      items: Grades.letterGradeItems(),
      onChanged: onChanged,
    ),
  );
}

Padding createTextFormField(ValueSetter<String> onChangedName) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: Constants.horizontalPadding, vertical: Constants.verticalPadding),
    child: TextFormField(
      maxLength: Constants.maxLessonNameLength,
      onChanged: onChangedName,
      validator: (name) {
        if (name == null || name.trim().length < Constants.minLessonNameLength) {
          return Constants.nameErrorMessage;
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.borderRadius),
        ),
        hintText: Constants.lessonHint,
        filled: true,
        fillColor: Constants.primary.shade100
      ),
    ),
  );
}
