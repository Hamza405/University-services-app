import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../model/user.dart';
import '../../shared/constance.dart';

class SignupView extends StatefulWidget {
  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();

  var user = AuthCommand();
  final controller = Get.find<AuthController>();

  var password = '';
  var year = 'الأولى';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/bg2.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.purple.withOpacity(0.35),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 25.0),
                  const Center(
                    child: Text(
                      'كلية الهندسة',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Text(
                    'الميكانيكية',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'و الكهربائية',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    child: Card(
                      borderOnForeground: true,
                      elevation: 5,
                      shadowColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 25),
                        child: Obx(
                          () {
                            return Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'أنشئ حسابك الأن',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'الأسم',
                                    ),
                                    validator: (v) {
                                      if (v!.trim().isEmpty) {
                                        return 'الرجاء ادخال الأسم';
                                      }
                                      ;
                                      return null;
                                    },
                                    onSaved: (v) {
                                      user.name = v;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'البريد الالكتروني',
                                    ),
                                    textDirection: TextDirection.ltr,
                                    validator: (v) {
                                      if (v!.trim().isEmpty) {
                                        return 'الرجاء ادخال بريدك الالكتروني';
                                      }
                                      ;
                                      return null;
                                    },
                                    onSaved: (v) {
                                      user.email = v;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'الرقم الجامعي',
                                    ),
                                    validator: (v) {
                                      if (v!.trim().isEmpty) {
                                        return 'الرجاء ادخال الرقم الجامعي';
                                      }

                                      return null;
                                    },
                                    onChanged: (v) {
                                      user.num = v;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'كلمة المرور',
                                    ),
                                    validator: (v) {
                                      if (v!.trim().isEmpty) {
                                        return 'الرجاء ادخال كلمة المرور';
                                      }
                                      if (v.trim().length < 7) {
                                        return 'الرجاء ادخال اكثر من سبع محارف';
                                      }

                                      return null;
                                    },
                                    onChanged: (v) {
                                      user.password = v;
                                      password = v;
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'تاكيد كلمة المرور',
                                    ),
                                    validator: (v) {
                                      if (v!.trim().isEmpty) {
                                        return 'الرجاء تاكيد كلمة المرور';
                                      }
                                      if (v != password) {
                                        return 'الرجاء تاكيد كلمة المرور';
                                      }

                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'السنة:',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.3,
                                      ),
                                      Expanded(
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          alignment: Alignment.bottomCenter,
                                          items: <String>[
                                            'الأولى',
                                            'الثانية',
                                            'الثالثة',
                                            'الرابعه',
                                            'الخامسة'
                                          ].map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          value: year,
                                          onChanged: (v) {
                                            user.year = v == 'الأولى'
                                                ? '1'
                                                : v == 'الثانية'
                                                    ? '2'
                                                    : v == 'الثالثة'
                                                        ? '3'
                                                        : v == 'الرابعه'
                                                            ? '4'
                                                            : '5';
                                            year = v.toString();
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'القسم:',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.3,
                                      ),
                                      Expanded(
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          alignment: Alignment.bottomCenter,
                                          items: <String>[
                                            'حاسبات',
                                            'اتصالات',
                                            'ميكاترونكس',
                                            'طاقة',
                                          ].map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          value: user.section,
                                          onChanged: (v) {
                                            user.section = v;
                                            setState(() {});
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'الجنس:',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.3,
                                      ),
                                      Expanded(
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          alignment: Alignment.bottomCenter,
                                          items: <String>['ذكر', 'أنثى']
                                              .map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          value: user.gender,
                                          onChanged: (v) {
                                            user.gender = v;
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  controller.loading.isTrue
                                      ? SizedBox(
                                          height: size.height * 0.02,
                                        )
                                      : const SizedBox(),
                                  controller.loading.isTrue
                                      ? const LinearProgressIndicator()
                                      : const SizedBox(),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: controller.loading.isTrue
                                              ? 8.0
                                              : 16.0,
                                          bottom: 4.0),
                                      child: TextButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                              controller.signup(user).then(
                                                  (value) => value
                                                      ? Navigator
                                                          .pushReplacementNamed(
                                                              context,
                                                              homeRoute)
                                                      : null);
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.purple,
                                            ),
                                            height: 35,
                                            width: size.width * 0.4,
                                            child: const Center(
                                              child: Text(
                                                'انشئ حساب',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Center(
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context, '/login');
                                        },
                                        child: const Center(
                                          child: Text(
                                            'أملك حساب بالفعل',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.purple),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
