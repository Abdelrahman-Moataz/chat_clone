import 'package:clone_chat/consts/consts.dart';
import 'package:clone_chat/sevices/store_services.dart';

class ComposeScreen extends StatelessWidget {
  const ComposeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: "New Message".text.fontFamily(semiBold).make(),
        backgroundColor: transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            color: white),
        child: StreamBuilder(
          stream: StoreServices.getAllUsers(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: snapshot.data!.docs.mapIndexed((currentValue, index) {
                var doc = snapshot.data!.docs[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: bgColor.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  NetworkImage("${doc['image_url']}"),
                            ),
                            20.widthBox,
                            "${doc['name']}"
                                .text
                                .fontFamily(semiBold)
                                .color(txtColor)
                                .make()
                          ],
                        ),
                        10.heightBox,
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          width: double.infinity,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(12),
                                  backgroundColor: bgColor),
                              onPressed: () {},
                              icon: const Icon(Icons.message),
                              label: "Message".text.make()),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
