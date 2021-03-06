import 'package:flutter/material.dart';
import 'package:university_services_app/shared/widgets/drawer.dart';
import 'package:university_services_app/view/study_program/widgets/years_widget.dart';

import '../../shared/widgets/appbar.dart';
import 'widgets/days_widget.dart';

class StudyProgramView extends StatelessWidget {
  const StudyProgramView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TAppBar(
          title: 'البرنامج الدراسي',
        ),
        drawer: const TDrawer(),
        body: SingleChildScrollView(
            child: Column(children: const [DaysWidget(), YearsWidget()])),
      ),
    );
  }
}
