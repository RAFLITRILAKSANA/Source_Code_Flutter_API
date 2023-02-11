import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uas_rafli/apiservices.dart';
import 'package:uas_rafli/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Service serviceAPI = Service();
  late Future<List<cData>> listData;

  @override
  void initState() {
    //TODO: implement  initState
    super.initState();
    listData = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Data Genre"),
      ),
      body: Container(
        child: FutureBuilder<List<cData>>(
          future: listData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<cData> isiData = snapshot.data!;
              return ListView.builder(
                  itemCount: isiData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        subtitle: Text(isiData[index].cgenre),
                        title: Text(isiData[index].cname)
    
                        ),
                    );
                    
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    ));
  }
}
