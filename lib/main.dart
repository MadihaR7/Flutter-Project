import 'package:apiprovder/service/productprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider()..fetch()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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


  @override
  Widget build(BuildContext context) {
    var list=context.watch<ProductProvider>().plist;
    return Scaffold(
      appBar: AppBar(),
      body: context.watch<ProductProvider>().isloading?
      Center(child: CircularProgressIndicator()):
      ListView.builder(itemCount: list!.length,
        itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("${list[index].title}"),
          leading: CircleAvatar(child: Image.network("${list[index].thumbnail}"),),
        );
        },),
    );
  }
}
