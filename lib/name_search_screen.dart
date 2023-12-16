import 'package:flutter/material.dart';
import 'package:flutter_task/automatic_pass_gen_screen.dart';
import 'package:flutter_task/name_screen_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NameScreen extends GetView<NameScreenController> {
  NameScreen({super.key});
  NameScreenController controller = Get.put(NameScreenController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NameScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Welcome to Name screen page..."),
        ),
        body: controller.isProgress == true
            ? const Center(child: CircularProgressIndicator())
            : controller.listUserDetails.isEmpty == true
                ? const Center(
                    child: Text("No details found"),
                  )
                : Builder(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: TextFormField(
                              cursorColor: Colors.black12,
                              controller: controller.tecController,
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  fillColor: Colors.transparent,
                                  errorBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  border: InputBorder.none),
                            ),
                          ),
                          const Text(
                              "Here are the list of Names in ascending order.."),
                          const SizedBox(
                            height: 30,
                          ),
                          ListView.builder(
                              itemCount: controller.listUserDetails.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AutomaticPassGeneratorScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      " $index. ${controller.listUserDetails[index].name ?? ""}",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    );
                  }),
      );
    });
  }
}
