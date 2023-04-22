
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obx/resources/widgets/common_widget.dart';
import 'package:obx/controllers/information_controller.dart';
import 'package:obx/resources/strings.dart';
import 'information_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController nameController=TextEditingController();
  TextEditingController websiteController= TextEditingController();
  TextEditingController zaloController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  final inforController = Get.put(InformationController());

  @override
  void innitState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("INFORMATION_INPUT"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.all(10),
          child: Column(
            children: [
              // name input
              inputWidget(lable: NAME, hintText: NAME_INPUT, controller: nameController),
              inputWidget(lable: ZALO, hintText: ZALO_INPUT, controller: zaloController),
              inputWidget(lable: WEBSITE, hintText: WEBSITE_INPUT, controller: websiteController),
              inputWidget(lable: DESCRIPTION, hintText: DESCRIPTION_INPUT, controller: descriptionController),
              buttonWidget(lable: CONFIRM, colorButton: Colors.blue, colorText: Colors.white,
               onPress: (){
                inforController.updateInformation(
                  // update information to provider
                    name: nameController.text.obs,
                    zalo: zaloController.text.obs,
                    website: websiteController.text.obs, 
                    description: descriptionController.text.obs
                  // routing to information page
                );
                  Get.to(InformationPage());
               }
              )
            ],
          ),
        ),
      ),
    );
  }
}