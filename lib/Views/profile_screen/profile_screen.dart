import 'package:clone_chat/consts/consts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: profile.text.fontFamily(bold).make(),
        backgroundColor: transparent,
        elevation: 0.0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: btnColor,
                child: Stack(
                  children: [
                    Image.asset(icUser, color: white),
                    const Positioned(
                      right: 0,
                      bottom: 20,
                      child: CircleAvatar(
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.heightBox,
              const Divider(
                color: btnColor,
                height: 1,
              ),
              10.heightBox,
              ListTile(
                leading: const Icon(
                  icPerson,
                  color: white,
                ),
                title: TextFormField(
                  style: const TextStyle(color: white, fontSize: 14),
                  cursorColor: white,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: const Icon(
                      edite,
                      color: white,
                    ),
                    label: name.text.white.make(),
                    isDense: true,
                    labelStyle: const TextStyle(fontFamily: semiBold),
                  ),
                ),
                subtitle: nameSub.text.fontFamily(semiBold).gray400.make(),
              ),
              ListTile(
                leading: const Icon(
                  info,
                  color: white,
                ),
                title: TextFormField(
                  style: const TextStyle(color: white, fontSize: 14),
                  cursorColor: white,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: const Icon(
                      edite,
                      color: white,
                    ),
                    label: about.text.white.make(),
                    isDense: true,
                    labelStyle: const TextStyle(fontFamily: semiBold),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  call,
                  color: white,
                ),
                title: TextFormField(
                  style: const TextStyle(color: white, fontSize: 14),
                  readOnly: true,
                  cursorColor: white,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // suffixIcon: const Icon(
                    //   edite,
                    //   color: white,
                    // ),
                    label: phone.text.white.make(),
                    isDense: true,
                    labelStyle: const TextStyle(fontFamily: semiBold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
