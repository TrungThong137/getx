// hien thi thong tin
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:obx/controllers/information_controller.dart';
import 'package:obx/resources/strings.dart';
import 'package:obx/resources/widgets/common_widget.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final InformationController informationController=Get.put(InformationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(INFORMATION_INPUT),
        centerTitle: true,
      ),
      body: Container(
        padding:const EdgeInsets.all(10),
        child: Column(
          children: [
            informationWidget(lable: NAME, content: informationController.name.value),
            // dau gach ngang ------------- het trang
            const Divider(),
            informationWidget(lable: ZALO, content: informationController.zalo.value),
            const Divider(),
            informationWidget(lable: WEBSITE, content: informationController.website.value),
            const Divider(),
            informationWidget(lable: DESCRIPTION, content: informationController.description.value),
            const Divider()
          ],
        ),
      ),
    );
  }
}