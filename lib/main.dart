import 'dart:ffi';

import 'package:flutter/material.dart';

import 'my_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  MyBloc bloc =new MyBloc();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void dispose(){
    bloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // lang nghe su kien khac
    bloc.counterStream.listen((event) {
      print(event.toString());
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            child: Center(
              child: StreamBuilder(
                stream: bloc.counterStream,
                builder: (context, snapshot) => Text(
                  snapshot.hasData ? snapshot.data.toString() : '0',
                  style: TextStyle(fontSize: 40, color: Colors.amber),
                ),
              ),
            ),
          ),

          // snackbar
         
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){bloc.increment();},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
