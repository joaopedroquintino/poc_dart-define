import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  const appName =
      String.fromEnvironment('DEFINE_APP_NAME', defaultValue: 'Flutter Demo');
  runApp(const MyApp(app: appName));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.app, super.key});

  final String app;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: app,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: app),
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
  String? package;
  String? appName;

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then(
      (value) => setState(() {
        package = value.packageName;
        appName = value.appName;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'DEFINE_APP_NAME: $appName',
            ),
            Text(
              'DEFINE_APP_ID: $package',
            ),
          ],
        ),
      ),
    );
  }
}
