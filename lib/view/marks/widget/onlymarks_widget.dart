import 'package:flutter/material.dart';

import '../../../model/mark.dart';

class Exercise extends StatelessWidget {
  final List<Mark> marks;
  const Exercise({Key? key, required this.marks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: const [
          DataColumn(label: Center(child: Text('المادة'))),
          DataColumn(label: Center(child: Text('النتيجة'))),
          DataColumn(label: Center(child: Text('تاريخ التقديم'))),
        ],
        rows: marks
            .map((e) => DataRow(cells: [
                  DataCell(Text(e.subjectName.toString())),
                  DataCell(Text(e.result.toString())),
                  DataCell(Text('${e.semester} ${e.year}')),
                ]))
            .toList());
  }
}
