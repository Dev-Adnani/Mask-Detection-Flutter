import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maskdetector/core/notifier/homeNotifier/home.notifer.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              RichText(
                text: const TextSpan(
                  text: "Let's ",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  children: [
                    TextSpan(
                      text: 'Check ',
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
              SizedBox(
                height: 200,
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey),
                    ),
                    child: const Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                    onPressed: () {
                      Provider.of<HomeNotifer>(context, listen: false)
                          .pickUserImage(
                              context: context, source: ImageSource.gallery);
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey),
                    ),
                    child: const Text(
                      'Camera',
                      style: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                    onPressed: () {
                      Provider.of<HomeNotifer>(context, listen: false)
                          .pickUserImage(
                              context: context, source: ImageSource.camera);
                    },
                  )
                ],
              ),
              Provider.of<HomeNotifer>(context, listen: true).getLoading == true
                  ? Column(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.file(
                              Provider.of<HomeNotifer>(context, listen: false)
                                  .getUserImage!),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          Provider.of<HomeNotifer>(context, listen: true)
                              .prediction
                              .toString()
                              .substring(2),
                          style: const TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Text(
                        //   'Confidence Level : ${Provider.of<HomeNotifer>(context, listen: false).prediction.toString()}',
                        //   style: const TextStyle(
                        //     color: Colors.white60,
                        //   ),
                        // ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
