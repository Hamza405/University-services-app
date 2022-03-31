import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/shared/constance.dart';

import '../../controller/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  final _formKey = GlobalKey<FormState>();
  var form = {'email': '', 'password': ''};

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.asset(
            'assets/images/bg1.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.purple.withOpacity(0.6),
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
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Card(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'تسجيل دخول',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      TextFormField(
                                        initialValue: '',
                                        textDirection: TextDirection.ltr,
                                        decoration: const InputDecoration(
                                          labelText: 'البريد الالكتروني',
                                        ),
                                        validator: (v) {
                                          if (v!.trim().isEmpty) {
                                            return 'الرجاء ادخال بريدك الالكتروني';
                                          }
                                          ;
                                          return null;
                                        },
                                        onSaved: (v) {
                                          form['email'] = v.toString();
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        initialValue: '',
                                        textDirection: TextDirection.ltr,
                                        decoration: const InputDecoration(
                                          labelText: 'كلمة المرور',
                                        ),
                                        validator: (v) {
                                          if (v!.trim().isEmpty) {
                                            return 'الرجاء ادخال كلمة المرور';
                                          }
                                          ;
                                          return null;
                                        },
                                        onSaved: (v) {
                                          form['password'] = v.toString();
                                        },
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
                                                  controller
                                                      .login(form['email']!,
                                                          form['password']!)
                                                      .then((value) => value
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                child: const Center(
                                                  child: Text(
                                                    'تسجيل دخول',
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
                                                context, '/signup');
                                          },
                                          child: const Text(
                                            'لا تملك حساب بعد ؟',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                fontSize: 15,
                                                color: Colors.purple),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ]),
                              );
                            },
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class LoginAnimation extends StatefulWidget {
  @override
  _LoginAnimationState createState() => _LoginAnimationState();
}

class _LoginAnimationState extends State<LoginAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1300), vsync: this);

    _positionAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(-2, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));

    _opacityAnimation =
        Tween<double>(begin: 0.9, end: 0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));

    Future.delayed(Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
          position: _positionAnimation,
          child: Text(
            'مرحبا بك',
            style: TextStyle(
                fontSize: 25, color: Colors.amber, fontWeight: FontWeight.bold),
          )),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
