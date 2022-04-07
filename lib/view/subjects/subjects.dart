import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:university_services_app/controller/home_controller.dart';
import 'package:university_services_app/shared/widgets/progress_indicator.dart';

import '../../model/subject.dart';
import '../../shared/widgets/drawer.dart';

class SubjectsView extends GetView<HomeController> {
  const SubjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('المقررات الدراسية'),
        ),
        drawer: TDrawer(),
        body: Obx(() => controller.loading.isTrue
            ? const TProgressIndicator()
            : SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                    child: SubjectsTable(subjects: controller.subjects)),
              )),
      ),
    );
  }
}

class SubjectsTable extends StatelessWidget {
  final List<Subject> subjects;
  const SubjectsTable({Key? key, required this.subjects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: const [
          DataColumn(label: Center(child: Text('المادة'))),
          DataColumn(label: Center(child: Text('الفصل'))),
          DataColumn(label: Center(child: Text('السنة'))),
        ],
        rows: subjects
            .map((e) => DataRow(cells: [
                  DataCell(Text(e.name.toString())),
                  DataCell(
                      Text(e.semester == '1' ? 'الفصل الأول' : 'الفصل الثاني')),
                  DataCell(Text(e.year == '1'
                      ? 'السنة الأولى'
                      : e.year == '2'
                          ? 'السنة الثانية'
                          : e.year == '3'
                              ? 'السنة الثالثة'
                              : e.year == '4'
                                  ? 'السنة الرابعة'
                                  : 'السنة الخامسة')),
                ]))
            .toList());
  }
}
