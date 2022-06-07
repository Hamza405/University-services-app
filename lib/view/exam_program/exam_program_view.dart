import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/home_controller.dart';
import 'package:university_services_app/shared/widgets/drawer.dart';

import '../../shared/widgets/appbar.dart';

class ExamProgramView extends GetView<HomeController> {
  const ExamProgramView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final path = controller.exam.value.exam ?? '';
    return SafeArea(
        child: Scaffold(
            appBar: const TAppBar(
              title: 'البرنامج الامتحاني',
            ),
            drawer: const TDrawer(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // width: MediaQuery.of(context).size.width * 0.85,
                // height: MediaQuery.of(context).size.height * 0.85,
                child: Card(
                  child: controller.exam.value.exam != null
                      ? FullScreenWidget(
                          disposeLevel: DisposeLevel.Medium,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              path,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Center(child: Text('هنالك خطا ما لا يوجد صورة')),
                ),
              ),
            )));
  }
}
