import 'package:clone_chat/consts/consts.dart';
import 'package:flutter/services.dart';

import 'Views/signin_screen/signin_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "lato"),
      debugShowCheckedModeBanner: false,
      home: const ChatApp(),
      title: appName,
    );
  }
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      logo,
                      width: 120,
                    ),
                    appName.text.size(28).fontFamily(bold).make(),
                  ],
                )),
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      spacing: 10.0,
                      children: List.generate(listOfFeatures.length, (index) {
                        return Chip(
                            labelPadding: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 4),
                            backgroundColor: Colors.transparent,
                            side: const BorderSide(color: Vx.gray400),
                            label: listOfFeatures[index]
                                .text
                                .semiBold
                                .gray600
                                .make());
                      }),
                    ),
                    20.heightBox,
                    slogan.text
                        .size(38)
                        .fontFamily(bold)
                        .letterSpacing(2)
                        .make(),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      width: context.screenWidth - 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bgColor,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(16),
                        ),
                        onPressed: () {
                          Get.to(() => const SignInScreen(),
                              transition: Transition.downToUp);
                        },
                        child: cont.text.size(16).make(),
                      ),
                    ),
                    10.heightBox,
                    poweredBy.text.size(15).gray600.make(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
