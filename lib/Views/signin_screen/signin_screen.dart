import 'package:clone_chat/consts/consts.dart';
import 'package:clone_chat/controllers/controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

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
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    /// userName Field

                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return "Please enter your UserName";
                        }
                        return null;
                      },
                      controller: controller.userNameController,
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
                          labelText: userName,
                          hintText: "Alex Adem",
                          labelStyle: const TextStyle(
                            color: Vx.gray600,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    10.heightBox,

                    /// phone Field

                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 9) {
                          return "Please enter your Phone Number";
                        }
                        return null;
                      },
                      controller: controller.phoneController,
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
                          //prefixText: "+20",
                          hintText: "01012345678",
                          labelStyle: const TextStyle(
                            color: Vx.gray600,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),

              10.heightBox,
              otp.text.semiBold.size(16).gray400.make(),

              //OTP field

              Obx(
                () => Visibility(
                  visible: controller.isOTPSent.value,
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: 56,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: controller.otpController[index],
                            cursorColor: btnColor,
                            onChanged: (value) {
                              if (value.length == 1 && index <= 5) {
                                FocusScope.of(context).nextFocus();
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            style: const TextStyle(
                              fontFamily: bold,
                              color: btnColor,
                            ),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: bgColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: bgColor),
                              ),
                              hintText: "*",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

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
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        if (controller.isOTPSent.value == false) {
                          controller.isOTPSent.value = true;
                          await controller.sendOTP(context);
                        } else {
                          await controller.verifyOTP(context);
                        }
                      }

                      // Get.to(() => const HomeScreen(),transition: Transition.downToUp);
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
