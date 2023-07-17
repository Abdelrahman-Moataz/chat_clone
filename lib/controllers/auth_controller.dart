import 'package:clone_chat/Views/home_screen/home.dart';
import 'package:clone_chat/consts/consts.dart';

class AuthController extends GetxController {
  // text controller
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
  var otpController = List.generate(6, (index) => TextEditingController());

  // variables
  var isOTPSent = false.obs;
  var formKey = GlobalKey<FormState>();

  // auth variables
  late final PhoneVerificationCompleted phoneVerificationCompleted;
  late final PhoneVerificationFailed phoneVerificationFailed;
  late PhoneCodeSent phoneCodeSent;
  String verificationID = "";

  // send OTP method
  sendOTP() async {
    phoneVerificationCompleted = (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
    };
    phoneVerificationFailed = (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      }
    };
    phoneCodeSent = (String verificationId, int? resendToken) {
      verificationID = verificationId;
    };

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+2${phoneController.text}",
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print(e.toString());
    }
  }

  // verify OTP
  verifyOTP(context) async {
    String otp = "";

    // getting all textField data
    for (var i = 0; i < otpController.length; i++) {
      otp += otpController[i].text;
    }
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: otp);
      // getting user
      final User? user =
          (await auth.signInWithCredential(phoneAuthCredential)).user;

      if (user != null) {
        //store user into database
        DocumentReference store =
            FirebaseFirestore.instance.collection(collectionUser).doc(user.uid);
        await store.set(
          {
            'id': user.uid,
            'name': userNameController.text.toString(),
            'phone': phoneController.text.toString(),
            'about': '',
            'image_url': '',
          },
        );

        // showing toast of login
        VxToast.show(context, msg: loggedIn);
        Get.offAll(() => const HomeScreen(), transition: Transition.downToUp);
      }
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
