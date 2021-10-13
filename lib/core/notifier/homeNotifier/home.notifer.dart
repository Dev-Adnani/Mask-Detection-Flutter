// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomeNotifer with ChangeNotifier {
  final ImagePicker picker = ImagePicker();
  File? userImage;
  File? get getUserImage => userImage;
  bool loading = false;
  bool? get getLoading => loading;
  // ignore: prefer_typing_uninitialized_variables
  late var prediction;

  Future loadModel() async {
    await Tflite.loadModel(
      model: 'assets/tflite/model_unquant.tflite',
      labels: 'assets/tflite/labels.txt',
    );
  }

  detectImage(File image) async {
    prediction = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.6,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    loading = false;
    notifyListeners();
  }

  Future pickUserImage(
      {required BuildContext context, required ImageSource source}) async {
    final pickedUserImage = await picker.pickImage(source: source);
    userImage = File(pickedUserImage!.path);
    print('Debug IT -> $userImage');

    if (userImage != null) {
      await detectImage(userImage!);
      print('Debug Check => $prediction');
      loading = true;
      notifyListeners();
    } else {
      loading = false;
      notifyListeners();
    }
  }
}
