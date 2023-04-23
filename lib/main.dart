import 'package:flull_app/page_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(primaryColor: Colors.amber),
        home:const HomePage(),
      );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("HOME"),
          leading:const Icon(Icons.home),
          actions: [
            IconButton(
              onPressed: (){},
              icon:const Icon(Icons.upload_file)
            ),
            IconButton(
              onPressed: (){},
              icon:const Icon(Icons.settings)
            ),
            PopupMenuButton(
              icon:const Icon(Icons.share),
              itemBuilder: (context) => [
                const PopupMenuItem(child: Text("face"),),
                const PopupMenuItem(child: Text("instar")),
              ],
            )
          ],
          bottom:const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Align(
              alignment: Alignment.center,
              child: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.menu),),
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                ],
                isScrollable: true,
                indicatorColor: Colors.amber,
                indicator: ShapeDecoration (
                shape: UnderlineInputBorder (
                    borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                        style: BorderStyle.solid
                    )
                  ),
                  gradient: LinearGradient(colors: [Color(0xff0081ff), Color(0xff01ff80)])
                )
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("WELLCOME MY APP",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const MyLogin()));
                    Get.to(MyLogin());
                  },
                  label: const Text("NEXT"),
                  icon:const Icon(Icons.arrow_forward),
                )
              ],
            ),
          ),
          const Center(child: Text("bike")),
          const Center(child: Text("bike")),
        ]),
      )
    );
  }
}