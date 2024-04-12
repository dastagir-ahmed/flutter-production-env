import 'package:environment_variables/services/http_util.dart';
import 'package:flutter/material.dart';

import 'model/job_model.dart';

Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dart backend'),
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
  JobModel? job;

  @override
  void didChangeDependencies() {
    myState();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  myState() async {
    job = await HttpUtil().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: job==null?Container():Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              job?.title ?? "Loading...", // Use null-ish coalescing operator
            ),
             const SizedBox(height: 5,),
             Text(
               job?.description ?? "Loading...", // Use null-ish coalescing operator
            ),

          ],
        ),
      ),
    );
  }
}
