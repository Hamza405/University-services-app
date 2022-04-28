import 'package:flutter/material.dart';
import 'package:university_services_app/shared/widgets/drawer.dart';

class StudyProgramView extends StatelessWidget {
  const StudyProgramView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('البرنامج الدراسي'),
      ),
      drawer: const TDrawer(),
      body: const Center(
        child: Text('البرنامج الدراسي'),
      ),
    );
  }
}
