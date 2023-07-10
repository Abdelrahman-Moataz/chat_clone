import 'package:clone_chat/Views/home_screen/home_screen.dart';
import 'package:clone_chat/consts/consts.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: letsConnect.text.black.fontFamily(bold).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Vx.gray400)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Vx.gray400)),
                    prefixIcon: const Icon(
                      Icons.phone_android_rounded,
                      color: Vx.gray600,
                    ),
                    labelText: "Phone Number",
                    prefixText: "+20",
                    hintText: "1012345678",
                    labelStyle: const TextStyle(
                      color: Vx.gray600,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              10.heightBox,
              otp.text.semiBold.size(16).make(),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: context.screenWidth - 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: bgColor,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () {
                      Get.to(() => const HomeScreen(),
                          transition: Transition.downToUp);
                    },
                    child: continueText.text.size(16).make(),
                  ),
                ),
              ),
              30.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
