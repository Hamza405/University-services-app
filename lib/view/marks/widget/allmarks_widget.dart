import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../model/mark.dart';

class MyMarks extends StatelessWidget {
  final List<Mark> marks;
  const MyMarks({Key? key, required this.marks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
          columns: const [
            DataColumn(label: Center(child: Text('المادة'))),
            DataColumn(label: Center(child: Text('النظري'))),
            DataColumn(label: Center(child: Text('العملي'))),
          ],
          rows: marks
              .map((e) => DataRow(cells: [
                    DataCell(Text(e.subjectName.toString())),
                    DataCell(Text(e.th.toString())),
                    DataCell(Text(e.pr.toString())),
                  ]))
              .toList()),
    );
  }
}
