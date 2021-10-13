import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maskdetector/app/routes/app.routes.dart';
import 'package:maskdetector/core/notifier/homeNotifier/home.notifer.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute),
    );
    Provider.of<HomeNotifer>(context, listen: false).loadModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.0,
            width: 400.0,
            child: Image.asset('assets/images/logo.png'),
          ),
          const SizedBox(
            height: 40.0,
          ),
          RichText(
            text: const TextSpan(
              text: 'Did ',
              style: TextStyle(
                fontSize: 20.0,
              ),
              children: [
                TextSpan(
                  text: 'You Wear ',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                TextSpan(
                  text: 'It ?',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
